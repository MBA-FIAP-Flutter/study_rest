import 'package:study_rest/model/repo_general.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:study_rest/model/repo_unique.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('users/{user}/repos')
  Future<List<RepoGeneral>> getRepoGeneral(@Path('user') String user);

  @GET('repos/{user}/{repo}')
  Future<RepoUnique> getRepoUnique(
      @Path('user') String user,
      @Path('repo') String repo);
}