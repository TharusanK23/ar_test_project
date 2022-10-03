// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppLanguage _$AppLanguageFromJson(Map<String, dynamic> json) => AppLanguage(
      displayName: json['displayName'] as String?,
      languageCode: json['languageCode'] as String?,
      id: json['id'] as int?,
      languageName: json['languageName'] as String?,
    );

Map<String, dynamic> _$AppLanguageToJson(AppLanguage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'languageName': instance.languageName,
      'displayName': instance.displayName,
      'languageCode': instance.languageCode,
    };
