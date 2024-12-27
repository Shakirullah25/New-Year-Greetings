import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

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
  late final ConfettiController confettiController;
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

  @override
  void initState() {
    confettiController = ConfettiController(duration: Duration(seconds: 30));
    confettiController.play();
    audioPlayer = AudioPlayer();
    _playCelebratoryMusic();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
    confettiController.dispose();
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
                  final size = constraints.maxWidth > 600
                      ? constraints.maxWidth * 0.04
                      : constraints.maxWidth * 0.04;
                  return Text(
                    "Happy New Year!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final size = constraints.maxWidth > 600
                      ? constraints.maxWidth * 0.04
                      : constraints.maxWidth * 0.04;
                  return Padding(
                    padding: constraints.maxWidth > 600
                        ? const EdgeInsets.only(top: 150.0)
                        : const EdgeInsets.only(top: 100.0),
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
            Align(
              alignment: Alignment.center,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final size = constraints.maxWidth > 600
                      ? constraints.maxWidth * 0.04
                      : constraints.maxWidth * 0.06;

                  final paddingTop = constraints.maxWidth > 600 ? 300 : 200;
                  return Padding(
                    padding: 
                    EdgeInsets.only(top: paddingTop.toDouble()),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          "This year, aim higher and shine brighter!",
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: size,
                            fontFamily: "Rubik",
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                emissionFrequency: 0.05,
                shouldLoop: true,
                numberOfParticles: 80,
                maxBlastForce: 10,
                minBlastForce: 5,
                gravity: 0.3,
                colors: [
                  Colors.black,
                  Colors.white,
                  Colors.red,
                  Color(int.parse('0xFFFFD700')),
                  Colors.purple,
                  Colors.green,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
