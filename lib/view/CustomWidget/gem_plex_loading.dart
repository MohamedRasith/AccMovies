import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class GemPlexPlaceHolder extends StatelessWidget {
  const GemPlexPlaceHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          width: double.infinity,
          height: 200.h,
          child: Center(
              child: Text(
            "ACC Movies",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ),
        baseColor: Theme.of(context).colorScheme.background,
        highlightColor: Colors.grey);
  }
}