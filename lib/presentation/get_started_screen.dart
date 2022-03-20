import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:music_mates_app/core/app_provider.dart';
import 'package:music_mates_app/core/constants.dart';
import 'package:music_mates_app/data/model/error.dart';
import 'package:music_mates_app/main.dart';
import 'package:music_mates_app/presentation/presentation_export.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png",
              width: 120,
              height: 120,
            ),
            AppSpacing.v24,
            Mutation(
              options: MutationOptions(
                document: gql(context.repository.createAccount()),
                onCompleted: (_) =>
                    Navigator.popAndPushNamed(context, Routes.home),
              ),
              builder: (RunMutation runMutation, QueryResult? result) {
                if (result != null) {
                  if (result.isLoading) {
                    return const LoadingSpinner();
                  }

                  if (result.hasException) {
                    context.showError(
                      ErrorModel.fromGraphError(
                        result.exception?.graphqlErrors ?? [],
                      ),
                    );
                  }
                }

                return GoogleButton(
                  onPressed: () => _googleButtonPressed(context, runMutation),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _googleButtonPressed(
      BuildContext context, RunMutation runMutation) async {
    final googleUser = await context.repository.googleLogin();

    if (googleUser == null) return;

    final userQueryResult = await context.graphQlClient.query(
      QueryOptions(
        document: gql(context.repository.fetchUserInfo()),
        variables: {'googleId': googleUser.id},
      ),
    );

    if (_containsUserInfo(userQueryResult)) {
      context.dataHolder.googleId = googleUser.id;
      Navigator.popAndPushNamed(context, Routes.home);
    } else {
      _createUserAccount(context, runMutation, googleUser);
    }
  }

  _containsUserInfo(QueryResult<dynamic> userQueryResult) =>
      userQueryResult.data?['userInfo'] != null;

  Future<void> _createUserAccount(BuildContext context,
      RunMutation<dynamic> runMutation, GoogleSignInAccount googleUser) async {
    final selectedArtistId = await _moveToSelectArtistScreen(context);

    if (selectedArtistId == null) return;
    context.dataHolder.googleId = googleUser.id;
    runMutation(
      {
        'name': googleUser.displayName,
        'googleId': googleUser.id,
        'imageUrl': googleUser.photoUrl!,
        'favouriteArtists': selectedArtistId,
      },
    );
  }

  Future<List<int>?> _moveToSelectArtistScreen(BuildContext context) async {
    final selectedArtist = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectFavouriteArtist(),
        fullscreenDialog: true,
      ),
    );

    if (selectedArtist == null) {
      context.showError(
        ErrorModel.fromString("Please select favourite artist"),
      );
    }

    return selectedArtist;
  }
}
