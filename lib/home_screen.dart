import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(
        children: [

          FlutterLogo(size: 64),

          Text(
            "Flutter Logo",
            style: TextTheme.of(context).titleMedium,
          ),

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
                    onTapDown: (_) => setState(() => _isPressed = true),
                    onTapCancel: () => setState(() => _isPressed = false),
                    onTapUp: (_) => setState(() => _isPressed = false),
                    customBorder: const CircleBorder(),
                    splashColor: Colors.black.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: _isPressed ? Colors.white : Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      )),
    );
  }
}
