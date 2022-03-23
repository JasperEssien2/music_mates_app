import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:music_mates_app/data/data_export.dart';
import 'package:music_mates_app/presentation/widgets/export.dart';

class QueryWrapper<T> extends StatelessWidget {
  const QueryWrapper({
    Key? key,
    required this.queryString,
    required this.contentBuilder,
    required this.dataParser,
    this.variables,
  }) : super(key: key);
  final Map<String, dynamic>? variables;
  final String queryString;
  final Widget Function(T data) contentBuilder;
  final T Function(Map<String, dynamic> data) dataParser;
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        fetchPolicy: FetchPolicy.cacheAndNetwork,
        document: gql(queryString),
        variables: variables ?? const {},
        parserFn: dataParser,
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

        return contentBuilder(result.parserFn(result.data ?? {}));
      },
    );
  }
}
