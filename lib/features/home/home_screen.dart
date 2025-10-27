import 'package:flutter/material.dart';
import 'package:indicator_animation/features/widget/circleIconButton.dart';
import 'package:indicator_animation/features/widget/indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  int numOfDots = 4;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      {
        if(!mounted) return;
        setState(() {
          _selectedIndex = 0;
        });
      }
    });
    super.initState();
  }

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

                      CircleIconButton(
                        icon: Icons.arrow_back_ios_rounded,
                        onTap: () {
                          setState(() {
                            _selectedIndex = (_selectedIndex - 1 + numOfDots) % numOfDots;
                          });
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          spacing: 8,
                          children: List.generate(numOfDots,
                                (index) => Indicator(isActive: index == _selectedIndex,
                                  onAnimationComplete: () {
                                  setState(() {
                                  _selectedIndex = (_selectedIndex + 1) % numOfDots;
                                });
                              },
                            ),
                          ),
                        ),
                      ),

                      CircleIconButton(
                        icon: Icons.arrow_forward_ios_rounded,
                        onTap: () {
                          setState(() {
                            _selectedIndex = (_selectedIndex + 1) % numOfDots;
                          });
                        },
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

