import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:acc_movies/controller/banner_controller.dart';
import 'package:acc_movies/controller/movie_list_controller.dart';
import 'package:acc_movies/controller/theme_controller.dart';
import 'package:acc_movies/controller/video_player_controller.dart';
import 'package:acc_movies/repository/movie_service.dart';
import 'package:acc_movies/utils/theme/app_theme.dart';
import 'package:acc_movies/view/HomePage/dashboard_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
 MovieService.instance.initialize();
  runApp(MyApp(currentTheme: savedThemeMode,));
}

class MyApp extends StatelessWidget {
  AdaptiveThemeMode? currentTheme;
   MyApp({super.key, required this.currentTheme});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeController()),
        ChangeNotifierProvider(create: (_) => BannerController()),
        ChangeNotifierProvider(create: (_)=> MovieListController()),
        ChangeNotifierProvider(create: (_)=> VideoController())

    
      ],
      child: AdaptiveTheme(
        initial: currentTheme ?? AdaptiveThemeMode.dark,
        light:ligthTheme ,
        dark: darkTheme,
      builder: (ligthTheme,darkTheme){
        
      return   ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child){
         context.read<ThemeController>().setCurrentTheme();
return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ligthTheme,
            darkTheme: darkTheme,
            home: const DashBoard()
          );
        }),
      );
      },
      ),
    );
  }
}

// flutter pub run build_runner build --delete-conflicting-outputs