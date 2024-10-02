import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix/core/constants/api_url.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/data/auth/models/signin_req_params.dart';
import 'package:netflix/data/auth/models/signup_req_params.dart';
import 'package:netflix/service_locator.dart';

abstract class AuthService {

  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
}


class AuthApiServiceImpl extends AuthService {

  
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {

      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap()
      );
      return Right(response.data);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> signin(SigninReqParams params) async {
     try {

      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toMap()
      );
      return Right(response.data);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

  
}