// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    Key? key,
    required this.title,
    required this.onPressed, required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * .57,
            MediaQuery.of(context).size.height * .1),
        padding: const EdgeInsets.all(10),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
           icon,
            color: Colors.black,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
