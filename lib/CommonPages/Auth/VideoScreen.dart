import 'package:flutter/material.dart';
import 'package:rise_up/CommonPages/Auth/CategoryScreen.dart';
import '../../Colors.dart';
import 'package:video_player/video_player.dart';
import '../../lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class VideoScreen extends StatefulWidget {
  const VideoScreen

  ({super.key});

  @override
  State<StatefulWidget> createState() => StartState();

}
class StartState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  //initialize the video controller
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _initializeVideoPlayerFuture = _controller.initialize();
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: const BackButton(
            color: orangeColor // <-- SEE HERE
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.75,
                width: MediaQuery.of(context).size.width*0.9,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: VideoPlayer(_controller)
                ),
              ),
              Center(
                    child: FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        // Wrap the play or pause in a call to `setState`. This ensures the
                        // correct icon is shown.
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      // Display the correct icon depending on the state of the player.
                      child: Icon(
                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
              ),

            ],

          ),
          SizedBox(
            height: MediaQuery.of(context).size.width*0.08, // <-- SEE HERE
          ),
          Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(navyColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                          )
                      )
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const CategoryScreen()),
                    );
                  },
                  child:  Text(
                    LocaleKeys.VideoScreen_btnNext.tr(),
                    style:const TextStyle(
                      color: whiteColor,
                      fontFamily: "Lucida Sans",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}