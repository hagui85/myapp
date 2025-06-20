import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/core/api/dio_client.dart';
import 'package:myapp/core/error/failures.dart';
import 'package:myapp/core/resources/app_strings.dart';
import 'package:myapp/core/utils/network_utils.dart';
import 'package:myapp/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:myapp/features/authentication/data/models/authentication_model.dart';
import 'package:myapp/features/authentication/data/models/authentication_request.dart';

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final DioClient dio;

  AuthenticationRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<Failure, AuthenticationModel>> loginUser(
    AuthenticationRequest authenticationRequest,
  ) async {
    try {
      //(todo )get the base url switch en
      // Assuming your Dio client has a post method and returns the response data

      String url = await NetworkUtils.getBaseUrl(
        kDebugMode
            ? AppStrings.AUTH_URL_SUFFIX
            : AppStrings.AUTH_URL_SUFFIX_FLOW,
      );
      final response = await dio.post(
        url, // Replace with your actual login endpoint
        data: authenticationRequest.toJson(),
      );
      return Right(AuthenticationModel.fromJson(response.data));
    } catch (e) {
      return Left(Failure(e.toString())); // Handle errors appropriately
    }
  }
}
