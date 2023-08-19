import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:acc_movies/view/HomePage/sections/banner_section.dart';
import 'package:acc_movies/view/HomePage/sections/series_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10.h,),
        const BannerSection(),

       const SeriesSection()
      ],
    );
  }
}