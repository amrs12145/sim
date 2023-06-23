// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim/core/validators.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/password_field.dart';
import 'package:sim/routes.dart';
import '../../../app_nav.dart';
import '../../../buisness_logic/cubit/sign_up/cubit.dart';
import '../../../constants/dimensions.dart';

import '../../widgets/input_field.dart';
import '../../widgets/loading.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final textTheme = Theme.of(context).textTheme;
    final prov = context.read<SignUpCubit>();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppDimensions.padding,
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpStateSuccess)
              AppNav.pushReplacement(
                context,
                AppRoutes.login,
              );
            else if (state is SignUpStateFailed)
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Errors',
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall,
                    ),
                    content: Text(state.message ?? 'Error'),
                  );
                },
              );
          },
          builder: (context, state) {
            if (state is SignUpStateLoading) return const LoadingWidget();

            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/login-logo.png',
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height * .2,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Let\'s Get Started!'.capitalizeAllWord(),
                      style: textTheme.headline1,
                    ),
                    AppDimensions.vSpacingS,
                    Text(
                      'Create your new account',
                      style: textTheme.subtitle2,
                    ),
                    AppDimensions.vSpacing,
                    AppTextField(
                      onChanged: prov.usernameOnChanged,
                      hint: 'Name',
                      prefixIcon: const Icon(Icons.account_box),
                      suffixIcon: const Icon(Icons.check),
                      validator: AppValidators.validateName(),
                    ),
                    AppDimensions.vSpacing,
                    AppTextField(
                      onChanged: prov.studentMailOnChanged,
                      hint: 'Student Mail',
                      prefixIcon: const Icon(Icons.mail_outlined),
                      validator: AppValidators.validateName(),
                    ),
                    AppDimensions.vSpacing,
                    AppTextField(
                      onChanged: prov.phoneNumberOnChanged,
                      hint: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone),
                      validator: AppValidators.validateName(),
                    ),
                    AppDimensions.vSpacing,
                    AppTextField(
                      onChanged: prov.studentIdOnChanged,
                      hint: 'Stduent ID',
                      keyboardType: TextInputType.phone,
                      prefixIcon: const Icon(Icons.phone),
                      validator: AppValidators.validateName(),
                    ),
                    AppDimensions.vSpacing,
                    AppPasswordField(
                      onChanged: prov.passwordOnChanged,
                    ),
                    AppDimensions.vSpacing,
                    AppPasswordField(
                      onChanged: prov.password2OnChanged,
                      hint: 'Confirm Password',
                    ),
                    AppDimensions.vSpacing,
                    AppPrimaryButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          prov.signUp();
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            AppNav.pushReplacement(
                              context,
                              AppRoutes.login,
                            );
                          },
                          child: const Text('Log in'),
                        ),
                      ],
                    ),
                    AppDimensions.vSpacing,
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
