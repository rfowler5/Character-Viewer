import 'package:dio/dio.dart';

import '../configs/api_configs.dart' show baseURL;
import '../flavors.dart';

final dio = Dio(
  BaseOptions(
      baseUrl: F.baseURL, connectTimeout: const Duration(milliseconds: 5000)),
);
