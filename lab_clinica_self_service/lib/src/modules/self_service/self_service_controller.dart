import 'package:lab_clinica_core/lab_clinica_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps {
  none,
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart,
}

class SelfServiceController with MessageStateMixin {
  final _step = ValueSignal(FormSteps.none);
  FormSteps get step => _step.value;

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }
}
