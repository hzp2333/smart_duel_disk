abstract class ApiHelper {
  Future<T> doApiCall<T>(Future<T> Function() apiRequest);
}
