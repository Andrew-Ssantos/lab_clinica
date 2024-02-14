import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinica_core/lab_clinica_core.dart';
import 'package:lab_clinica_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> {
  final selfServiceController = Injector.get<SelfServiceController>();
  final nameEC = TextEditingController();
  final lastNameEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameEC.dispose();
    lastNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: LabClinicaAppBar(
        actions: [
          PopupMenuButton(
            child: const IconPopupMenuWidget(),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Finalizar Terminal'),
                ),
              ];
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  width: sizeOf.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo_vertical.png'),
                        const SizedBox(height: 48),
                        const Text(
                          'Bem-Vindo!',
                          style: LabClinicaTheme.titleStyle,
                        ),
                        const SizedBox(height: 48),
                        TextFormField(
                          controller: nameEC,
                          validator: Validatorless.required('Nome obrigatório'),
                          decoration: InputDecoration(label: Text('Digite seu nome')),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: lastNameEC,
                          validator: Validatorless.required('Sobrenome obrigatório'),
                          decoration: InputDecoration(label: Text('Digite seu sobrenome')),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: sizeOf.width * 0.8,
                          height: 48,
                          child: ElevatedButton(
                              onPressed: () {
                                final validation = formKey.currentState?.validate() ?? false;

                                if (validation) {
                                  selfServiceController.setWhoIAmDataStepAndNext(
                                    nameEC.text,
                                    lastNameEC.text,
                                  );
                                }
                              },
                              child: const Text('CONTINUAR')),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
