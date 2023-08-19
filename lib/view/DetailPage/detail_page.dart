import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:acc_movies/model/MovieModel/movie_model.dart';
import 'package:acc_movies/utils/app_urls.dart';
import 'package:acc_movies/view/CustomWidget/image_from_url.dart';
import 'package:acc_movies/view/DetailPage/video_page.dart';
import 'package:video_player/video_player.dart';

class DetailPage extends StatelessWidget {
  ContentList? data;
  DetailPage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: data?.name ?? DateTime.now().toString(),
              child: AspectRatio(
                aspectRatio: MediaQuery.of(context).orientation == Orientation.portrait ? 16/ 20 : 16/5,
                child: ImageFromUrl(forUrl: data?.imageUrl ?? invalidImage),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    data?.name ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: () {
                   
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> VideoPlayerView(url: videoUrl, dataSourceType: DataSourceType.network) ));   
                  },
                  child: Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black,
                          Colors.black12,
                        ],
                      ),
                    ),
                    child: Center(child: Text("Play"))
                  ),
                ),
                SizedBox(
                  width: 20.w,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
