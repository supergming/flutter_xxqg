import 'package:json_conversion_annotation/json_conversion_annotation.dart';

/// is_study : false
/// login_time : 1653052858
/// nick : "苟江山"
/// token : "ef9deef5d3dc45a584096a13ff1879d8"
/// uid : "151142372517"

@JsonConversion()
class UserInfoBean{
  UserInfoBean({
      bool? isStudy, 
      int? loginTime, 
      String? nick, 
      String? token, 
      String? uid,}){
    _isStudy = isStudy;
    _loginTime = loginTime;
    _nick = nick;
    _token = token;
    _uid = uid;
}

  UserInfoBean.fromJson(dynamic json) {
    _isStudy = json['is_study'];
    _loginTime = json['login_time'];
    _nick = json['nick'];
    _token = json['token'];
    _uid = json['uid'];
  }
  bool? _isStudy;
  int? _loginTime;
  String? _nick;
  String? _token;
  String? _uid;
UserInfoBean copyWith({  bool? isStudy,
  int? loginTime,
  String? nick,
  String? token,
  String? uid,
}) => UserInfoBean(  isStudy: isStudy ?? _isStudy,
  loginTime: loginTime ?? _loginTime,
  nick: nick ?? _nick,
  token: token ?? _token,
  uid: uid ?? _uid,
);
  bool? get isStudy => _isStudy;
  int? get loginTime => _loginTime;
  String? get nick => _nick;
  String? get token => _token;
  String? get uid => _uid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_study'] = _isStudy;
    map['login_time'] = _loginTime;
    map['nick'] = _nick;
    map['token'] = _token;
    map['uid'] = _uid;
    return map;
  }

  @override
  T? fromJson<T>(json) {
      return UserInfoBean.fromJson(json) as T;
  }

  static UserInfoBean jsonConversion(Map<String, dynamic> json) {
    return UserInfoBean.fromJson(json);
  }

}