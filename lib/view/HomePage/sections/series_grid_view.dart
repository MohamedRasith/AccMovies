import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:acc_movies/model/MovieModel/movie_model.dart';
import 'package:acc_movies/utils/app_color.dart';
import 'package:acc_movies/utils/app_urls.dart';
import 'package:acc_movies/utils/extensions.dart';
import 'package:acc_movies/view/CustomWidget/image_from_url.dart';
import 'package:acc_movies/view/DetailPage/detail_page.dart';


class SeriesGridSection extends StatelessWidget {
  CardData? data;
  SeriesGridSection({this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.h),
          child: Container(
            padding: EdgeInsets.all(10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data?.cardName ?? "",
                  style: const TextStyle(color: movieSectionText, fontSize: 16,fontWeight: FontWeight.w500),
                ),
                const Text("See More", style: TextStyle(color: Colors.grey),)
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SeriesGrid(
            data: data,
          ),
        )
      ],
    );
  }
}

class SeriesGrid extends StatelessWidget {
  CardData? data;
  SeriesGrid({this.data});
  @override
  Widget build(BuildContext context) {
    List<ContentList>? series = data?.contentList;
    return Container(
      padding: EdgeInsets.only(left: 8.w),
      height: 240.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: series?.length ?? 0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
           
            mainAxisSpacing: 10, // Adjust this value as needed
            childAspectRatio: data?.aspectRatio?.convertToAspectRatio() ?? 1),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailPage(data: series?[index],)));
            },
            child: Container(
             
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 190.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Hero(
                          tag: series?[index].name ?? DateTime.now().toString(),
                          child: ImageFromUrl(forUrl: series?[index].imageUrl ?? invalidImage)),
                      ),
                      SizedBox(height: 8.h,),
                      Expanded(
                        child: Text(
                          series?[index].name ?? "",
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold,overflow: TextOverflow.fade),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.blue,
                              Colors.lightBlue,
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.paid,
                          size: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
