/**
 * 封装于dio的接口
 * 1.使用https://javiercbk.github.io/json_to_dart/生成的数据
 * 2.修改类名，实现BaseResponse
 * 3.fromJson改成方法
 */
abstract class BaseResponse{

  String errmessage = "";
  String? status = "";
  BaseResponse();

  fromJson(Map<String, dynamic>? json);

}