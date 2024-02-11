import 'package:flutter/material.dart';
import 'package:lab_clinica_core/lab_clinica_core.dart';

class WhoIAmPage extends StatelessWidget {
  const WhoIAmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quem sou eu'),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: LabClinicaTheme.orangeColor),
        ),
      ),
    );
  }
}
