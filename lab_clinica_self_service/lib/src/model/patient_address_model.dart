import 'package:json_annotation/json_annotation.dart';

part 'patient_address_model.g.dart';

@JsonSerializable()
class PatientAddressModel {
  final String cep;
  @JsonKey(name: 'street_address')
  final String streetAddress;
  @JsonKey(name: 'address_complement', defaultValue: '')
  final String addressComplement;
  final String number;
  final String state;
  final String city;
  final String district;

  PatientAddressModel(
      {required this.cep,
      required this.streetAddress,
      required this.addressComplement,
      required this.number,
      required this.state,
      required this.city,
      required this.district});

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) => _$PatientAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddressModelToJson(this);
  PatientAddressModel copyWith(
      {String? cep,
      String? streetAddress,
      String? addressComplement,
      String? number,
      String? state,
      String? city,
      String? district}) {
    return PatientAddressModel(
      cep: cep ?? this.cep,
      streetAddress: streetAddress ?? this.streetAddress,
      addressComplement: addressComplement ?? this.addressComplement,
      number: number ?? this.number,
      state: state ?? this.state,
      city: city ?? this.city,
      district: district ?? this.district,
    );
  }
}
