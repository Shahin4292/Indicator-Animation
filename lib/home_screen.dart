import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _leftPressed = false;
  bool _rightPressed = false;
  int _selectedIndex = 0;
  int numOfDots = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: 20,
                child: Column(children: [

                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F9),
                    borderRadius: BorderRadius.all(Radius.circular(80)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Material(
                        color: const Color(0xFFDAD9E4),
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTapDown: (_) => setState(() => _leftPressed = true),
                          onTapCancel: () => setState(() => _leftPressed = false),
                          onTapUp: (_) => setState(() => _leftPressed = false),
                          onTap: () {
                            setState(() {
                              _selectedIndex = (_selectedIndex - 1 + numOfDots) % numOfDots;
                            });
                          },
                          customBorder: const CircleBorder(),
                          splashColor: Colors.black.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: _leftPressed ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          spacing: 8,
                          children: List.generate(numOfDots,
                                (index) => Indicator(isActive: index == _selectedIndex,
                              // onAnimationComplete: () {
                              //   setState(() {
                              //     _selectedIndex =
                              //         (_selectedIndex + 1) % numOfDots;
                              //   });
                              // },
                            ),
                          ),
                        ),
                      ),

                      Material(
                        color: const Color(0xFFDAD9E4),
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTapDown: (_) => setState(() => _rightPressed = true),
                          onTapCancel: () => setState(() => _rightPressed = false),
                          onTapUp: (_) => setState(() => _rightPressed = false),
                          onTap: () {
                            setState(() {
                              _selectedIndex = (_selectedIndex + 1) % numOfDots;
                            });
                          },
                          customBorder: const CircleBorder(),
                          splashColor: Colors.black.withOpacity(0.3),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: _rightPressed ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),]),
              ),
            ],
          )),
    );
  }
}


class Indicator extends StatelessWidget {
  const Indicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: isActive ? 48 : 12,
      height: 12,
      decoration: BoxDecoration(
        color: Color(0XFFDAD9E4),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          duration: Duration(seconds: 3),
          width: isActive ? 46 : 0,
          child: Container(
            decoration: BoxDecoration(
                color: isActive ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
          ),
        ),
      ),
    );
  }
}

