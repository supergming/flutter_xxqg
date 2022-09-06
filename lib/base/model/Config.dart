import 'dart:convert';
import 'dart:math';

import 'package:study_xxqg/base/log/log.dart';
/// model : 4
/// log_level : "debug"
/// show_browser : true
/// scheme : "https://johlanse.github.io/study_xxqg/scheme.html?"
/// push : {"ding":{"enable":true,"access_token":"176128ac6f1292e8df8a36c4f1e936d076bf62e22ff38565c0c3ca5dd21d623d","secret":"SEC9f6f2c4182de69b49f4f89d94d0ee1fd20a24287e6bd2c7ed189406189e06f8a"},"push_plus":{"enable":true,"token":"7424a35e9af748608ae7d81b62481a8e"}}
/// tg : {"enable":true,"token":"2114889499:AAG9eiiEpUph1a1UvtJC2jryd02V_xN7HT8","chat_id":1935733362,"proxy":"","custom_api":"https://work.cihy.top","white_list":[1935733362,-1001661204967]}
/// web : {"enable":true,"account":"123","password":"123","host":"0.0.0.0","port":8085,"common_user":{"user":"123"}}
/// cron : "CRON_TZ=Asia/Shanghai 51 14 * * *"
/// cron_random_wait : 0
/// edge_path : ""
/// qr_code : true
/// start_wait : 0
/// force_expiration : 0
/// retry : {"times":3,"intervals":1}
/// wechat : {"enable":true,"token":"123456","secret":"6c9fb2dd3ced1d870eaa6c926f5f74ec","app_id":"wx2afe47205be0ce1d","login_temp_id":"Qw2lCsm25JMHs0D3onvNfNJrfwVluDmq7veTvOdIWQk","normal_temp_id":"PKo3HhKy2UxQVU2f3q7qyRFvIi7cHSnA9CigqoAL-6Q","push_login_warn":false,"super_open_id":""}
/// special_min_score : 10
/// push_deer : {"enable":true,"api":"https://api2.pushdeer.com","token":"PDU14694T4BqDZiU2bv2wvRDepuf0IlSCeRsS0oki"}
/// reverse_order : false
/// ji_guang_push : {"enable":false,"secret":"1076e5d5f538bba09c620555","app_key":"8a0178682322020e0c5040c9"}
/// github_proxy : "https://github.com/"
/// hot_reload : true
/// custom_message : "测试信息\n12341"
/// custom_cron : ""

Config configFromJson(String str) => Config.fromJson(json.decode(str));
String configToJson(Config data) => json.encode(data.toJson());
class Config {
  Config({
      int? model, 
      String? logLevel, 
      bool? showBrowser, 
      String? scheme, 
      Push? push, 
      Tg? tg, 
      Web? web, 
      String? cron, 
      int? cronRandomWait, 
      String? edgePath, 
      bool? qrCode, 
      int? startWait, 
      int? forceExpiration, 
      Retry? retry, 
      Wechat? wechat, 
      int? specialMinScore, 
      PushDeer? pushDeer, 
      bool? reverseOrder,
      String? githubProxy, 
      bool? hotReload, 
      String? customMessage, 
      String? customCron,}){
    _model = model;
    _logLevel = logLevel;
    _showBrowser = showBrowser;
    _scheme = scheme;
    _push = push;
    _tg = tg;
    _web = web;
    _cron = cron;
    _cronRandomWait = cronRandomWait;
    _edgePath = edgePath;
    _qrCode = qrCode;
    _startWait = startWait;
    _forceExpiration = forceExpiration;
    _retry = retry;
    _wechat = wechat;
    _specialMinScore = specialMinScore;
    _pushDeer = pushDeer;
    _reverseOrder = reverseOrder;
    _githubProxy = githubProxy;
    _hotReload = hotReload;
    _customMessage = customMessage;
    _customCron = customCron;
}


static Config jsonConversion(json){
    return Config.fromJson(json);
}
  set model(int value) {
    _model = value;
  }

