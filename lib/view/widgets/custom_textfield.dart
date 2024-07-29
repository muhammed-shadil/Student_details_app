import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String? Function(String?)? validator;
  const CustomTextfield(
      {super.key,
      this.maxline = 1,
      this.label,
      required this.textenable,
      required this.hint,
      required this.controlle, this.validator,});
  final int maxline;
  final String? label; 
  final String hint;
  final TextEditingController controlle;
  final bool textenable;
  
  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      readOnly: widget.textenable,
      controller: widget.controlle,
      maxLines: widget.maxline,
      decoration: InputDecoration(
        hintText: widget.hint,labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
