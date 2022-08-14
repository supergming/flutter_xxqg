// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:study_xxqg/base/model/Genrate.dart';
import 'package:study_xxqg/base/model/QrCode.dart';
import 'package:study_xxqg/base/model/SignBean.dart';
import 'package:study_xxqg/base/model/UserInfoBean.dart';


class JsonConversion$Bean {

 static M fromJson<M>(dynamic json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json);
    }
  }

  static M _fromJsonSingle<M>(dynamic json) {

    String type = M.toString();

    if(type == (Generate).toString()){
      return Generate.jsonConversion(json)  as M;
    }
    
    if(type == (QrCode).toString()){
      return QrCode.jsonConversion(json)  as M;
    }
    
    if(type == (SignBean).toString()){
      return SignBean.jsonConversion(json)  as M;
    }
    
    if(type == (UserInfoBean).toString()){
      return UserInfoBean.jsonConversion(json)  as M;
    }
    
    throw Exception("not found");
  }

  static M _getListChildType<M>(List<dynamic> data) {
      if(<Generate>[] is M){
      return data.map<Generate>((e) => Generate.jsonConversion(e)).toList() as M;
    }
    
    if(<QrCode>[] is M){
      return data.map<QrCode>((e) => QrCode.jsonConversion(e)).toList() as M;
    }
    
    if(<SignBean>[] is M){
      return data.map<SignBean>((e) => SignBean.jsonConversion(e)).toList() as M;
    }
    
    if(<UserInfoBean>[] is M){
      return data.map<UserInfoBean>((e) => UserInfoBean.jsonConversion(e)).toList() as M;
    }
    
    throw Exception("not found");
  }
}