  Config.fromJson(dynamic json) {
    _model = json['model'];
    _logLevel = json['log_level'];
    _showBrowser = json['show_browser'];
    _scheme = json['scheme'];
    _push = json['push'] != null ? Push.fromJson(json['push']) : null;
    _tg = json['tg'] != null ? Tg.fromJson(json['tg']) : null;
    _web = json['web'] != null ? Web.fromJson(json['web']) : null;
    _cron = json['cron'];
    _cronRandomWait = json['cron_random_wait'];
    _edgePath = json['edge_path'];
    _qrCode = json['qr_code'];
    _startWait = json['start_wait'];
    _forceExpiration = json['force_expiration'];
    _retry = json['retry'] != null ? Retry.fromJson(json['retry']) : null;
    _wechat = json['wechat'] != null ? Wechat.fromJson(json['wechat']) : null;
    _specialMinScore = json['special_min_score'];
    _pushDeer = json['push_deer'] != null ? PushDeer.fromJson(json['push_deer']) : null;
    _reverseOrder = json['reverse_order'];
    _githubProxy = json['github_proxy'];
    _hotReload = json['hot_reload'];
    _customMessage = json['custom_message'];
    _customCron = json['custom_cron'];
  }
  int? _model;
  String? _logLevel;
  bool? _showBrowser;
  String? _scheme;
  Push? _push;
  Tg? _tg;
  Web? _web;
  String? _cron;
  int? _cronRandomWait;
  String? _edgePath;
  bool? _qrCode;
  int? _startWait;
  int? _forceExpiration;
  Retry? _retry;
  Wechat? _wechat;
  int? _specialMinScore;
  PushDeer? _pushDeer;
  bool? _reverseOrder;
  String? _githubProxy;
  bool? _hotReload;
  String? _customMessage;
  String? _customCron;
Config copyWith({  int? model,
  String? logLevel,
  bool? showBrowser,
  String? scheme,
  Push? push,
  Tg? tg,
  Web? web,
  String? cron,
  int? cronRandomWait,
  String? edgePath,
  bool? qrCode,
  int? startWait,
  int? forceExpiration,
  Retry? retry,
  Wechat? wechat,
  int? specialMinScore,
  PushDeer? pushDeer,
  bool? reverseOrder,
  String? githubProxy,
  bool? hotReload,
  String? customMessage,
  String? customCron,
}) => Config(  model: model ?? _model,
  logLevel: logLevel ?? _logLevel,
  showBrowser: showBrowser ?? _showBrowser,
  scheme: scheme ?? _scheme,
  push: push ?? _push,
  tg: tg ?? _tg,
  web: web ?? _web,
  cron: cron ?? _cron,
  cronRandomWait: cronRandomWait ?? _cronRandomWait,
  edgePath: edgePath ?? _edgePath,
  qrCode: qrCode ?? _qrCode,
  startWait: startWait ?? _startWait,
  forceExpiration: forceExpiration ?? _forceExpiration,
  retry: retry ?? _retry,
  wechat: wechat ?? _wechat,
  specialMinScore: specialMinScore ?? _specialMinScore,
  pushDeer: pushDeer ?? _pushDeer,
  reverseOrder: reverseOrder ?? _reverseOrder,
  githubProxy: githubProxy ?? _githubProxy,
  hotReload: hotReload ?? _hotReload,
  customMessage: customMessage ?? _customMessage,
  customCron: customCron ?? _customCron,
);


