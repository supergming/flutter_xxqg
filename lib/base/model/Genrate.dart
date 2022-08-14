import 'package:json_conversion_annotation/json_conversion_annotation.dart';

/// success : true
/// errorCode : null
/// errorMsg : null
/// result : "qr:AC03C919-7F7C-46FB-BCC7-CCE9B386F873"
/// arguments : null

@JsonConversion()
class Generate {
  Generate({
      bool? success, 
      dynamic errorCode, 
      dynamic errorMsg, 
      String? result, 
      dynamic arguments,}){
    _success = success;
    _errorCode = errorCode;
    _errorMsg = errorMsg;
    _result = result;
    _arguments = arguments;
}

  Generate.fromJson(dynamic json) {
    _success = json['success'];
    _errorCode = json['errorCode'];
    _errorMsg = json['errorMsg'];
    _result = json['result'];
    _arguments = json['arguments'];
  }
  bool? _success;
  dynamic _errorCode;
  dynamic _errorMsg;
  String? _result;
  dynamic _arguments;
Generate copyWith({  bool? success,
  dynamic errorCode,
  dynamic errorMsg,
  String? result,
  dynamic arguments,
}) => Generate(  success: success ?? _success,
  errorCode: errorCode ?? _errorCode,
  errorMsg: errorMsg ?? _errorMsg,
  result: result ?? _result,
  arguments: arguments ?? _arguments,
);
  bool? get success => _success;
  dynamic get errorCode => _errorCode;
  dynamic get errorMsg => _errorMsg;
  String? get result => _result;
  dynamic get arguments => _arguments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errorCode'] = _errorCode;
    map['errorMsg'] = _errorMsg;
    map['result'] = _result;
    map['arguments'] = _arguments;
    return map;
  }

  static Generate jsonConversion(Map<String, dynamic> json) {
    return Generate.fromJson(json);
  }

}