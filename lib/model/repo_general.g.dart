// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_general.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoGeneral _$RepoGeneralFromJson(Map<String, dynamic> json) => RepoGeneral(
      id: json['id'] as int?,
      name: json['name'] as String?,
      fork: json['fork'] as bool?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$RepoGeneralToJson(RepoGeneral instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fork': instance.fork,
      'language': instance.language,
    };