  int get model => _model ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['model'] = _model;
    map['log_level'] = _logLevel;
    map['show_browser'] = _showBrowser;
    map['scheme'] = _scheme;
    if (_push != null) {
      map['push'] = _push?.toJson();
    }
    if (_tg != null) {
      map['tg'] = _tg?.toJson();
    }
    if (_web != null) {
      map['web'] = _web?.toJson();
    }
    map['cron'] = _cron;
    map['cron_random_wait'] = _cronRandomWait;
    map['edge_path'] = _edgePath;
    map['qr_code'] = _qrCode;
    map['start_wait'] = _startWait;
    map['force_expiration'] = _forceExpiration;
    if (_retry != null) {
      map['retry'] = _retry?.toJson();
    }
    if (_wechat != null) {
      map['wechat'] = _wechat?.toJson();
    }
    map['special_min_score'] = _specialMinScore;
    if (_pushDeer != null) {
      map['push_deer'] = _pushDeer?.toJson();
    }
    map['reverse_order'] = _reverseOrder;
    map['github_proxy'] = _githubProxy;
    map['hot_reload'] = _hotReload;
    map['custom_message'] = _customMessage;
    map['custom_cron'] = _customCron;
    return map;
  }

  set logLevel(String value) {
    _logLevel = value;
  }

  set showBrowser(bool value) {
    _showBrowser = value;
  }

  set scheme(String value) {
    _scheme = value;
  }

  set push(Push value) {
    _push = value;
  }

  set tg(Tg value) {
    _tg = value;
  }

  set web(Web value) {
    _web = value;
  }

  set cron(String value) {
    _cron = value;
  }

  set cronRandomWait(int value) {
    _cronRandomWait = value;
  }

  set edgePath(String value) {
    _edgePath = value;
  }

  set qrCode(bool value) {
    _qrCode = value;
  }

  set startWait(int value) {
    _startWait = value;
  }

  set forceExpiration(int value) {
    _forceExpiration = value;
  }

  set retry(Retry value) {
    _retry = value;
  }

  set wechat(Wechat value) {
    _wechat = value;
  }

  set specialMinScore(int value) {
    _specialMinScore = value;
  }

  set pushDeer(PushDeer value) {
    _pushDeer = value;
  }

  set reverseOrder(bool value) {
    _reverseOrder = value;
  }


  set githubProxy(String value) {
    _githubProxy = value;
  }

  set hotReload(bool value) {
    _hotReload = value;
  }

  set customMessage(String value) {
    _customMessage = value;
  }

  set customCron(String value) {
    _customCron = value;
  }

  String get logLevel => _logLevel ?? "";

  bool get showBrowser => _showBrowser ?? false;

  String get scheme => _scheme ?? "";

  Push get push => _push!;

  Tg get tg => _tg!;

  Web get web => _web!;

  String get cron => _cron ?? "";

  int get cronRandomWait => _cronRandomWait ?? 0;

  String get edgePath => _edgePath ?? "";

  bool get qrCode => _qrCode ?? false;

  int get startWait => _startWait ?? 0;

  int get forceExpiration => _forceExpiration ?? 0;

  Retry get retry => _retry!;

  Wechat get wechat => _wechat!;

  int get specialMinScore => _specialMinScore ?? 0;

  PushDeer get pushDeer => _pushDeer!;

  bool get reverseOrder => _reverseOrder ?? false;


  String get githubProxy => _githubProxy ?? "";

  bool get hotReload => _hotReload ?? false;

  String get customMessage => _customMessage ?? "";

  String get customCron => _customCron ?? "";
}


/// enable : true
/// api : "https://api2.pushdeer.com"
/// token : "PDU14694T4BqDZiU2bv2wvRDepuf0IlSCeRsS0oki"

PushDeer pushDeerFromJson(String str) => PushDeer.fromJson(json.decode(str));
String pushDeerToJson(PushDeer data) => json.encode(data.toJson());
class PushDeer {
  PushDeer({
      bool? enable, 
      String? api, 
      String? token,}){
    _enable = enable;
    _api = api;
    _token = token;
}

  PushDeer.fromJson(dynamic json) {
    _enable = json['enable'];
    _api = json['api'];
    _token = json['token'];
  }
  bool? _enable;
  String? _api;
  String? _token;
PushDeer copyWith({  bool? enable,
  String? api,
  String? token,
}) => PushDeer(  enable: enable ?? _enable,
  api: api ?? _api,
  token: token ?? _token,
);


  bool get enable => _enable ?? false;

  set enable(bool value) {
    _enable = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enable'] = _enable;
    map['api'] = _api;
    map['token'] = _token;
    return map;
  }

  String get api => _api ?? "";

  set api(String value) {
    _api = value;
  }

  String get token => _token ?? "";

  set token(String value) {
    _token = value;
  }
}

/// enable : true
/// token : "123456"
/// secret : "6c9fb2dd3ced1d870eaa6c926f5f74ec"
/// app_id : "wx2afe47205be0ce1d"
/// login_temp_id : "Qw2lCsm25JMHs0D3onvNfNJrfwVluDmq7veTvOdIWQk"
/// normal_temp_id : "PKo3HhKy2UxQVU2f3q7qyRFvIi7cHSnA9CigqoAL-6Q"
/// push_login_warn : false
/// super_open_id : ""

