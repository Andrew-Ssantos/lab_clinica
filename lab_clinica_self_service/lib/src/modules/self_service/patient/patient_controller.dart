import 'package:lab_clinica_core/lab_clinica_core.dart';
import 'package:lab_clinica_self_service/src/model/patient_model.dart';
import 'package:lab_clinica_self_service/src/repositories/patients/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  final PatientRepository _repository;
  PatientController({required PatientRepository repository}) : _repository = repository;

  PatientModel? patient;
  final _nextStep = signal<bool>(false);
  bool get nextStep => _nextStep.value;
  void goNextStep() {
    _nextStep.value = true;
  }

  void updateAndNext(PatientModel patientModel) async {
    final updateResult = await _repository.update(patientModel);

    switch (updateResult) {
      case Left():
        showError('Erro ao atualizar dados do paciente, chame um atendente');
      case Right():
        showInfo('Paciente atualizado com sucesso');
        patient = patientModel;
        goNextStep();
    }
  }

  Future<void> registerAndNext(RegisterPatientModel registerPatientModel) async {
    final result = await _repository.register(registerPatientModel);

    switch (result) {
      case Left():
        showError('Erro ao cadastrar paciente, chame um atendente');
      case Right(value: final patient):
        showInfo('Paciente cadastrado com sucesso');
        this.patient = patient;
        goNextStep();
    }
  }
}
