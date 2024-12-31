import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ten_twenty_test_project/core/constants/helper%20widgets/custom_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerPlayer extends StatefulWidget {
  const MovieTrailerPlayer({super.key, required this.videoId});
  final String videoId;

  @override
  State<MovieTrailerPlayer> createState() => _MovieTrailerPlayerState();
}

class _MovieTrailerPlayerState extends State<MovieTrailerPlayer> {
  late YoutubePlayerController _controller;
  bool _screenPopped = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

    _controller.addListener(() {
      if (_controller.value.playerState == PlayerState.ended) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!_screenPopped) {
            _screenPopped = true;
            Get.back();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Trailer'),
        actions: [
          GestureDetector(
            onTap: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown
              ]);
              Get.back();
            },
            child: CustomButton(
              text: 'Done',
              width: 40.w,
              height: 40.h,
              fontSize: 6.sp,
            ),
          ),
        ],
      ),
      body: Center(
        child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
            ),
            builder: (context, player) {
              return player;
            }),
      ),
    );
  }
}
