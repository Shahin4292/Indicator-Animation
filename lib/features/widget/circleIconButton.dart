
import 'package:flutter/material.dart';

class CircleIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  State<CircleIconButton> createState() => _CircleIconButtonState();
}

class _CircleIconButtonState extends State<CircleIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFDAD9E4),
      shape: const CircleBorder(),
      child: InkWell(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapCancel: () => setState(() => _isPressed = false),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTap: widget.onTap,
        customBorder: const CircleBorder(),
        splashColor: Colors.black.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(
            widget.icon,
            color: _isPressed ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
