import 'package:flutter/material.dart';
import 'package:sim/presentation/screens/auth/new_password.dart';
import 'package:sim/presentation/screens/auth/forget_password.dart';
import 'package:sim/presentation/screens/auth/reset_password.dart';
import 'package:sim/presentation/screens/auth/verify.dart';

import 'presentation/screens/auth/landing.dart';
import 'presentation/screens/auth/login.dart';
import 'presentation/screens/auth/sign_up.dart';

class MyRoutes {
  static const Widget landingScreen = LandingScreen();
  static Widget loginScreen = LoginScreen();
  static Widget signUpScreen = SignUpScreen();
  static const Widget forgetPasswordScreen = ForgetPasswordScreen();
  static const Widget verificationScreen = VerificationScreen();
  static const Widget newPasswordScreen = NewPasswordScreen();
  static  Widget resetPasswordScreen = ResetPasswordScreen();
}
