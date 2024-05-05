import 'package:chat_gpt_app/core/colors.dart';
import 'package:chat_gpt_app/core/text_styles.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: tealColor),
            onPressed: () {}),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: tealColor,
              ))
        ],
        backgroundColor: backgroundColor,
        title: Center(child: Text("New Chat", style: whiteTextStyle)),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);}