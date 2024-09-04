import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var heigh = MediaQuery.sizeOf(context).height;
    var wid = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: heigh * 1,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: heigh * 0.11,
            ),
            SizedBox(
              width: wid * 0.8,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 45,
                    fontFamily: 'Archi',
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                  pause: const Duration(milliseconds: 1200),
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Tic Tac Toe',
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              "assets/HD-wallpaper-tic-tac-toe-game-s-logo.jpg",
              height: heigh * 0.5,
              width: double.infinity,
            ),
            SizedBox(
              height: heigh * 0.05,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 38, 145, 187),
                  Color.fromARGB(255, 159, 38, 180),
                ]),
              ),
              width: wid * 0.9,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Archi',
                ),
                child: AnimatedTextKit(
                  pause: const Duration(seconds: 1),
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Start Your Game....',
                    ),
                  ],
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return const TikTakToeScreen();
                    }));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
