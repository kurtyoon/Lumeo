import 'package:Lumeo/app/utility/log_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

abstract class BaseConnect extends GetConnect {
  static Map<String, String> get basicHeaders => {
        'Content-Type': 'application/json',
      };

  @override
  void onInit() {
    super.onInit();

    httpClient
      ..baseUrl = dotenv.env['API_URL']
      ..defaultContentType = "application/json"
      ..timeout = const Duration(seconds: 30);

    httpClient.addRequestModifier<dynamic>((request) {
      LogUtil.info(
        "🛫 [${request.method}] ${request.url} | START",
      );

      return request;
    });

    httpClient.addResponseModifier((request, Response response) {
      if (response.status.hasError) {
        LogUtil.info(
            "🚨 [${request.method}] ${request.url} | FAILED (${response.statusCode})");
      } else {
        LogUtil.info(
            "🛬 [${request.method}] ${request.url} | SUCCESS (${response.statusCode})");

        LogUtil.info(
            "🛬 [${request.method}] ${request.url} | BODY ${response.body}");
      }

      return response;
    });
  }
}
