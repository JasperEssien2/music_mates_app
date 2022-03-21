import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:music_mates_app/data/data_export.dart';
import 'package:music_mates_app/presentation/widgets/export.dart';

class QueryWrapper extends StatelessWidget {
  const QueryWrapper({
    Key? key,
    required this.queryString,
    required this.contentBuilder,
    this.variables,
  }) : super(key: key);
  final Map<String, dynamic>? variables;
  final String queryString;
  final Widget Function(Map<String, dynamic> data) contentBuilder;

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(queryString),
        variables: variables ?? const {},
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.isLoading) {
          return const LoadingSpinner();
        }
      
        if (result.hasException) {
          
          return AppErrorWidget(
            error: ErrorModel.fromString(
              result.exception.toString(),
            ),
          );
        }

        return contentBuilder(result.data ?? {});
      },
    );
  }
}
