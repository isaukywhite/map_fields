abstract class MapFieldsError implements Exception {}

class MapFieldsErrorMissingRequiredField extends MapFieldsError {
  final String key;

  MapFieldsErrorMissingRequiredField(this.key);

  @override
  String toString() => 'Missing required field $key';
}

class UnknownErrorMapFieldsError extends MapFieldsError {
  final String key;
  final Object exception;

  UnknownErrorMapFieldsError(
    this.key,
    this.exception,
  );

  @override
  String toString() => 'Unknown error on field $key - $exception';
}

class InvalidMapStringObjectError extends MapFieldsError {
  @override
  String toString() => 'This map is not a valid object';
}

class ConvertMapStringFieldError extends MapFieldsError {
  final String key;
  final dynamic value;

  ConvertMapStringFieldError(
    this.key,
    this.value,
  );

  @override
  String toString() => 'Error on convert field $key - $value';
}
