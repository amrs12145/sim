import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';

class MyOTPForm extends StatelessWidget {
  const MyOTPForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < 4; i++) ...{
            SizedBox(
              height: 68,
              width: 64,
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primary,
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
                decoration: const InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: MyColors.onPrimary,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: MyDimensions.borderAll,
                    borderSide: BorderSide(
                      color: Colors.lightBlueAccent,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: MyDimensions.borderAll,
                    borderSide: BorderSide(
                      color: Colors.grey,
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