Wechat wechatFromJson(String str) => Wechat.fromJson(json.decode(str));
String wechatToJson(Wechat data) => json.encode(data.toJson());
class Wechat {
  Wechat({
      bool? enable, 
      String? token, 
      String? secret, 
      String? appId, 
      String? loginTempId, 
      String? normalTempId, 
      bool? pushLoginWarn, 
      String? superOpenId,}){
    _enable = enable;
    _token = token;
    _secret = secret;
    _appId = appId;
    _loginTempId = loginTempId;
    _normalTempId = normalTempId;
    _pushLoginWarn = pushLoginWarn;
    _superOpenId = superOpenId;
}

  Wechat.fromJson(dynamic json) {
    _enable = json['enable'];
    _token = json['token'];
    _secret = json['secret'];
    _appId = json['app_id'];
    _loginTempId = json['login_temp_id'];
    _normalTempId = json['normal_temp_id'];
    _pushLoginWarn = json['push_login_warn'];
    _superOpenId = json['super_open_id'];
  }
  bool? _enable;
  String? _token;
  String? _secret;
  String? _appId;
  String? _loginTempId;
  String? _normalTempId;
  bool? _pushLoginWarn;
  String? _superOpenId;
Wechat copyWith({  bool? enable,
  String? token,
  String? secret,
  String? appId,
  String? loginTempId,
  String? normalTempId,
  bool? pushLoginWarn,
  String? superOpenId,
}) => Wechat(  enable: enable ?? _enable,
  token: token ?? _token,
  secret: secret ?? _secret,
  appId: appId ?? _appId,
  loginTempId: loginTempId ?? _loginTempId,
  normalTempId: normalTempId ?? _normalTempId,
  pushLoginWarn: pushLoginWarn ?? _pushLoginWarn,
  superOpenId: superOpenId ?? _superOpenId,
);


  bool get enable => _enable ?? false;

  set enable(bool value) {
    _enable = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enable'] = _enable;
    map['token'] = _token;
    map['secret'] = _secret;
    map['app_id'] = _appId;
    map['login_temp_id'] = _loginTempId;
    map['normal_temp_id'] = _normalTempId;
    map['push_login_warn'] = _pushLoginWarn;
    map['super_open_id'] = _superOpenId;
    return map;
  }

  String get token => _token ?? "";

  set token(String value) {
    _token = value;
  }

  String get secret => _secret ?? "";

  set secret(String value) {
    _secret = value;
  }

  String get appId => _appId ?? "";

  set appId(String value) {
    _appId = value;
  }

  String get loginTempId => _loginTempId ?? "";

  set loginTempId(String value) {
    _loginTempId = value;
  }

  String get normalTempId => _normalTempId ?? "";

  set normalTempId(String value) {
    _normalTempId = value;
  }

  bool get pushLoginWarn => _pushLoginWarn ?? false;

  set pushLoginWarn(bool value) {
    _pushLoginWarn = value;
  }

  String get superOpenId => _superOpenId ?? "";

  set superOpenId(String value) {
    _superOpenId = value;
  }
}

/// times : 3
/// intervals : 1

Retry retryFromJson(String str) => Retry.fromJson(json.decode(str));
String retryToJson(Retry data) => json.encode(data.toJson());
class Retry {
  Retry({
      int? times, 
      int? intervals,}){
    _times = times;
    _intervals = intervals;
}

  Retry.fromJson(dynamic json) {
    _times = json['times'];
    _intervals = json['intervals'];
  }
  int? _times;
  int? _intervals;
Retry copyWith({  int? times,
  int? intervals,
}) => Retry(  times: times ?? _times,
  intervals: intervals ?? _intervals,
);


  int get times => _times ?? 0;

  set times(int value) {
    _times = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['times'] = _times;
    map['intervals'] = _intervals;
    return map;
  }

  int get intervals => _intervals ?? 0;

  set intervals(int value) {
    _intervals = value;
  }
}

/// enable : true
/// account : "123"
/// password : "123"
/// host : "0.0.0.0"
/// port : 8085
/// common_user : {"user":"123"}

