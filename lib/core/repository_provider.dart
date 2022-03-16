import 'package:flutter/material.dart';
import 'package:music_mates_app/domain/repository.dart';

class RepositoryProvider extends InheritedWidget {
  const RepositoryProvider(
      {Key? key, required this.repository, required Widget child})
      : super(key: key, child: child);

  final MusicMateRepository repository;

  static MusicMateRepository of(BuildContext context) {
    final InheritedElement? element =
        context.getElementForInheritedWidgetOfExactType<RepositoryProvider>();
    assert(element != null, 'No RepositoryProvider found in context');
    return (element!.widget as RepositoryProvider).repository;
  }

  @override
  bool updateShouldNotify(RepositoryProvider oldWidget) =>
      repository != oldWidget.repository;
}

extension RepositoryProviderExtension on BuildContext{

  MusicMateRepository get repository => RepositoryProvider.of(this);
}
