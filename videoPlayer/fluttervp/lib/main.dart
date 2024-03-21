// import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:video_player/video_player.dart';
import 'package:loading_btn/loading_btn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final FlickManager flickManager = FlickManager(
  //   videoPlayerController: VideoPlayerController?.networkUrl(Uri(
  //     path: 'https://youtu.be/ebfV2J4lso4',
  //   )),
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Center(
        child: AspectRatio(
          aspectRatio: 16 / 20,
          //   child: FlickVideoPlayer(flickManager: flickManager),

          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingBtn(
                  height: 50,
                  child: const Text(
                    'login',
                    style: TextStyle(color: Colors.white),
                  ),
                  borderRadius: 8,
                  animate: true,
                  color: Colors.brown,
                  width: MediaQuery.of(context).size.width * .45,
                  loader: Container(
                    padding: const EdgeInsets.all(10),
                    width: 40,
                    height: 40,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  onTap: (((startLoading, stopLoading, btnState) async {
                    if (btnState == ButtonState.idle) {
                      startLoading();
                      await Future.delayed(const Duration(seconds: 5));
                      stopLoading();
                    }
                  })),
                ),
                const SizedBox(
                  height: 50,
                ),
                LoadingBtn(
                  height: 50,
                  child: const Text(
                    'login',
                    style: TextStyle(color: Colors.white),
                  ),
                  borderRadius: 8,
                  animate: false,
                  roundLoadingShape: false,
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width * .45,
                  loader: const Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: (((startLoading, stopLoading, btnState) async {
                    if (btnState == ButtonState.idle) {
                      startLoading();
                      await Future.delayed(const Duration(seconds: 5));
                      stopLoading();
                    }
                  })),
                ),
                const SizedBox(
                  height: 50,
                ),
                LoadingBtn(
                  height: 50,
                  child: const Text(
                    'login',
                    style: TextStyle(color: Colors.white),
                  ),
                  borderRadius: 8,
                  animate: true,
                  color: Colors.deepOrange,
                  width: MediaQuery.of(context).size.width * .45,
                  loader: Container(
                      padding: const EdgeInsets.all(10),
                      child: const SpinKitDoubleBounce(
                        color: Colors.white,
                      )),
                  onTap: (((startLoading, stopLoading, btnState) async {
                    if (btnState == ButtonState.idle) {
                      startLoading();
                      await Future.delayed(const Duration(seconds: 5));
                      stopLoading();
                    }
                  })),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