Web webFromJson(String str) => Web.fromJson(json.decode(str));
String webToJson(Web data) => json.encode(data.toJson());
class Web {
  Web({
      bool? enable,
      String? account,
      String? password,
      String? host,
      int? port,
    Map<String,String>?  commonUser,}){
    _enable = enable;
    _account = account;
    _password = password;
    _host = host;
    _port = port;
    _commonUser = commonUser;
}

  Web.fromJson(dynamic json1) {
    Map users = json1["common_user"] as Map;
    Map<String,String> user1 = {};
    users.forEach((key, value) {
      Log.d("$key:$value");
      user1[key] = value;
    });
    _enable = json1['enable'];
    _account = json1['account'];
    _password = json1['password'];
    _host = json1['host'];
    _port = json1['port'];
    _commonUser = user1;
  }
  bool? _enable;
  String? _account;
  String? _password;
  String? _host;
  int? _port;
  Map<String,String>?  _commonUser;
Web copyWith({  bool? enable,
  String? account,
  String? password,
  String? host,
  int? port,
  required Map<String,String> commonUser,
}) => Web(  enable: enable ?? _enable,
  account: account ?? _account,
  password: password ?? _password,
  host: host ?? _host,
  port: port ?? _port,
  commonUser: commonUser,
);


  bool get enable => _enable ?? false;

  set enable(bool value) {
    _enable = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enable'] = _enable;
    map['account'] = _account;
    map['password'] = _password;
    map['host'] = _host;
    map['port'] = _port;
    if (_commonUser != null) {
      map['common_user'] = _commonUser;
    }
    return map;
  }

  String get account => _account ?? "";

  set account(String value) {
    _account = value;
  }

  String get password => _password ?? "";

  set password(String value) {
    _password = value;
  }

  String get host => _host ?? "";

  set host(String value) {
    _host = value;
  }

  int get port => _port ?? 0;

  set port(int value) {
    _port = value;
  }

  Map<String,String> get commonUser => _commonUser!;

  set commonUser(Map<String,String>  value) {
    _commonUser = value;
  }
}





/// enable : true
/// token : "2114889499:AAG9eiiEpUph1a1UvtJC2jryd02V_xN7HT8"
/// chat_id : 1935733362
/// proxy : ""
/// custom_api : "https://work.cihy.top"
/// white_list : [1935733362,-1001661204967]

Tg tgFromJson(String str) => Tg.fromJson(json.decode(str));
String tgToJson(Tg data) => json.encode(data.toJson());
class Tg {
  Tg({
      bool? enable, 
      String? token, 
      int? chatId, 
      String? proxy, 
      String? customApi, 
      List<int>? whiteList,}){
    _enable = enable;
    _token = token;
    _chatId = chatId;
    _proxy = proxy;
    _customApi = customApi;
    _whiteList = whiteList;
}

  Tg.fromJson(dynamic json) {
    _enable = json['enable'];
    _token = json['token'];
    _chatId = json['chat_id'];
    _proxy = json['proxy'];
    _customApi = json['custom_api'];
    _whiteList = json['white_list'] != null ? json['white_list'].cast<int>() : [];
  }
  bool? _enable;
  String? _token;
  int? _chatId;
  String? _proxy;
  String? _customApi;
  List<int>? _whiteList;
Tg copyWith({  bool? enable,
  String? token,
  int? chatId,
  String? proxy,
  String? customApi,
  List<int>? whiteList,
}) => Tg(  enable: enable ?? _enable,
  token: token ?? _token,
  chatId: chatId ?? _chatId,
  proxy: proxy ?? _proxy,
  customApi: customApi ?? _customApi,
  whiteList: whiteList ?? _whiteList,
);


  bool get enable => _enable ?? false;

  set enable(bool value) {
    _enable = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enable'] = _enable;
    map['token'] = _token;
    map['chat_id'] = _chatId;
    map['proxy'] = _proxy;
    map['custom_api'] = _customApi;
    map['white_list'] = _whiteList;
    return map;
  }

  String get token => _token ?? "";

  set token(String value) {
    _token = value;
  }

  int get chatId => _chatId ?? 0;

  set chatId(int value) {
    _chatId = value;
  }

  String get proxy => _proxy ?? "";

  set proxy(String value) {
    _proxy = value;
  }

