import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerPage extends StatefulWidget {
  const YoutubePlayerPage({Key? key}) : super(key: key);

  @override
  State<YoutubePlayerPage> createState() => _YoutubePlayerPageState();
}

class _YoutubePlayerPageState extends State<YoutubePlayerPage> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'B0FgrYBE4uY',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
            ),
            builder: (context, player) {
              return Column(
                children: [
                  // some widgets
                  player,
                  //some other widgets
                ],
              );
            }),
      ),
    );
  }
}
