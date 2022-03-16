import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:music_mates_app/domain/repository.dart';
import 'package:music_mates_app/presentation/data_controller.dart';

class ProviderEntity {
  ProviderEntity({required this.repository, required this.dataController});

  final MusicMateRepository repository;
  final AppDataController dataController;
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

  AppDataController get dataController => AppProvider.of(this).dataController;

  GraphQLClient get graphQlClient => GraphQLProvider.of(this).value;
}
