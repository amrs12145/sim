import 'package:flutter/material.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';

class ScoreTab extends StatelessWidget {
  const ScoreTab(this.cgpa, this.completedHours, {super.key});

  final double cgpa;
  final double completedHours;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(204, 197, 199, 0.2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppDimensions.vSpacing,
            Padding(
              padding: AppDimensions.paddingS,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 20.0,
                      width: double.infinity,
                      child: LinearProgressIndicator(
                        value: cgpa / 4,
                        backgroundColor: Colors.white,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF2377CF),
                        ),
                      ),
                    ),
                    Text(
                      '${cgpa.toStringAsFixed(1)} out of 4',
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
            AppDimensions.vSpacing,
            const Text(
              'completed hours',
              style: TextStyle(color: Colors.black),
            ),
            AppDimensions.vSpacing,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 20.0,
                      width: double.infinity,
                      child: LinearProgressIndicator(
                        value: completedHours / 132,
                        backgroundColor: Colors.white,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF2377CF),
                        ),
                      ),
                    ),
                    Text(
                      '${(completedHours).toInt()}',
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
