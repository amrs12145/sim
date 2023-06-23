// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';

import '../../../data/models/field.dart';
import '../../../data/net/profile.dart';
import '../../widgets/custom_app_bar.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen(this.field, {super.key});
  final Field field;

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  // Sample quiz questions and answers
  late List<Map<String, dynamic>> quizData;

  @override
  void initState() {
    quizData = [
      {
        'question': 'How much do you like ${widget.field.name}',
        'answers': [
          'Not at all',
          'Sometimes',
          'Likely',
          'Very Likely',
        ],
      },
      {
        'question':
            'When was the last time you used ${widget.field.name} tools?',
        'answers': ['Never', 'not often', 'a week ago', 'Today'],
      },
      {
        'question': 'Do you ${widget.field.name} in your freetime?',
        'answers': ['Never', 'Nearly no', 'not Often', 'Often'],
      },
    ];
    super.initState();
  }

  int currentQuestion = 0;
  double score = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            name: 'Ziad',
            date: DateTime.now(),
          ),
          if (currentQuestion < quizData.length) ...[
            AppDimensions.vSpacing,
            Text(
              quizData[currentQuestion]['question'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
            const Spacer(),
            Column(
              children: _buildAnswerButtons(
                quizData[currentQuestion]['answers'],
              ),
            ),
          ],
          const Spacer(),
          Padding(
            padding: AppDimensions.padding,
            child: ElevatedButton(
              onPressed: () async {
                await ProfileService.removeField(widget.field.name);
                await QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: widget.field.name,
                  confirmBtnColor: AppColors.danger,
                  text: 'Removed Successfully',
                );
                AppNav.pop(context, true);
              },
              child: const Text('Next'),
            ),
          ),
          AppDimensions.vSpacingS,
        ],
      ),
    );
  }

  List<Widget> _buildAnswerButtons(List<String> answers) {
    List<Widget> buttons = [];
    for (var i = answers.length - 1; i >= 0; i--) {
      buttons.add(
        SizedBox(
          width: 330,
          child: ElevatedButton(
            onPressed: () async {
              setState(
                () {
                  score += (i / (answers.length - 1)) / quizData.length;
                  currentQuestion++;
                },
              );

              if (currentQuestion == quizData.length) {
                await ProfileService.addField(widget.field.name, score);
                await QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  title: widget.field.name,
                  confirmBtnColor: AppColors.success,
                  text: 'Added to your Favorite Successfully',
                );
                AppNav.pop(context, true);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: (i == 3)
                  ? AppColors.primary
                  : (i == 2)
                      ? AppColors.primary.withOpacity(.8)
                      : (i == 1)
                          ? AppColors.primary.withOpacity(.6)
                          : AppColors.primary.withOpacity(.3),
            ),
            child: Text(answers[i]),
          ),
        ),
      );
      buttons.add(AppDimensions.vSpacing);
    }
    return buttons;
  }
}
