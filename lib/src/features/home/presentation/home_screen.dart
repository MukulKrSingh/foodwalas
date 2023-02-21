import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodwalas/src/features/authentication/barrel/authentication_bloc_barrel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foodwalas'),
        actions: [
          IconButton(
            onPressed: () {
              //* Logout
              debugPrint('Here');
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationLogoutRequested());
            },
            icon: const Icon(
              Icons.logout_rounded,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const[],
          ),
        ),
      ),
    );
  }
}
