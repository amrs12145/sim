import 'package:flutter/material.dart';
import 'package:sim/presentation/screens/reset/new_password.dart';
import 'package:sim/presentation/screens/reset/reset.dart';
import 'package:sim/presentation/screens/reset/verify.dart';

import 'presentation/screens/landing.dart';
import 'presentation/screens/login.dart';
import 'presentation/screens/sign_up.dart';

class MyRoutes {
  static const Widget homeScreen = LandingScreen();
  static Widget loginScreen = LoginScreen();
  static Widget signUpScreen = SignUpScreen();
  static const Widget resetScreen = ResetScreen();
  static const Widget verificationScreen = VerificationScreen();
  static const Widget newPasswordScreen = NewPasswordScreen();
}
