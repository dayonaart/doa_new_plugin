// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:doa/doa_lib/widget/loading.dart';
import 'package:doa/doa_lib/widget/widgets.dart';

class Api {
  final BaseOptions _countryUrl = BaseOptions(
      baseUrl: "https://dev.farizdotid.com/api/daerahindonesia/",
      connectTimeout: const Duration(seconds: 30),
      contentType: "application/json");
  final BaseOptions _zolozBaseOptions = BaseOptions(
      // baseUrl: "https://zolozagen.herokuapp.com/api/",
      // change baseUrl your ip
      baseUrl: "http://192.168.158.204:8080/api/",
      connectTimeout: const Duration(seconds: 30),
      contentType: "application/json");
  Future<dynamic> GET(String endpoint, {bool useLoading = true}) async {
    try {
      if (useLoading) {
        Loading.show();
      }
      var _res = await Dio(_countryUrl).get(endpoint);
      Loading.hide();
      return _res.data;
    } on DioException catch (e) {
      Loading.hide();
      DIALOG_HELPER("on DioError $e");
      return null;
    } catch (e) {
      Loading.hide();
      DIALOG_HELPER("catch $e");
      return null;
    }
  }

  Future<dynamic> POST(String endpoint,
      {dynamic payload, bool useLoading = true}) async {
    try {
      if (useLoading) {
        Loading.show();
      }
      var _res = await Dio(_zolozBaseOptions).post(endpoint, data: payload);
      Loading.hide();
      return _res.data;
    } on DioException catch (e) {
      Loading.hide();
      DIALOG_HELPER("on DioError $e");
      return null;
    } catch (e) {
      Loading.hide();
      DIALOG_HELPER("catch $e");
      return null;
    }
  }
}
