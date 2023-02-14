import "package:flutter/material.dart";
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import 'Global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
}

class vedioPlayer extends StatefulWidget {
  const vedioPlayer({Key? key}) : super(key: key);

  @override
  State<vedioPlayer> createState() => _vedioPlayerState();
}

class _vedioPlayerState extends State<vedioPlayer> {


  late VideoPlayerController vedioPlayercontroller;
  late ChewieController chewieController;

  loadVideo() async {
    vedioPlayercontroller = VideoPlayerController.asset(Global.link);

    await vedioPlayercontroller.initialize();
    setState(() {});
    chewieController = ChewieController(
        videoPlayerController: vedioPlayercontroller,
        autoPlay: true,
        allowFullScreen: true,
        fullScreenByDefault: true,
        looping: true);
  }

  @override
  void initState() {
    loadVideo();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
    vedioPlayercontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
        appBar: AppBar(
          title: Text("${data['title']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.redAccent),),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: AspectRatio(
          aspectRatio: vedioPlayercontroller.value.aspectRatio,
          child: Chewie(controller: chewieController),
        )
    );
  }
}
