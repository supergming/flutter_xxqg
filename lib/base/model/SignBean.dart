

import 'package:json_conversion_annotation/json_conversion_annotation.dart';

/// sign : ""

@JsonConversion()
class SignBean{
  SignBean({
    String? sign,
  }) {
    _sign = sign;
  }

  SignBean.fromJson(dynamic json) {
    _sign = json['sign'];
  }

  String? _sign;

  SignBean copyWith({
    String? sign,
  }) =>
      SignBean(
        sign: sign ?? _sign,
      );

  String? get sign => _sign;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sign'] = _sign;
    return map;
  }

  @override
  T? fromJson<T>(json) {
    return SignBean.fromJson(json) as T;
  }

  static SignBean jsonConversion(Map<String, dynamic> json) {
    return SignBean.fromJson(json);
  }
}
