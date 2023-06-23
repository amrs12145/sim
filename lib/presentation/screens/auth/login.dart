// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/core/validators.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/password_field.dart';
import 'package:sim/routes.dart';
import '../../../buisness_logic/cubit/login/cubit.dart';
import '../../../constants/dimensions.dart';

import '../../widgets/input_field.dart';
import '../../widgets/loading.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formLoginKey = GlobalKey<FormState>();
    final textTheme = Theme.of(context).textTheme;
    final prov = context.read<LoginCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppDimensions.padding,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginStateSuccess)
              AppNav.pushAndRemoveUntil(
                context,
                AppRoutes.home,
              );
            else if (state is LoginStateFailed)
              AppNav.snackBar(context, state.message ?? 'Error');
          },
          builder: (context, state) {
            if (state is LoginStateLoading) return const LoadingWidget();

            return Form(
              key: formLoginKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/login-logo.png',
                        width: MediaQuery.of(context).size.width * .5,
                        height: MediaQuery.of(context).size.height * .2,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      'Welcome back!',
                      style: textTheme.headline1,
                    ),
                    AppDimensions.vSpacingS,
                    Text(
                      'login to your existing account',
                      style: textTheme.subtitle2,
                    ),
                    AppDimensions.vSpacing,
                    AppTextField(
                      onChanged: prov.studentMailOnChanged,
                      hint: 'Username',
                      prefixIcon: const Icon(Icons.account_box),
                      suffixIcon: const Icon(Icons.check),
                      validator: AppValidators.validateEmail(),
                    ),
                    AppDimensions.vSpacing,
                    AppPasswordField(
                      onChanged: prov.passwordOnChanged,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: () {
                          AppNav.push(context, AppRoutes.forgetPassword);
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                    AppDimensions.vSpacing,
                    AppPrimaryButton(
                      onPressed: () async {
                        if (formLoginKey.currentState!.validate()) {
                          context.read<LoginCubit>().login();
                        }
                      },
                      fixedSize: Size(153.0.w, 48.0.h),
                      child: const Text('Log in'),
                    ),
                    AppDimensions.vSpacing,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
