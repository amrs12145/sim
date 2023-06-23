import 'package:flutter/material.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';

import '../../../../data/models/student_info.dart';
import '../../../widgets/expandable_card.dart';

class ScoreTab extends StatelessWidget {
  const ScoreTab(this.details, {super.key});

  final StudentInfoDetails details;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: AppDimensions.padding,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppDimensions.vSpacing,
              ...buildBar('CGPA', details.cgpa, 4),
              AppDimensions.vSpacingS,
              ...buildBar('Completed Hours', details.tCredit ?? 57, 132),
              AppDimensions.vSpacing,
              ExpandableCard(
                isExpanded: true,
                title: Text(
                  'Acdemic Standing',
                  textAlign: TextAlign.center,
                  style: textTheme.headline2?.copyWith(
                    color: Colors.blue.shade700,
                  ),
                ),
                children: [
                  ...buildBar('Mandatory University', details.manUniv, 10),
                  AppDimensions.vSpacingS,
                  ...buildBar('Elective University', 6, 6),
                  AppDimensions.vSpacingS,
                  ...buildBar('Mandatory SIM', details.manSim, 32),
                  AppDimensions.vSpacingS,
                  ...buildBar('Elective SIM', 55, 88),
                  AppDimensions.vSpacingS,
                  ...buildBar('Free Elective', 4, 4),
                ],
              ),
              AppDimensions.vSpacing,
              ExpandableCard(
                isExpanded: true,
                title: Text(
                  'Acdemic Score',
                  textAlign: TextAlign.center,
                  style: textTheme.headline2?.copyWith(
                    color: Colors.blue.shade700,
                  ),
                ),
                children: details.termsGpa.keys.map((key) {
                  final _key = '${key.characters.last} Semster GPA';
                  return Column(
                    children: buildBar(_key, details.termsGpa[key], 4),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildBar(String title, num? value, num max) => [
        Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        Padding(
          padding: AppDimensions.paddingS,
          child: ClipRRect(
            borderRadius: AppDimensions.borderRadiusS,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                  width: double.infinity,
                  child: LinearProgressIndicator(
                    value: (value ?? 0) / max,
                    backgroundColor: Colors.white,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF2377CF),
                    ),
                  ),
                ),
                Text(
                  '${value?.toStringFixed(2)} out of $max',
                  style: const TextStyle(color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ];
}
