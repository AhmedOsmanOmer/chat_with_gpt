import 'package:chat_gpt_app/core/colors.dart';
import 'package:chat_gpt_app/core/extension.dart';
import 'package:chat_gpt_app/core/spacing_widgets.dart';
import 'package:chat_gpt_app/routing/routes.dart';
import 'package:chat_gpt_app/ui/started/widget/grid_view.dart';
import 'package:chat_gpt_app/ui/started/widget/start_chat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Starting extends StatefulWidget {
  const Starting({super.key});

  @override
  State<Starting> createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(50),
            Center(
              child: Image.asset(
                'assets/bot.png',
                scale: 1.2.sp,
              ),
            ),
            InkWell(
                onTap: () {
                  context.pushNamed(Routes.homeScreen);
                },
                child: const StartChatButton()),
            verticalSpace(20),
            const MyGridView()
          ],
        ),
      ),
    );
  }
}
