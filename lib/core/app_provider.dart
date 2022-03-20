import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:music_mates_app/data/data_export.dart';
import 'package:music_mates_app/presentation/app_data_holder.dart';

class ProviderEntity {
  ProviderEntity({required this.repository, required this.dataHolder});

  final MusicMateRepository repository;
  final AppDataHolder dataHolder;
}

class AppProvider extends InheritedWidget {
  const AppProvider({Key? key, required this.entity, required Widget child})
      : super(key: key, child: child);

  final ProviderEntity entity;

  static ProviderEntity of(BuildContext context) {
    final InheritedElement? element =
        context.getElementForInheritedWidgetOfExactType<AppProvider>();
    assert(element != null, 'No AppProvider found in context');
    return (element!.widget as AppProvider).entity;
  }

  @override
  bool updateShouldNotify(AppProvider oldWidget) => entity != oldWidget.entity;
}

extension AppProviderExtension on BuildContext {
  MusicMateRepository get repository => AppProvider.of(this).repository;

  AppDataHolder get dataHolder => AppProvider.of(this).dataHolder;

  GraphQLClient get graphQlClient => GraphQLProvider.of(this).value;

  void showError(ErrorModel error) {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      var theme = Theme.of(this);
      ScaffoldMessenger.of(this).showMaterialBanner(
        MaterialBanner(
          backgroundColor: theme.colorScheme.primary,
          contentTextStyle:
              theme.textTheme.headline5!.copyWith(color: Colors.white),
          content: Text(error.error),
          actions: [
            InkWell(
              onTap: () => ScaffoldMessenger.of(this).clearMaterialBanners(),
              child: const Icon(Icons.close, color: Colors.white),
            )
          ],
        ),
      );
    });
  }
}