  String get customApi => _customApi ?? "";

  set customApi(String value) {
    _customApi = value;
  }

  List<int> get whiteList => _whiteList!;

  set whiteList(List<int> value) {
    _whiteList = value;
  }
}

/// ding : {"enable":true,"access_token":"176128ac6f1292e8df8a36c4f1e936d076bf62e22ff38565c0c3ca5dd21d623d","secret":"SEC9f6f2c4182de69b49f4f89d94d0ee1fd20a24287e6bd2c7ed189406189e06f8a"}
/// push_plus : {"enable":true,"token":"7424a35e9af748608ae7d81b62481a8e"}

Push pushFromJson(String str) => Push.fromJson(json.decode(str));
String pushToJson(Push data) => json.encode(data.toJson());
class Push {
  Push({
      Ding? ding, 
      PushPlus? pushPlus,}){
    _ding = ding;
    _pushPlus = pushPlus;
}

  Push.fromJson(dynamic json) {
    _ding = json['ding'] != null ? Ding.fromJson(json['ding']) : null;
    _pushPlus = json['push_plus'] != null ? PushPlus.fromJson(json['push_plus']) : null;
  }
  Ding? _ding;
  PushPlus? _pushPlus;
Push copyWith({  Ding? ding,
  PushPlus? pushPlus,
}) => Push(  ding: ding ?? _ding,
  pushPlus: pushPlus ?? _pushPlus,
);


  Ding get ding => _ding!;

  set ding(Ding value) {
    _ding = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_ding != null) {
      map['ding'] = _ding?.toJson();
    }
    if (_pushPlus != null) {
      map['push_plus'] = _pushPlus?.toJson();
    }
    return map;
  }

  PushPlus get pushPlus => _pushPlus!;

  set pushPlus(PushPlus value) {
    _pushPlus = value;
  }
}

/// enable : true
/// token : "7424a35e9af748608ae7d81b62481a8e"

PushPlus pushPlusFromJson(String str) => PushPlus.fromJson(json.decode(str));
String pushPlusToJson(PushPlus data) => json.encode(data.toJson());
class PushPlus {
  PushPlus({
      bool? enable, 
      String? token,}){
    _enable = enable;
    _token = token;
}

  PushPlus.fromJson(dynamic json) {
    _enable = json['enable'];
    _token = json['token'];
  }
  bool? _enable;
  String? _token;
PushPlus copyWith({  bool? enable,
  String? token,
}) => PushPlus(  enable: enable ?? _enable,
  token: token ?? _token,
);


  bool get enable => _enable ?? false;

  set enable(bool value) {
    _enable = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enable'] = _enable;
    map['token'] = _token;
    return map;
  }

  String get token => _token ?? "";

  set token(String value) {
    _token = value;
  }
}

/// enable : true
/// access_token : "176128ac6f1292e8df8a36c4f1e936d076bf62e22ff38565c0c3ca5dd21d623d"
/// secret : "SEC9f6f2c4182de69b49f4f89d94d0ee1fd20a24287e6bd2c7ed189406189e06f8a"

Ding dingFromJson(String str) => Ding.fromJson(json.decode(str));
String dingToJson(Ding data) => json.encode(data.toJson());
class Ding {
  Ding({
      bool? enable, 
      String? accessToken, 
      String? secret,}){
    _enable = enable;
    _accessToken = accessToken;
    _secret = secret;
}

  Ding.fromJson(dynamic json) {
    _enable = json['enable'];
    _accessToken = json['access_token'];
    _secret = json['secret'];
  }
  bool? _enable;
  String? _accessToken;
  String? _secret;
Ding copyWith({  bool? enable,
  String? accessToken,
  String? secret,
}) => Ding(  enable: enable ?? _enable,
  accessToken: accessToken ?? _accessToken,
  secret: secret ?? _secret,
);


  bool get enable => _enable ?? false;

  set enable(bool value) {
    _enable = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['enable'] = _enable;
    map['access_token'] = _accessToken;
    map['secret'] = _secret;
    return map;
  }

  String get accessToken => _accessToken ?? "";

  set accessToken(String value) {
    _accessToken = value;
  }

  String get secret => _secret ?? "";

  set secret(String value) {
    _secret = value;
  }
}