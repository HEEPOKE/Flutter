import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final Function onPressed;
  final String label;

  const CommonElevatedButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(label),
    );
  }
}
