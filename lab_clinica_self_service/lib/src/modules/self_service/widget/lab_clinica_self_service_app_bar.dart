import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinica_core/lab_clinica_core.dart';
import 'package:lab_clinica_self_service/src/modules/self_service/self_service_controller.dart';

class LabClinicaSelfServiceAppBar extends LabClinicaAppBar {
  LabClinicaSelfServiceAppBar({super.key})
      : super(
          actions: [
            PopupMenuButton(
              child: const IconPopupMenuWidget(),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Reiniciar processo'),
                  ),
                ];
              },
              onSelected: (value) {
                Injector.get<SelfServiceController>().restartProccess();
              },
            ),
          ],
        );
}
