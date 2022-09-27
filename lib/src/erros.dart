import './languages.dart';
import './settings.dart';

/// Custom error for MapFields
abstract class MapFieldsError implements Exception {}

/// Erro for invalid json string or map.
class InvalidMapStringObjectError extends MapFieldsError {
  @override
  String toString() {
    switch (MapFieldsSettings.instance.language) {
      case MapFieldsLanguages.enUs:
        return 'This map is not a valid object';
      case MapFieldsLanguages.ptBr:
        return 'Este mapa não é um objeto válido';
    }
  }
}

/// Error for missing required field.
class MapFieldsErrorMissingRequiredField extends MapFieldsError {
  final String key;

  MapFieldsErrorMissingRequiredField(this.key);

  @override
  String toString() {
    switch (MapFieldsSettings.instance.language) {
      case MapFieldsLanguages.enUs:
        return 'Missing required field $key';
      case MapFieldsLanguages.ptBr:
        return 'Campo obrigatório ausente $key';
    }
  }
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
  String toString() {
    switch (MapFieldsSettings.instance.language) {
      case MapFieldsLanguages.enUs:
        return 'Unknown error on field $key - $exception';
      case MapFieldsLanguages.ptBr:
        return 'Erro desconhecido no campo $key - $exception';
    }
  }
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
  String toString() {
    switch (MapFieldsSettings.instance.language) {
      case MapFieldsLanguages.enUs:
        return 'Error on convert field $key - $value';
      case MapFieldsLanguages.ptBr:
        return 'Erro ao converter campo $key - $value';
    }
  }
}
