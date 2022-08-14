import'package:study_xxqg/base/utils/js.dart'  if(dart.library.html) "dart:js" as js;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study_xxqg/base/http/api.dart';
import 'package:study_xxqg/base/log/log.dart';
import 'package:study_xxqg/base/user/user.dart';

import '../../base/utils/ploatform_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  late TextEditingController _urlController;
  late TextEditingController _accountController;
  late TextEditingController _passwordController;


  @override
  void initState() {
    super.initState();

    // 初始化控制器
    initController();
  }


  @override
  void reassemble() {
    super.reassemble();

    initController();
  }

  void initController(){
    _urlController = TextEditingController();
    _accountController = TextEditingController();
    _passwordController = TextEditingController();

    if(PlatformUtils.isWeb && UserInfo.getInfo().baseUrl == ""){
      var url = Uri.parse(js.context['location']['href']);
      _urlController.text = url.origin;
    }else{
      _urlController.text = UserInfo.getInfo().baseUrl;
    }

    _accountController.text = UserInfo.getInfo().username;
    _passwordController.text = UserInfo.getInfo().password;
  }


  @override
  void dispose() {
    super.dispose();
    _urlController.dispose();
    _passwordController.dispose();
    _accountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录页"),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            height: 350,
            left: 30,
            right: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: TextField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                          labelText: "服务器地址："
                      ),
                      // enabled: !PlatformUtils.isWeb,
                    )
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: TextField(
                      controller: _accountController,
                      decoration: const InputDecoration(
                         labelText: "账           号："
                      ),
                    )
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child:  TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          labelText: "密           码：",
                      ),
                    )
                ),
                SizedBox(
                    child: Center(
                      child: InkWell(//在最外层包裹InkWell组件
                        onTap: (){
                            login();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightBlue
                          ),
                          child: const Center(//加上Center让文字居中
                            child: Text('登  录',style: TextStyle(fontSize: 20),),
                          ),
                        ),
                      )
                      ,
                    )
                )
              ],
            ),
          )
        ],)
    );
  }


  void login(){
    var account = _accountController.text;
    var password = _passwordController.text;
    var url = _urlController.text;
    Log.d(account+password);
    if (url == "" || account == "" || password == ""){
        Fluttertoast.showToast(msg: "缺少参数",toastLength: Toast.LENGTH_SHORT);
        return;
    }
    Api.login(url, account, password).then((value) => {
      if (value){
        Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false),
        Fluttertoast.showToast(msg: "登录成功")
      }else{
        Fluttertoast.showToast(msg: "登录失败",textColor: Colors.red)
      }
    });
  }
}
