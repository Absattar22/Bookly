import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/repos/home_repo_implementaion.dart';
import 'package:bookly/features/search/data/repos/search_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementaion>(
    HomeRepoImplementaion(getIt.get<ApiService>(),),
  );

  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(
      apiService: getIt.get<ApiService>(),
    ),
  );
}
