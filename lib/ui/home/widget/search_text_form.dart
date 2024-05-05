import 'package:chat_gpt_app/core/colors.dart';
import 'package:flutter/material.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      alignment: Alignment.topCenter,
      width: 500,
      height: 130,
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: lightBackgroundColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: tealColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: tealColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: tealColor, width: 3),
          ),
          suffixIcon: Icon(Icons.send, color: tealColor),
          hintText: 'Enter your message',
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        ),
      ),
    );
  }
}
