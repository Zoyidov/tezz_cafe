import 'package:dio/dio.dart';
import 'package:tezz_cafe/core/utils/constants/api_constants.dart';

typedef ConverterFunctionType<T> = T Function(dynamic response);

class DioSettings {
  final BaseOptions _dioBaseOptions = BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 35000),
    validateStatus: (status) => status != null && status <= 500,
  );

  BaseOptions get dioBaseOptions => _dioBaseOptions;

  Dio get dio => Dio(_dioBaseOptions);


}
