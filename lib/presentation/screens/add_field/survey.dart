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
        'question': 'How much do you like field.name',
        'answers': ['Paris', 'Berlin', 'Rome', 'Madrid'],
      },
      {
        'question': 'Who painted the Mona Lisa?',
        'answers': [
          'Michelangelo',
          'Leonardo da Vinci',
          'Pablo Picasso',
          'Vincent van Gogh'
        ],
      },
      {
        'question': 'What is the tallest mountain in the world?',
        'answers': [
          'Mount Kilimanjaro',
          'Mount Everest',
          'Mount Fuji',
          'Matterhorn'
        ],
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
            name: 'Amr',
            date: DateTime.now(),
          ),
          if (currentQuestion < quizData.length) ...[
            Text(
              quizData[currentQuestion]['question'],
              style: const TextStyle(fontSize: 24),
            ),
            AppDimensions.vSpacing,
            Column(
              children: _buildAnswerButtons(
                quizData[currentQuestion]['answers'],
              ),
            ),
          ],
          const Spacer(),
          ElevatedButton(
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
            child: const Text('data'),
          ),
          AppDimensions.vSpacing,
          AppDimensions.vSpacing,
        ],
      ),
    );
  }

  List<Widget> _buildAnswerButtons(List<String> answers) {
    List<Widget> buttons = [];
    for (var i = answers.length - 1; i >= 0; i--) {
      buttons.add(
        SizedBox(
          width: 200,
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
            child: Text(answers[i]),
          ),
        ),
      );
      buttons.add(AppDimensions.vSpacing);
    }
    return buttons;
  }
}
