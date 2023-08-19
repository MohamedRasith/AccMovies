import 'package:flutter/material.dart';
import 'package:acc_movies/model/MovieModel/movie_model.dart';
import 'package:acc_movies/repository/movie_service.dart';

class BannerController with ChangeNotifier {
  SeriesModl? bannerData;
/// Gets banner list from the server
  getBannerData() async {
    bannerData = await MovieService.instance.getMovieBannerList();
    notifyListeners();
  }


/// gets banner list from 1st index of the model
  List<ContentList> getBannerList() {
    List<ContentList>? cardData = [];
    if (((bannerData?.data?.length ?? 0) > 0)) {
      cardData = bannerData?.data?[0].contentList;
    }
    return cardData ?? [];
  }
}
