import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study_xxqg/base/http/api.dart';
import 'package:study_xxqg/base/user/user.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {



  void restart(BuildContext ctx)async{

    if (!UserInfo.getInfo().isAdmin){
      Fluttertoast.showToast(msg: "你无权使用指令！");
      return ;
    }

    var dialog = AlertDialog(title: const Text("确认重启"),content: const Text("你确认要重启应用吗？"),actions:  <Widget>[
      TextButton(
        child: const Text('取消'),
        onPressed: (){
          Navigator.of(context).pop();//关闭弹框
        },
      ),
      TextButton(
        child: const Text("确认"),
        onPressed: (){
          Api.restart().then((value) => {
            if (value){
              Fluttertoast.showToast(msg: "软件重启成功！"),
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

  void update(BuildContext ctx)async {
    if (!UserInfo
        .getInfo()
        .isAdmin) {
      Fluttertoast.showToast(msg: "你无权使用指令！");
      return;
    }

    var dialog = AlertDialog(title: const Text("确认更新"),
        content: const Text("你确认要更新应用吗？"),
        actions: <Widget>[
          TextButton(
            child: const Text('取消'),
            onPressed: () {
              Navigator.of(context).pop(); //关闭弹框
            },
          ),
          TextButton(
            child: const Text("确认"),
            onPressed: () {
              Api.update().then((value) =>
              {
                if (value){
                  Fluttertoast.showToast(msg: "软件尝试更新成功！"),
                }
              });
              Navigator.of(context).pop(); //关闭弹框
            },
          )
        ]);
    showDialog(context: ctx, builder: (ctx) {
      return dialog;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                      Navigator.of(context).pushNamed("/log");
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 5,
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "日志管理",
                          style: TextStyle(

                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  indent: 15,
                ),

                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (UserInfo.getInfo().isAdmin){
                      Navigator.of(context).pushNamed("/config");
                    }else{
                      Fluttertoast.showToast(msg: "你无权使用该指令！");
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "配置管理",
                          style: TextStyle(

                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  indent: 15,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    restart(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "重启软件",
                          style: TextStyle(

                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  indent: 15,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    update(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "更新软件",
                          style: TextStyle(

                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  indent: 15,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    UserInfo.logout();

                    Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "退出登录",
                          style: TextStyle(

                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(
                  indent: 15,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                      Api.getAbout().then((value) => {
                        Fluttertoast.showToast(msg: value)
                      });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 15,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "关于软件",
                          style: TextStyle(

                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  indent: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
