import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lab_clinica_core/lab_clinica_core.dart';
import 'package:lab_clinica_self_service/src/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<AuthException, String>> login(String email, String password) async {
    try {
      final Response(data: {'access_token': accessToken}) =
          await restClient.unAuth.post('/auth', data: {'email': email, 'password': password, 'admin': true});

      return Right(accessToken);
    } on DioException catch (e, s) {
      log('Erro ao realizar Login', error: e, stackTrace: s);
      return switch (e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) => Left(AuthUnauthorizedException()),
        _ => Left(AuthError(message: 'Erro ao realizar o login'))
      };
    }
  }
}