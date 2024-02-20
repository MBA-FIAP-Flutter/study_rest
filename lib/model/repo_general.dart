import 'package:json_annotation/json_annotation.dart';

part 'repo_general.g.dart';

@JsonSerializable()
class RepoGeneral {
  const RepoGeneral({this.id, this.name, this.fork, this.language});

  factory RepoGeneral.fromJson(Map<String, dynamic> json) => _$RepoGeneralFromJson(json);

  final int? id;
  final String? name;
  final bool? fork;
  final String? language;

  Map<String, dynamic> toJson() => _$RepoGeneralToJson(this);
}