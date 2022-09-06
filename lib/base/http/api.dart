import 'package:dio/dio.dart';
import 'package:study_xxqg/base/http/resp/nullResponse.dart';
import 'package:study_xxqg/base/http/url.dart';
import 'package:study_xxqg/base/log/log.dart';
import 'package:study_xxqg/base/model/Config.dart';
import 'package:study_xxqg/base/model/Genrate.dart';
import 'package:study_xxqg/base/model/QrCode.dart';
import 'package:study_xxqg/base/model/SignBean.dart';
import 'package:study_xxqg/base/model/UserInfoBean.dart';
import 'package:study_xxqg/base/user/user.dart';
import 'package:study_xxqg/bean.jc.dart';

import 'http.dart';

class Api{

  // 用户登录
  static Future<bool> login(String baseUrl,String account,String password) async {
      var resp = await Http.post<String>(baseUrl+URL.loginUrl,data: {
        "account":account,
        "password":password
      });
      if (resp.isSuccess()){
        Log.d(resp.bean);
        UserInfo.loginSuccess(account, password, resp.bean!, baseUrl);
        Http.setBaseUrl(baseUrl);
        Http.initDioConfig();
        return true;
      }
      return false;
  }

  // 查询用户
  static Future<List<UserInfoBean>> getUsers()async{
    var resp = await Http.get<List<UserInfoBean>>("/user");
    if (resp.isSuccess()){
      return resp.bean?? [];
    }else{
      return [];
    }
  }

  // 删除用户
  static Future<bool> deleteUser(String uid)async{
    var resp = await Http.delete<NullResponse>("/user?uid=$uid");
    return resp.isSuccess();
  }

  // 添加用户
  static Future<bool> addUser(String code,String state)async{
    var resp = await Http.post<String>(URL.user,params: {"register_id":UserInfo.getInfo().pushRegisterId},data: {"code":code,"state":state});
    return resp.isSuccess();
  }

  // 开始学习
  static Future<bool> startStudy(String uid)async{
    var resp = await Http.post<String>(URL.startStudy,params: {"uid":uid});
    return resp.isSuccess();
  }

  // 结束学习
  static Future<bool> stopStudy(String uid)async{
    var resp = await Http.post<String>(URL.stopStudy,params: {"uid":uid});
    return resp.isSuccess();
  }

  // sign
  static Future<String> sign()async{
    var resp = await Http.get<SignBean>(URL.sign);

    return resp.bean!.sign ?? "";
  }

  // generate
  static Future<String> generate()async{
    var resp = await Http.getDio().get(URL.generate);
    return JsonConversion$Bean.fromJson<Generate>(resp.data).result ?? "";
  }

  // checkQrCode
  // generate
  static Future<QrCode> checkQrCode(String qrCode)async{
    var resp = await Http.getDio().post(URL.checkQrCode,data: FormData.fromMap({
      "qrCode": qrCode,
      "goto": "https://oa.xuexi.cn",
      "pdmToken": ""
    }),options: Options(headers: {
      "content-type":"application/x-www-form-urlencoded;charset=UTF-8"
    }));
    return JsonConversion$Bean.fromJson<QrCode>(resp.data);
  }

  // 获取日志
  static Future<String> getLog()async{
    var resp =  await Http.getDio().get<String>(URL.log);
    return resp.data ?? "";
  }

  // 检查登录情况
  static Future<int> checkLogin(String token)async{
    if (token == ""){
      return -1;
    }
    var resp = await Http.post<int>("/auth/check/$token");
    Log.d(resp.bean);
    return resp.bean ?? -1;
  }


  // 成绩获取
  static Future<String> score(String token)async{
    var resp = await Http.get<String>(URL.score,params: {"token":token});

    return resp.bean ?? "";
  }

  static Future<Config> getConfig()async{
    var resp = await Http.get<Config>(URL.config);
    return resp.bean!;
  }

  static Future<bool> setConfig(Config config)async{
    var resp = await Http.post<NullResponse>(URL.config,data: config);
    return resp.isSuccess();
  }

  static Future<bool> restart()async{
    var resp = await Http.post<NullResponse>(URL.restart);
    return resp.isSuccess();
  }

  static Future<bool> update()async{
    var resp = await Http.post<NullResponse>(URL.update);
    return resp.isSuccess();
  }

  static Future<String> getAbout()async{
    var resp = await Http.get<String>(URL.about);
    return resp.bean ?? "";
  }

}