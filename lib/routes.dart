import 'package:flutter/material.dart';
import 'package:sim/presentation/screens/auth/new_password.dart';
import 'package:sim/presentation/screens/auth/forget_password.dart';
import 'package:sim/presentation/screens/auth/reset_password.dart';
import 'package:sim/presentation/screens/auth/verify.dart';
import 'package:sim/presentation/screens/home/home.dart';
import 'package:sim/presentation/screens/profile/profile.dart';

import 'presentation/screens/auth/landing.dart';
import 'presentation/screens/auth/login.dart';
import 'presentation/screens/auth/sign_up.dart';

class AppRoutes {
  static const Widget landing = LandingScreen();
  static const Widget login = LoginScreen();
  static const Widget signUp = SignUpScreen();
  static const Widget forgetPassword = ForgetPasswordScreen();
  static const Widget verification = VerificationScreen();
  static const Widget newPassword = NewPasswordScreen();
  static const Widget resetPassword = ResetPasswordScreen();
  static const Widget home = HomeScreen();
  static const Widget profile = ProfileScreen();
}
