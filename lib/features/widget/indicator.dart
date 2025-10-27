import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key, required this.isActive, this.onAnimationComplete});
  final bool isActive;
  final VoidCallback? onAnimationComplete;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      duration: Duration(milliseconds: 900),
      curve: Curves.elasticOut,
      width: isActive ? 48 : 12,
      height: 12,
      decoration: BoxDecoration(
        color: Color(0XFFDAD9E4),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          onEnd: (){
            if(isActive){
              onAnimationComplete?.call();
            }
          },
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