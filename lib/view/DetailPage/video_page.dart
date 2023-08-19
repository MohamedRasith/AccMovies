

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:acc_movies/controller/video_player_controller.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    super.key,
    required this.url,
    required this.dataSourceType,
  });

  final String url;

  final DataSourceType dataSourceType;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  @override
  void initState() {
    super.initState();

    context
        .read<VideoController>()
        .initialize(dataSourceType: widget.dataSourceType, url: widget.url);
  }

  @override
  void dispose() {
    context.read<VideoController>().chewieController.pause();
    context.read<VideoController>().chewieController.dispose();
     context.read<VideoController>().videoPlayerController.pause();
    
    context.read<VideoController>().videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        dispose();
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<VideoController>(builder: (context, controller, _) {
                if (controller.hasinitilaze) {
                  return AspectRatio(
                    aspectRatio: MediaQuery.of(context).orientation == Orientation.portrait ? 16/ 9 : 16/5,
                    child: Chewie(controller: controller.chewieController),
                  );
                } else {
                  return Expanded(
                      child: Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
