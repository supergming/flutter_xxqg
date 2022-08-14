import 'dart:async';
import'package:study_xxqg/base/utils/js.dart'  if(dart.library.html) "dart:js" as js;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:study_xxqg/base/http/api.dart';
import 'package:study_xxqg/base/log/log.dart';
import 'package:study_xxqg/base/utils/ploatform_custom.dart';
import 'package:url_launcher/url_launcher.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  String _codeUrl = "";

  String? link;

  Timer? timer;


  @override
  void dispose() {
    super.dispose();
    if(timer != null && timer!.isActive){
      timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Divider(),
        SizedBox(
            child: InkWell(
          //在最外层包裹InkWell组件
          onTap: () {
            addUser();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.cyan),
            child: const Center(
              //加上Center让文字居中
              child: Text(
                '添加用户',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )),
        const Divider(),
        SizedBox(
          child: getQrCode()
        )
      ],
    ));
  }

  Widget getQrCode(){
    if(_codeUrl==""){
      return const Text("");
    }else{
      return QrImage(
        data: _codeUrl,
        size: 150,
      );
    }
  }

  void addUser() async {
    var sign = await Api.sign();
    var code = await Api.generate();
    var codeUrl =
        "https://login.xuexi.cn/login/qrcommit?showmenu=false&code=$code&appId=dingoankubyrfkttorhpou";
    setState(() {
      _codeUrl = codeUrl;
    });

    // 如果定时器已存在且活跃中，则先退出定时器
    if (timer != null && timer!.isActive) {
      timer!.cancel();
    }

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (timer.tick == 60) {
        timer.cancel();
      }
      Api.checkQrCode(code).then((value) => {
            if (value.isSuccess())
              {
                timer.cancel(),
                Log.d(value.data ?? "   $sign"),
                Api.addUser(value.data!.split("=")[1], sign).then((value1) => {
                      if (value1)
                        {
                          Fluttertoast.showToast(msg: "添加用户成功"),
                          setState(() {
                            _codeUrl = "";
                          })
                        }
                    })
              }
          });
    });
    Log.d(
        "dtxuexi://appclient/page/study_feeds?url=${Uri.encodeComponent(codeUrl)}");
    if (PlatformUtils.isWeb){
        js.context.callMethod("go",["dtxuexi://appclient/page/study_feeds?url=${Uri.encodeComponent(codeUrl)}"]);
    }else{
      await launch(
          "dtxuexi://appclient/page/study_feeds?url=${Uri.encodeComponent(codeUrl)}");
    }

  }
}
