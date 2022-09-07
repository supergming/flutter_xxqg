import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study_xxqg/base/http/api.dart';
import 'package:study_xxqg/base/log/log.dart';
import 'package:study_xxqg/base/model/Config.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {


  Config? _config;

  void onSave(BuildContext ctx)async{
    Log.d(_config!.cron);
    var dialog = AlertDialog(title: const Text("确认修改"),content: const Text("你确认要修改配置文件吗？\n将会覆盖默认生成的配置文件！"),actions:  <Widget>[
      TextButton(
        child: const Text('取消'),
        onPressed: (){
          Navigator.of(context).pop();//关闭弹框
        },
      ),
      TextButton(
        child: const Text("确认"),
        onPressed: (){
          Api.setConfig(_config!).then((value) => {
            if (value){
              Fluttertoast.showToast(msg: "配置保存成功！"),
            }
          });
          Navigator.of(context).pop();//关闭弹框
        },
      )
    ]);
    showDialog(context: ctx, builder: (ctx){
      return dialog;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("配置管理"),actions: <Widget>[
        // 非隐藏的菜单
        IconButton(
            icon: const Icon(Icons.save),
            tooltip: '保存配置',
            onPressed: () {
              onSave(context);
            }
        ),
      ]),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: _config != null ? ListView(
          children: [

            const Text("基本配置",style: TextStyle(color: Colors.red,fontSize: 25,fontStyle: FontStyle.normal),),
            const Divider(height: 10,color: Colors.black,),
            TextField(
              controller: TextEditingController(text: _config!.model.toString()),
              decoration: const InputDecoration(
                  labelText: "运行模式",
                  labelStyle: TextStyle(fontSize: 20),
                hintText: "1只做视频和文章"
              ),
              keyboardType: TextInputType.number,
              onChanged: (value){
                  _config!.model = 1;

              },

              // enabled: !PlatformUtils.isWeb,
            ),


            // const Divider(height: 5,color: Colors.cyan,),
            TextField(
              controller: TextEditingController(text: _config!.logLevel),
              decoration: const InputDecoration(
                  labelText: "日志等级",
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: "日志等级",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.logLevel = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ),


            // const Divider(height: 5,color: Colors.cyan,),



            TextField(
              controller: TextEditingController(text: _config!.scheme),
              decoration: const InputDecoration(
                labelText: "跳转scheme",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "登录链接的跳转scheme",
              ),
              keyboardType: TextInputType.url,
              onChanged: (value){

                  _config!.scheme = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ),
            // const Divider(height: 5,color: Colors.cyan,),

            TextField(
              controller: TextEditingController(text: _config!.cron),
              decoration: const InputDecoration(
                labelText: "定时配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "定时cron配置，具体可百度搜索cron语法",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.cron = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ),
            // const Divider(height: 5,color: Colors.cyan,),

            TextField(
              controller: TextEditingController(text: _config!.cronRandomWait.toString()),
              decoration: const InputDecoration(
                labelText: "定时延长启动时间",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "定时任务随机延迟启动时间，单位分钟",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value){

                  _config!.cronRandomWait = int.parse(value);

              },
              // enabled: !PlatformUtils.isWeb,
            ),
            // const Divider(height: 5,color: Colors.cyan,),

            TextField(
              controller: TextEditingController(text: _config!.edgePath),
              decoration: const InputDecoration(
                labelText: "edge浏览器路径",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "windows环境自定义浏览器路径，仅支持chromium系列",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.edgePath = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ),
            // const Divider(height: 5,color: Colors.cyan,),


            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否显示浏览器", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.showBrowser,onChanged: (value){

                              _config!.showBrowser = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否推送二维码", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.qrCode,onChanged: (value){

                              _config!.qrCode = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),


            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否倒序答题", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.reverseOrder,onChanged: (value){

                              _config!.reverseOrder = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否开启热重载", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.hotReload,onChanged: (value){

                              _config!.hotReload = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),
            const SizedBox(height: 30,),
            const Text("TG推送配置",style: TextStyle(color: Colors.red,fontSize: 25,fontStyle: FontStyle.normal),),
            const Divider(height: 10,color: Colors.black,),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否开启tg配置", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.tg.enable,onChanged: (value){

                              _config!.tg.enable = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),

            _config!.tg.enable ? TextField(
              controller: TextEditingController(text: _config!.tg.chatId.toString()),
              decoration: const InputDecoration(
                labelText: "tg管理员user_id",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "管理员的user_id",
              ),
              keyboardType: TextInputType.number,
              onChanged: (value){

                  _config!.tg.chatId = int.parse(value);

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.tg.enable ? TextField(
              controller: TextEditingController(text: _config!.tg.token),
              decoration: const InputDecoration(
                labelText: "tg机器人的token",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "tg机器人的token,从botFather处获得",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.tg.token = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.tg.enable ? TextField(
              controller: TextEditingController(text: _config!.tg.proxy),
              decoration: const InputDecoration(
                labelText: "代理配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "tg机器人代理配置，若不配做默认走系统代理",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.tg.proxy = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.tg.enable ? TextField(
              controller: TextEditingController(text: _config!.tg.customApi),
              decoration: const InputDecoration(
                labelText: "自定义api",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "自行搭建的api，一般使用cloudflare搭建",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.tg.customApi = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),


            _config!.tg.enable ? TextField(
              controller: TextEditingController(text: _config!.tg.whiteList.join("&")),
              decoration: const InputDecoration(
                labelText: "白名单配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "tg白名单配置，配置允许使用的用户或者群的id,多个中间用&符号隔开",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){
                List<int> whiteList = [];
                value.split("&").forEach((element) {
                  whiteList.add(int.parse(element));
                });

                  _config!.tg.whiteList = whiteList;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),


            const SizedBox(height: 30,),
            const Text("Web端配置",style: TextStyle(color: Colors.red,fontSize: 25,fontStyle: FontStyle.normal),),
            const Divider(height: 10,color: Colors.black,),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否开启web配置", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.web.enable,onChanged: (value){

                              _config!.web.enable = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),

            _config!.web.enable ? TextField(
              controller: TextEditingController(text: _config!.web.host),
              decoration: const InputDecoration(
                labelText: "web端监听地址",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "web端监听地址，例如：0.0.0.0",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.web.host = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.web.enable ? TextField(
              controller: TextEditingController(text: _config!.web.port.toString()),
              decoration: const InputDecoration(
                labelText: "web端监听端口",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "web端监听端口，默认：8080",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.web.port = int.parse(value);

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.web.enable ? TextField(
              controller: TextEditingController(text: _config!.web.account),
              decoration: const InputDecoration(
                labelText: "web端管理员账号",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "web端管理员账号",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.web.account = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),


            _config!.web.enable ? TextField(
              controller: TextEditingController(text: _config!.web.password),
              decoration: const InputDecoration(
                labelText: "web端管理员密码",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "web端管理员密码",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.web.password = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.web.enable ? TextField(
              controller: TextEditingController(text: ((){
                var data = [];
                Log.d(_config!.web.commonUser);
                _config!.web.commonUser.forEach((key, value) {
                  data.add("$key:$value");
                });
                return data.join("&");
              })()),
              decoration: const InputDecoration(
                labelText: "web端普通用户配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "web端跑一趟用户配置,账号与密码之间用冒号连接，多个账号用&连接",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                var users = value.split("&");
                Map<String,String> data = {};
                for (var element in users) {
                  data[element.split(":")[0]] = element.split(":")[1];
                }


                  _config!.web.commonUser = data;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),


            const SizedBox(height: 30,),
            const Text("Wechat端配置",style: TextStyle(color: Colors.red,fontSize: 25,fontStyle: FontStyle.normal),),
            const Divider(height: 10,color: Colors.black,),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否开启wechat配置", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.wechat.enable,onChanged: (value){

                              _config!.wechat.enable = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),

            _config!.wechat.enable ? TextField(
              controller: TextEditingController(text: _config!.wechat.token),
              decoration: const InputDecoration(
                labelText: "token配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "token配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.wechat.token = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.wechat.enable ? TextField(
              controller: TextEditingController(text: _config!.wechat.secret),
              decoration: const InputDecoration(
                labelText: "secret配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "secret配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.wechat.secret = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.wechat.enable ? TextField(
              controller: TextEditingController(text: _config!.wechat.appId),
              decoration: const InputDecoration(
                labelText: "app_id配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "app_id配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.wechat.appId = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),


            _config!.wechat.enable ? TextField(
              controller: TextEditingController(text: _config!.wechat.loginTempId),
              decoration: const InputDecoration(
                labelText: "登录模板消息配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "登录模板消息配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.wechat.loginTempId = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.wechat.enable ? TextField(
              controller: TextEditingController(text: _config!.wechat.normalTempId),
              decoration: const InputDecoration(
                labelText: "普通模板消息配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "普通模板消息配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.wechat.normalTempId = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.wechat.enable ? TextField(
              controller: TextEditingController(text: _config!.wechat.superOpenId),
              decoration: const InputDecoration(
                labelText: "微信管理员的open_id",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "微信管理员的open_id",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.wechat.superOpenId = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            const SizedBox(height: 30,),
            const Text("PushDeer配置",style: TextStyle(color: Colors.red,fontSize: 25,fontStyle: FontStyle.normal),),
            const Divider(height: 10,color: Colors.black,),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否开启pushdeer配置", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.pushDeer.enable,onChanged: (value){

                              _config!.pushDeer.enable = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),

            _config!.pushDeer.enable ? TextField(
              controller: TextEditingController(text: _config!.pushDeer.api),
              decoration: const InputDecoration(
                labelText: "pushDeer的api配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "pushDeer的api配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.pushDeer.api = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.pushDeer.enable ? TextField(
              controller: TextEditingController(text: _config!.pushDeer.token),
              decoration: const InputDecoration(
                labelText: "pushDeer的token配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "pushDeer的token配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.pushDeer.token= value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            const SizedBox(height: 30,),
            const Text("钉钉推送配置",style: TextStyle(color: Colors.red,fontSize: 25,fontStyle: FontStyle.normal),),
            const Divider(height: 10,color: Colors.black,),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否开启钉钉配置", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.push.ding.enable,onChanged: (value){

                              _config!.push.ding.enable = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),

            _config!.push.ding.enable ? TextField(
              controller: TextEditingController(text: _config!.push.ding.accessToken),
              decoration: const InputDecoration(
                labelText: "钉钉access_token配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "钉钉access_token配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.push.ding.accessToken = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            _config!.push.ding.enable ? TextField(
              controller: TextEditingController(text: _config!.push.ding.secret),
              decoration: const InputDecoration(
                labelText: "钉钉secret配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "钉钉secret配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.push.ding.secret= value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),


            const SizedBox(height: 30,),
            const Text("pushPlus推送配置",style: TextStyle(color: Colors.red,fontSize: 25,fontStyle: FontStyle.normal),),
            const Divider(height: 10,color: Colors.black,),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              // padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              // margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children:  [
                  const Expanded(
                      flex: 3,
                      child: Align(
                        alignment: FractionalOffset.centerLeft,
                        child: Text("是否开启pushplus配置", style: TextStyle(fontSize: 20),),
                      )),
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: FractionalOffset.centerRight,
                          child: Switch(value: _config!.push.pushPlus.enable,onChanged: (value){

                              _config!.push.pushPlus.enable = value;

                          },)
                      ))
                ],
              ),
            ),
            const Divider(height: 5,color: Colors.cyan,),

            _config!.push.pushPlus.enable ? TextField(
              controller: TextEditingController(text: _config!.push.pushPlus.token),
              decoration: const InputDecoration(
                labelText: "pushplus的token配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "pushplus的token配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.push.pushPlus.token = value;

              },
              // enabled: !PlatformUtils.isWeb,
            ) : const SizedBox(),

            const SizedBox(height: 30,),
            const Text("其他配置",style: TextStyle(color: Colors.red,fontSize: 25,fontStyle: FontStyle.normal),),
            const Divider(height: 10,color: Colors.black,),

            TextField(
              controller: TextEditingController(text: _config!.customCron),
              decoration: const InputDecoration(
                labelText: "自定义消息推送定时配置",
                labelStyle: TextStyle(fontSize: 20),
                hintText: "自定义消息推送定时配置",
              ),
              keyboardType: TextInputType.text,
              onChanged: (value){

                  _config!.customCron= value;

              },
              // enabled: !PlatformUtils.isWeb,
            ),

        TextField(
          controller: TextEditingController(text: _config!.customMessage),
          decoration: const InputDecoration(
            labelText: "自定义消息推送内容配置",
            labelStyle: TextStyle(fontSize: 20),
            hintText: "自定义消息推送内容配置",
          ),
          keyboardType: TextInputType.text,
          onChanged: (value){

              _config!.customMessage= value;

          },
          // enabled: !PlatformUtils.isWeb,
        ),
              // enabled: !PlatformUtils.isWeb,


          ]
        ) : const Text(""),





      ),
    );
  }


  @override
  void reassemble() {
    super.reassemble();
    Api.getConfig().then((value) => {
      setState((){
        _config = value;
      })
    });
  }

  @override
  void initState() {
    Log.d("开始执行");
    super.initState();
    Api.getConfig().then((value) => {
      setState((){
        _config = value;
      })
    });
  }
}
