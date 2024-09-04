import 'package:flutter/material.dart';

class TikTakToeScreen extends StatefulWidget {
  const TikTakToeScreen({super.key});

  @override
  State<TikTakToeScreen> createState() => _TikTakToeScreenState();
}

class _TikTakToeScreenState extends State<TikTakToeScreen> {
  String playerX = "X";
  String player0 = "0";
  late String currentP;
  late bool gameEnd;
  late List<String> occupyBox;
  @override
  void initState() {
    initlize();
    super.initState();
  }

  void initlize() {
    currentP = playerX;
    gameEnd = false;
    occupyBox = ["", "", "", "", "", "", "", "", ""];
  }

  void restartGame() {
    setState(() {
      initlize();
    });
  }

  void win() {
    List<List<int>> winPositions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var element in winPositions) {
      String winPos0 = occupyBox[element[0]];
      String winPos1 = occupyBox[element[1]];
      String winPos2 = occupyBox[element[2]];
      if (winPos1.isNotEmpty) {
        if (winPos0 == winPos1 && winPos1 == winPos2 && winPos0 == winPos2) {
          showScaff("Player $winPos0 Won...");
          //  print(winPos1);
          gameEnd = true;
          return;
        }
      }
    }
  }

  showScaff(String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      "Game Over $msg",
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 20, fontFamily: "Archi", color: Colors.white),
    )));
  }

  @override
  Widget build(BuildContext context) {
    var heigh = MediaQuery.sizeOf(context).height;
    var wid = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 14, 14),
      body: Column(
        children: [
          SizedBox(
            height: heigh * 0.08,
          ),
          Row(
            children: [
              SizedBox(
                width: wid * 0.01,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              SizedBox(
                width: wid * 0.1,
              ),
              Text(
                "Player $currentP turn",
                style: const TextStyle(
                    color: Colors.white, fontFamily: "Archi", fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: heigh * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: heigh * 0.5,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 5,
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      if (gameEnd || occupyBox[index].isNotEmpty) {
                        return;
                      }

                      setState(() {
                        occupyBox[index] = currentP;
                        if (currentP == playerX) {
                          currentP = player0;
                          win();
                        } else {
                          currentP = playerX;
                          win();
                        }
                      });
                    },
                    child: Container(
                      // height: 8,
                      // width: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: occupyBox[index].isEmpty
                            ? Colors.white.withOpacity(0.8)
                            : occupyBox[index] == playerX
                                ? const Color.fromARGB(255, 139, 139, 139)
                                : const Color.fromARGB(255, 75, 75, 75),
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          occupyBox[index],
                          style: const TextStyle(
                              fontSize: 39,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Archi"),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: heigh * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                restartGame();
              },
              child: Container(
                height: heigh * 0.05,
                width: wid * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white.withOpacity(0.8),
                ),
                child: const Center(
                  child: Text(
                    "Restart",
                    style: TextStyle(
                      fontFamily: "Archi",
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
