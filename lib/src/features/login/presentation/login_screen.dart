import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwalas/packages/authentication_package/barrel/auhtentication_repository_barrel.dart';
import 'package:foodwalas/src/constants/assets/assets_path.dart';
import 'package:foodwalas/src/features/login/bloc/login_bloc.dart';
import 'package:foodwalas/src/features/login/presentation/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocProvider(
          create: (context) => LoginBloc(
            authenticationRepository:
                RepositoryProvider.of<AuthenticationRepository>(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(foodwalas_jpg),
              const Icon(
                Icons.perm_identity_rounded,
                size: 100,
              ),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
