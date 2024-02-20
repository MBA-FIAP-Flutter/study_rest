import 'package:json_annotation/json_annotation.dart';

part 'repo_unique.g.dart';

@JsonSerializable()
class RepoUnique {
  const RepoUnique({this.watchersCount, this.openIssuesCount, this.forksCount, this.subscribersCount});

  factory RepoUnique.fromJson(Map<String, dynamic> json) => _$RepoUniqueFromJson(json);

  @JsonKey(name: 'watchers_count')
  final int? watchersCount;

  @JsonKey(name: 'open_issues_count')
  final int? openIssuesCount;

  @JsonKey(name: 'forks_count')
  final int? forksCount;

  @JsonKey(name: 'subscribers_count')
  final int? subscribersCount;

  Map<String, dynamic> toJson() => _$RepoUniqueToJson(this);
}