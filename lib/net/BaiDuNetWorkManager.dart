import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_my_web/utils/LogUtils.dart';
import 'BaseResponse.dart';

class BaiDuNetWorkManager {
  static String TAG = "NetWorkManager";
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static final int CONNECR_TIME_OUT = 15 * 1000;
  static final int SEND_TIME_OUT = 15 * 1000;
  static final int RECIVE_TIME_OUT = 15 * 1000;
  var _dio = new Dio();

  BaiDuNetWorkManager._internal() {
    initDio();
  }

  static BaiDuNetWorkManager _httpManger = BaiDuNetWorkManager._internal();

  factory BaiDuNetWorkManager() {
    return _httpManger;
  }

  ///配置dio
  void initDio() {
    _dio = Dio();
    // 配置dio实例
    _dio.options.connectTimeout = CONNECR_TIME_OUT;
    _dio.options.sendTimeout = SEND_TIME_OUT;
    _dio.options.receiveTimeout = RECIVE_TIME_OUT;
    _dio.options.baseUrl = "https://aip.baidubce.com/";
    //此处可以增加配置项，留一个设置代理的用户给测试人员配置，然后动态读取
    /// 添加拦截器
      _dio.interceptors.add(
          InterceptorsWrapper(
              onRequest: (options, handler) async {
                // 在请求被发送之前做一些事情
                options.contentType="application/x-www-form-urlencoded";
              },
              onResponse: (e, handler) {
                // 在返回响应数据之前做一些预处理
              },
              onError: (e, handler) {
                LogUtils.e("dioError :" + e.toString());
              }),
        );
  }



  Future<BaseResponse> post(
    String url,
    BaseResponse baseResponse, {
    Map<String, dynamic>? queryParameters,
  }) async {

    // String token = await HKSpUtils.getToken();
    // queryParameters.addAll({
    //   "loginType":"1",
    //   "platform":"android",
    //   "ustoken": token,
    //   "mid":"123456",
    //   "version":"2020071601",
    // });
    
    LogD("url:$url");
    LogD("queryParameters:$queryParameters");
    return _requstHttp(url, baseResponse, false, queryParameters);
  }

  //get请求
  Future<BaseResponse> getJson(
    String url,
    BaseResponse baseResponse, {
    Map<String, dynamic>? queryParameters,
  }) async {
    LogD("url:$url");
    LogD("queryParameters:$queryParameters");
    return _requstHttp(url, baseResponse, true, queryParameters);
  }


  Future<BaseResponse> _requstHttp(String url, BaseResponse baseResponse,
      [bool? isGet, queryParameters, bool isCancelable = true]) async {
    CancelToken? cancelToken;
    Response response;
    if (isGet!) {
      response = await _dio
          .get(url, queryParameters: queryParameters, cancelToken: cancelToken)
          .catchError((error) {
        baseResponse.status = "0";
        baseResponse.errmessage = error.toString();
      });
    } else {
      response = await _dio
          .post(url, data: queryParameters, cancelToken: cancelToken)
          .catchError((error) {
        baseResponse.status = "0";
        baseResponse.errmessage = error.toString();
      });
    }

    if (response != null) {
      LogD("response.toString():" + response.toString());
      Map<String, dynamic>? news = jsonDecode(response.toString());
      baseResponse.fromJson(news);
    } else {
      String err = "response == null";
      LogD(err);
      baseResponse.status = "0";
      baseResponse.errmessage = err;
    }
    return baseResponse;
  }

  void LogD(String message) {
    LogUtils.d(message + "", tag: TAG);
  }
}
