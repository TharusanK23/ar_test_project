import 'package:ar_test_project/routes/main_index.dart';

part 'language.g.dart';

@JsonSerializable()

class AppLanguage {
  final int? id;
  final String? languageName;
  final String? displayName;
  final String? languageCode;

  AppLanguage({
    this.displayName,
    this.languageCode,
    this.id,
    this.languageName,
  });

  factory AppLanguage.fromJson(Map<String, dynamic> json) => _$AppLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$AppLanguageToJson(this);
}
