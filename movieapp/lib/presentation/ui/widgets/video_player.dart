



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerVideoAndPopPage extends StatefulWidget {
  final String url;

  const PlayerVideoAndPopPage({super.key, required this.url});
  @override
  PlayerVideoAndPopPageState createState() => PlayerVideoAndPopPageState();
}

class PlayerVideoAndPopPageState extends State<PlayerVideoAndPopPage> {
  late YoutubePlayerController _controller;



  @override
  void initState() {
 
    super.initState();
_controller =  YoutubePlayerController(
    initialVideoId: widget.url,
    flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
    ),
);
   

 }

  @override
  void dispose() {
    _controller.dispose();
      SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
    super.dispose();
  }

 
 

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child:YoutubePlayerBuilder(
    player: YoutubePlayer(bottomActions: [   ElevatedButton(onPressed: (){
                Navigator.pop(context);
               }, child: const  Text("Done"))],
        controller: _controller,onEnded: (metaData) {
            Navigator.pop(context);
        },
    ),
    builder: (context, player){
        return Stack(
            children: [
                // some widgets
                player,
            
            ],
        );
    },
),
        

      ),
    );
  }
  }