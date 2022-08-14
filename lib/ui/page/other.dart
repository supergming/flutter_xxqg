import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study_xxqg/base/user/user.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
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
