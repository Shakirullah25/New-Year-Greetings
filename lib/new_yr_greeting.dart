import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:new_year_greeting/custom_confetti_widget.dart';

class NewYrGreetings extends StatefulWidget {
  final String title;

  const NewYrGreetings({
    this.title = "F E S T I V E  G R E E T I N G S",
    super.key,
  });

  @override
  State<NewYrGreetings> createState() => _NewYrGreetingsState();
}

class _NewYrGreetingsState extends State<NewYrGreetings> {
  late final ConfettiController confettiControllerTopCenter;
  late final ConfettiController confettiControllerTopLeft;
  late final ConfettiController confettiControllerTopRight;
  late final AudioPlayer audioPlayer;

  void _playCelebratoryMusic() async {
    try {
      await audioPlayer.play(
        AssetSource(
            "lib/asset/sound/happy-mood-and-ukulele-version-60s-9895.mp3"),
      );
      print("Music is playing!");
    } catch (e) {
      print("error playing the music: $e");
    }
  }

  void celebrate() {
    if (confettiControllerTopCenter.state == ConfettiControllerState.stopped) {
      confettiControllerTopCenter.play();
    } else {
      confettiControllerTopCenter.stop();
    }

    if (confettiControllerTopLeft.state == ConfettiControllerState.stopped) {
      confettiControllerTopLeft.play();
    } else {
      confettiControllerTopLeft.stop();
    }

    if (confettiControllerTopRight.state == ConfettiControllerState.stopped) {
      confettiControllerTopRight.play();
    } else {
      confettiControllerTopRight.stop();
    }
  }

  @override
  void initState() {
    confettiControllerTopCenter =
        ConfettiController(duration: Duration(seconds: 5));
    confettiControllerTopRight =
        ConfettiController(duration: Duration(seconds: 5));
    confettiControllerTopLeft =
        ConfettiController(duration: Duration(seconds: 5));
    audioPlayer = AudioPlayer();
    _playCelebratoryMusic();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
    confettiControllerTopCenter.dispose();
    confettiControllerTopLeft.dispose();
    confettiControllerTopRight.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // implementing animated text in the appbar that fades in and out with sparkle effect
      appBar: AppBar(
        elevation: 0.0,
        title: Column(
          children: [
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FadeAnimatedText(
                  widget.title,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: "Rubik",
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FadeAnimatedText(
                  "F R O M  S H A K I R U L L A H",
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: "Rubik",
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        toolbarHeight: 80,
        backgroundColor: Colors.red,
        centerTitle: true,
      ),

      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.red,
                    Color(int.parse('0xFFFFD700')),
                  ],
                ),
              ),
            ),
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final size = constraints.maxWidth * 0.05;
                  return Padding(
                    padding: constraints.maxWidth > 600
                        ? const EdgeInsets.only(top: 150.0)
                        : const EdgeInsets.only(top: 130.0),
                    child: Text(
                      "Happy New Year!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final screenWidth = constraints.maxWidth;
                  final size = screenWidth * 0.05;
                  return Padding(
                    padding: constraints.maxWidth > 600
                        ? const EdgeInsets.only(top: 300.0)
                        : const EdgeInsets.only(top: 250.0),
                    child: Text(
                      "Cheers to new beginnings!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size,
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: LayoutBuilder(
            //     builder: (context, constraints) {
            //       final size = constraints.maxWidth * 0.05;
            //       return Padding(
            //         padding: constraints.maxWidth > 600
            //             ? const EdgeInsets.only(top: 280.0)
            //             : const EdgeInsets.only(top: 200.0),
            //         child: AnimatedTextKit(
            //           isRepeatingAnimation: false,
            //           animatedTexts: [
            //             TyperAnimatedText(
            //               "Aim higher and shine brighter!",
            //               textStyle: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: size.toDouble(),
            //                 fontFamily: "Rubik",
            //                 fontWeight: FontWeight.bold,
            //               ),
            //               speed: const Duration(milliseconds: 100),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Align(
              alignment: Alignment.center,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double buttonWidth = constraints.maxWidth * 0.40;
                  final double buttonHeight = constraints.maxHeight * 0.10;
                  final double textSize = constraints.maxWidth * 0.035;
                  final double paddingTop = constraints.maxWidth * 0.5;

                  // final double positionRight = constraints.maxWidth * 0.32;

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: GestureDetector(
                      onTap: celebrate,
                      child: Container(
                        width: buttonWidth,
                        height: buttonHeight,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(
                                int.parse('0xFFFFD700'),
                              ),
                              Colors.red,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Text(
                          "Click to Celebrate!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: textSize,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomConfettiWidget(
              confettiController: confettiControllerTopCenter,
              alignment: Alignment.topCenter,
              blastDirection: pi / 2,
            ),
            CustomConfettiWidget(
              confettiController: confettiControllerTopRight,
              alignment: Alignment.topRight,
              blastDirection: pi / 4,
            ),
            CustomConfettiWidget(
              confettiController: confettiControllerTopLeft,
              alignment: Alignment.topLeft,
              blastDirection: -pi / 6,
            ),
          ],
        ),
      ),
    );
  }
}
