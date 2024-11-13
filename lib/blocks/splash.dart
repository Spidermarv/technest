import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technest/blocks/colors.dart';
import 'package:technest/blocks/spash_cubit.dart';
import 'package:technest/blocks/splash_state.dart';
import 'package:technest/screens/signin.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplahCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const SigninPage()));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.pcolor,
        body: Center(
          child: Image.asset('assets/file.png'),
        ),
      ),
    );
  }
}
