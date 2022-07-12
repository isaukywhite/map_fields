/// Custom error for MapFields
abstract class MapFieldsError implements Exception {}

/// Erro for invalid json string or map.
class InvalidMapStringObjectError extends MapFieldsError {
  @override
  String toString() => 'This map is not a valid object';
}

/// Error for missing required field.
class MapFieldsErrorMissingRequiredField extends MapFieldsError {
  final String key;

  MapFieldsErrorMissingRequiredField(this.key);

  @override
  String toString() => 'Missing required field $key';
}

/// Unknown error for MapFields.
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

/// Error on converting value.
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
