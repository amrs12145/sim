import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';

class AppOTPForm extends StatelessWidget {
  const AppOTPForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < 4; i++) ...{
            SizedBox(
              height: 60.sp,
              width: 60.sp,
              child: TextFormField(
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                onChanged: (value) {
                  value.length == 1
                      ? FocusScope.of(context).nextFocus()
                      : i != 0
                          ? FocusScope.of(context).previousFocus()
                          : null;
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textAlign: TextAlign.center,
                autofocus: i == 0 ? true : false,
                keyboardType: TextInputType.number,
                cursorColor: Colors.lightBlueAccent.withOpacity(.1),
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: AppColors.primary,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: AppDimensions.borderRadiusS,
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: AppDimensions.borderRadiusS,
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          }
        ],
      ),
    );
  }
}
