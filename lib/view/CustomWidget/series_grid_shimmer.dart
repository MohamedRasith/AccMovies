import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:acc_movies/view/CustomWidget/shimmer_widget.dart';

class GridShimmer extends StatelessWidget {
   
   GridShimmer();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.h),
          child: Container(
            padding: EdgeInsets.all(10.h),
            child: ShimmerWidget(
              width: 50.w,
              height: 10.h,
            )
          ),
        ),

        SeriesGrid()
        
      ],
    );
  }
}



class SeriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.h),
      height: 200.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // Adjust this value as needed
         childAspectRatio: 4/3
        ),
        itemBuilder: (context, index) {
        
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Theme.of(context).colorScheme.background),

            child: ShimmerWidget(),   
             
             
            ),
          );
        },
      ),
    );
  }
}