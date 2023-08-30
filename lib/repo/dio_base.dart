import 'package:dio/dio.dart';

import '../configs/api_configs.dart' show baseURL;

final dio = Dio(
  BaseOptions(
      baseUrl: baseURL, connectTimeout: const Duration(milliseconds: 5000)),
);
