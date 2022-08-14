import 'package:json_conversion_annotation/json_conversion_annotation.dart';

/// code : "11019"
/// data : ""
/// success : false
/// message : "二维码已失效，请刷新页面重新扫描"

@JsonConversion()
class QrCode {
  QrCode({
    String? code,
    String? data,
    bool? success,
    String? message,
  }) {
    _code = code;
    _data = data;
    _success = success;
    _message = message;
  }

  bool isSuccess() {
    return success ?? false;
  }

  QrCode.fromJson(dynamic json) {
    _code = json['code'];
    _data = json['data'];
    _success = json['success'];
    _message = json['message'];
  }

  String? _code;
  String? _data;
  bool? _success;
  String? _message;

  QrCode copyWith({
    String? code,
    String? data,
    bool? success,
    String? message,
  }) =>
      QrCode(
        code: code ?? _code,
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
      );

  String? get code => _code;

  String? get data => _data;

  bool? get success => _success;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['data'] = _data;
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }

  static QrCode jsonConversion(json) {
    return QrCode.fromJson(json);
  }
}
