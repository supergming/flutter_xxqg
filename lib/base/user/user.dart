import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_xxqg/base/http/http.dart';
import 'package:study_xxqg/base/log/log.dart';

import '../http/api.dart';

class UserInfo{
  bool isLogin = false;
  String token = "";
  String username = "";
  String password = "";
  String baseUrl = "";

  bool isInit = false;

  String pushRegisterId = "";


  static void setRegisterId(String rid){
    var info = UserInfo.getInfo();
    info.pushRegisterId = rid;
  }


  static UserInfo?  _info;

  UserInfo._internal();

  static UserInfo getInfo(){
    _info ??= UserInfo._internal();
    return _info!;
  }

  static Future<void> check()async{
    var isLogin = await Api.checkLogin(getInfo().token);
    getInfo().isLogin = isLogin;
  }

  static Future<void> initUserInfo()async{
    var info = getInfo();

    if(info.isInit){
      return;
    }

    SharedPreferences ps = await SharedPreferences.getInstance();
    info.token = ps.getString("token") ?? "";
    info.username = ps.getString("account") ?? "";
    info.password = ps.getString("password")  ?? "";
    info.baseUrl = ps.getString("baseUrl") ?? "";

    Http.initDioConfig();
    await check();
  }


  static loginSuccess(String username,String password,String token,String baseUrl){
    Log.i("the account $username is login success");
    var info = getInfo();
    info.isLogin = true;
    info.username = username;
    info.password = password;
    info.token = token;
    info.baseUrl = baseUrl;
    _saveToFile(info);
  }

  static logout(){
    var info = getInfo();
    info.token = "";
    info.isLogin = false;
  }



  static void _saveToFile(UserInfo info)async{
    SharedPreferences ps = await SharedPreferences.getInstance();
    ps.setString("baseUrl", info.baseUrl);
    ps.setString("token", info.token);
    ps.setString("account", info.username);
    ps.setString("password", info.password);
    ps.setString("baseUrl", info.baseUrl);
  }

}