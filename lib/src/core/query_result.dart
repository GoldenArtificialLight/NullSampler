// Uma classe para padronizar os retornos dos services
class QueryResult<T> {
  final bool wasSuccesful;
  final T? content;
  final String? message;

  const QueryResult({required this.wasSuccesful, this.content, this.message});
}
