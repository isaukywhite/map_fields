import './languages.dart';

/// Class for configration map fields
class MapFieldsSettings {
  /// Constructor protect
  MapFieldsSettings._();

  /// instance of class
  static final instance = MapFieldsSettings._();

  /// variable language
  MapFieldsLanguages _language = MapFieldsLanguages.enUs;

  /// getter language
  MapFieldsLanguages get language => _language;

  /// set language
  void setLanguage(MapFieldsLanguages value) => _language = value;
}
