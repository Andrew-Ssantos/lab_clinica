import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            constraints: BoxConstraints(
              minHeight: sizeOf.height * 0.8,
            ),
            child: Column(
              children: [
                Text('Login'),
                const SizedBox(height: 32),
                TextFormField(
                  decoration: InputDecoration(label: const Text('Email')),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(label: const Text('Email')),
                ),
                const SizedBox(height: 32),
                ElevatedButton(onPressed: () {}, child: const Text('ENTRAR')),
              ],
            )),
      ),
    );
  }
}
