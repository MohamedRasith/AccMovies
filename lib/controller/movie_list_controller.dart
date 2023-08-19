import 'package:flutter/material.dart';
import 'package:acc_movies/model/MovieModel/movie_model.dart';
import 'package:acc_movies/repository/movie_service.dart';

class MovieListController with ChangeNotifier {
  SeriesModl? movieList;

  getMovieList() async {
    movieList = await MovieService.instance.getMovieList();
    notifyListeners();
  }
}
