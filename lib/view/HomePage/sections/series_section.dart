import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:acc_movies/controller/movie_list_controller.dart';
import 'package:acc_movies/model/MovieModel/movie_model.dart';
import 'package:acc_movies/view/CustomWidget/series_grid_shimmer.dart';
import 'package:acc_movies/view/HomePage/sections/series_grid_view.dart';
import 'package:provider/provider.dart';

class SeriesSection extends StatelessWidget {
  const SeriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieListController>(builder: (context, controller, _) {
      if (controller.movieList == null) {
        return Column(
          children: [
            for (int i = 0; i < 4; i++) ...[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: GridShimmer(),
              )
            ]
          ],
        );
      } else {
        List<CardData>? series = controller.movieList?.data;
        return Column(
          children: [
            for (int i = 0; i < (series?.length ?? 0); i++) ...[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: SeriesGridSection(
                  data: series?[i],
                ),
              )
            ]
          ],
        );
      }
    });
  }
}
