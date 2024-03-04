import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield(
      {super.key,
      this.maxline = 1,
      required this.textenable,
      required this.hint,
      required this.controlle});
  final int maxline;
  final String hint;
  final TextEditingController controlle;
  final bool textenable;
  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.textenable,
      controller: widget.controlle,
      maxLines: widget.maxline,
      decoration: InputDecoration(
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
