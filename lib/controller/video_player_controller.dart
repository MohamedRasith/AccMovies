import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoController with ChangeNotifier {
  late VideoPlayerController videoPlayerController;

  late ChewieController chewieController;

  bool hasinitilaze = false;

  initialize(
      {required DataSourceType dataSourceType, required String url}) async {
    hasinitilaze = false;
    switch (dataSourceType) {
      case DataSourceType.asset:
        videoPlayerController = VideoPlayerController.asset(url);
        break;
      case DataSourceType.network:
        videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(url));
        break;
      case DataSourceType.file:
        videoPlayerController = VideoPlayerController.file(File(url));
        break;
      case DataSourceType.contentUri:
        videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(url));
        break;
    }

    await videoPlayerController.initialize();

    chewieController = await ChewieController(
        videoPlayerController: videoPlayerController,
        fullScreenByDefault: true,
        autoPlay: true,
        aspectRatio: 16 / 9);
    hasinitilaze = true;
    notifyListeners();
  }
}
