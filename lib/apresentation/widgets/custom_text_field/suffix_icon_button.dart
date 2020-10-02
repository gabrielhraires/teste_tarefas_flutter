import 'package:flutter/material.dart';

class SuffixIconButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onTap;

  SuffixIconButton({
    @required this.icon,
    @required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Icon(icon),
          onTap: onTap,
        ),
      ),
    );
  }
}
