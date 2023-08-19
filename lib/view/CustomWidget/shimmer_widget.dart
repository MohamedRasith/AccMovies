import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  double ? width;
  double ? height;
  ShimmerWidget({this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
    child:  Container(
      color: Colors.red.withOpacity(0.8),
      width: width ?? double.infinity,
      height: height ?? 200.h,
    ),
    baseColor:Colors.black,
    highlightColor: Colors.grey.withOpacity(0.5)
);
  }
}