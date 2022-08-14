import 'package:dio_log/overlay_draggable_button.dart';
import 'package:flutter/material.dart';
import 'package:study_xxqg/base/log/log.dart';
import 'package:study_xxqg/base/user/user.dart';
import 'package:study_xxqg/base/utils/ploatform_custom.dart';
import 'package:study_xxqg/r.dart';
import 'package:study_xxqg/ui/page/add_user.dart';
import 'package:study_xxqg/ui/page/other.dart';
import 'package:study_xxqg/ui/page/user.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({Key? key}) : super(key: key);

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  void initState() {
    super.initState();
    if(!PlatformUtils.isWeb){
      initPush();
    }

    initApp();
  }

  void initPush()async{
    var push = JPush();
    push.addEventHandler(
      // 接收通知回调方法。
      onReceiveNotification: (Map<String, dynamic> message) async {
        Log.d("flutter onReceiveNotification: $message");
      },
      // 点击通知回调方法。
      onOpenNotification: (Map<String, dynamic> message) async {
        Log.d("flutter onOpenNotification: $message");
      },
      // 接收自定义消息回调方法。
      onReceiveMessage: (Map<String, dynamic> message) async {
        Log.d("flutter onReceiveMessage: $message");
      },
    );
    push.setup(
      appKey: "8a0178682322020e0c5040c9",
      channel: "developer-default",
      production: false,
      debug: true
    );
    var rid = await push.getRegistrationID();
    UserInfo.setRegisterId(rid);
  }

  void initApp() {
    UserInfo.initUserInfo().then((value) => {
          if (!UserInfo.getInfo().isLogin)
            {
              Log.d(UserInfo.getInfo()),
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login", (route) => false)
            },
    _list.add(const UserPage()),
        _list.add(const OtherPage()),
        }).onError((error, stackTrace) => {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/login", (route) => false),
    });
    _list.add(const AddUserPage());

  }

  @override
  void reassemble() {
    super.reassemble();
    initApp();
  }

  bool isDebug = false;

  int _index = 0;

  final List<Widget> _list = [];

  void _onTap(index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(onDoubleTap: (){
          if(debugBtnIsShow()){
            dismissDebugBtn();
          }else{
            showDebugBtn(context);
          }
        },child: const Text("主页"),),
      ),
      body: IndexedStack(
        index: _index,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: _onTap,
        items: [
          _getBottomNavItem(
              ' 登录', R.staticIconsLogin, R.staticIconsLoginActivepng, 0),
          _getBottomNavItem(
              '用户', R.staticIconsUser, R.staticIconsUserActive, 1),
          _getBottomNavItem(
              '其他', R.staticIconsOther, R.staticIconsOtherActive, 2)
        ],
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavItem(
      String title, String normalIcon, String pressedIcon, int index) {
    return BottomNavigationBarItem(
      icon: _index == index
          ? Image.asset(
              pressedIcon,
              width: 32,
              height: 28,
            )
          : Image.asset(
              normalIcon,
              width: 32,
              height: 28,
            ),
      label: title,
    );
  }
}
