import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:acc_movies/model/MovieModel/movie_model.dart';
import 'package:acc_movies/utils/app_urls.dart';

class MovieService {
  MovieService._();

  static MovieService instance = MovieService._();
  Dio dio = Dio();

  initialize() {
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print,
      retries: 3,
      retryDelays: const [
        Duration(seconds: 1),
        Duration(seconds: 5),
        Duration(seconds: 10),
      ],
    ));
  }

  Future<SeriesModl?> getMovieList() async {
    Response response = await dio.get(getMovieListApi);

    try {
      SeriesModl data = SeriesModl.fromJson(response.data);
      return data;
    } catch (e) {
      return null;
    }
  }

 Future<SeriesModl?>  getMovieBannerList() async {
    Response response = await dio.get(getBannerApi);

    try {
      SeriesModl data = SeriesModl.fromJson(response.data);
      return data;
    } catch (e) {
      return null;
    }
  }
}
