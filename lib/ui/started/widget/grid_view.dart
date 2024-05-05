import 'package:chat_gpt_app/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> iconsList = [
      'assets/poem.png', // Icons.note_alt,
      'assets/translate.png', //Icons.translate,
      'assets/code.png', //Icons.code,
      'assets/email.png', //Icons.email_outlined,
      'assets/recipe.png', //Icons.receipt_long,
      'assets/correct.png', //Icons.note,
      'assets/solve.png', //Icons.report_problem,
      'assets/business.png', //Icons.add_business,
      'assets/summery.png', //Icons.textsms_sharp
    ];
    List<String> labelList = [
      'Write a poem',
      'Translate Anything',
      'Write a Code',
      'Write an Email',
      'Give me Recipe',
      'Correct Text',
      'Solve a Problem',
      'Business ideas',
      'Summarize text'
    ];
    return GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: List.generate(labelList.length, (index) {
          return Container(
            padding: EdgeInsets.all(5.w),
            margin: EdgeInsets.all(10.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.w),
                border: Border.all(color: tealColor, width: 3.w)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                iconsList[index],
                scale: 9.sp,
              ),
              Text(
                textAlign: TextAlign.center,
                labelList[index],
                style: const TextStyle(color: Colors.white),
              )
            ]),
          );
        }));
  }
}
