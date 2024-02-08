import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinica_core/lab_clinica_core.dart';
import 'package:lab_clinica_painel/src/pages/splash/splash_page.dart';

void main() {
  runApp(const LabClinicaPainelApp());
}

class LabClinicaPainelApp extends StatelessWidget {
  const LabClinicaPainelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicaCoreConfig(
      title: 'Lab Clinica Painel',
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
      ],
    );
  }
}
