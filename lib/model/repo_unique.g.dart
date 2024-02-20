// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_unique.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoUnique _$RepoUniqueFromJson(Map<String, dynamic> json) => RepoUnique(
      watchersCount: json['watchers_count'] as int?,
      openIssuesCount: json['open_issues_count'] as int?,
      forksCount: json['forks_count'] as int?,
      subscribersCount: json['subscribers_count'] as int?,
    );

Map<String, dynamic> _$RepoUniqueToJson(RepoUnique instance) =>
    <String, dynamic>{
      'watchers_count': instance.watchersCount,
      'open_issues_count': instance.openIssuesCount,
      'forks_count': instance.forksCount,
      'subscribers_count': instance.subscribersCount,
    };
