
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:acc_movies/controller/banner_controller.dart';
import 'package:acc_movies/utils/app_urls.dart';
import 'package:acc_movies/view/CustomWidget/image_from_url.dart';
import 'package:acc_movies/view/CustomWidget/shimmer_widget.dart';
import 'package:acc_movies/view/DetailPage/detail_page.dart';
import 'package:provider/provider.dart';


class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BannerController>(builder: (context, controller, _) {
      if (controller.bannerData == null) {
        return Container(
            width: double.infinity,
            height: 200.h,
            child: Container(
              child: Center(
                child: ShimmerWidget(),
              ),
            ));
      } else {
        return FlutterCarousel(
          options: CarouselOptions(
            floatingIndicator: false,
            autoPlay: true,
            viewportFraction: 1.0,
            aspectRatio:  MediaQuery.of(context).orientation == Orientation.portrait ? 16/ 9 : 16/5,
            showIndicator: true,
            slideIndicator: CircularSlideIndicator(
              indicatorBackgroundColor: Colors.grey,
                indicatorRadius: 4, currentIndicatorColor: Colors.green),
          ),
          items: controller.getBannerList().map((i) {
            return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailPage(data: i,)));
              },
              child: Hero(
                tag: i.name ?? DateTime.now().toString(),
                child: ImageFromUrl(forUrl: i.imageUrl ?? invalidImage,)));
          }).toList(),
        );
      }
    });
  }
}




