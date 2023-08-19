import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:acc_movies/controller/banner_controller.dart';
import 'package:acc_movies/controller/movie_list_controller.dart';

import 'package:acc_movies/utils/theme/theme_switch.dart';
import 'package:acc_movies/view/HomePage/Tabs/tabs_barrel.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<BannerController>().getBannerData();
    context.read<MovieListController>().getMovieList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        title: Text(
          "ACC Movies",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.secondary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).colorScheme.secondary,
              ))
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "ACC Movies",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20),
              ),
            ),
            ListTile(
              title: Text(
                "Theme",
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              trailing: themeSwitch(),
            )
          ],
        ),
      ),
      body: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              TabBar(
                  onTap: (index) {
                    print(index);
                  },
                  unselectedLabelColor: Theme.of(context).colorScheme.secondary,
                  indicatorColor: Colors.green,
                  labelColor: Colors.green,
                  labelPadding: EdgeInsets.symmetric(vertical: 6.h),
                  indicatorPadding: EdgeInsets.only(top: 8.h),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Text(
                      "Home",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text("Originals", style: TextStyle(fontSize: 16)),
                    Text(
                      "Movies",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Videos",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Musics",
                      style: TextStyle(fontSize: 16),
                    ),
                  ]),
              const Expanded(
                  child: TabBarView(children: [
                    HomePage(),
                    NoRecords(),
                    NoRecords(),
                    NoRecords(),
                    NoRecords()
                  ]))
            ],
          )),
    );
  }
}
