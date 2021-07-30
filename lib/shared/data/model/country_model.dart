class CountryModel {
  String code;
  String name;
  String callingCode;

  CountryModel.fromJson(dynamic json) {
    name = json['name'] as String;
    callingCode = json['dial_code'] as String;
    code = json['code'] as String;
  }
}
