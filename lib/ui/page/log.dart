import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study_xxqg/base/http/api.dart';

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  String _log = "";
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("日志"),),
        body: Scrollbar(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      _log.split("\n").reversed.join("\n"),
                      overflow: TextOverflow.visible,
                      maxLines: null,
                    )))));
  }

  @override
  void initState() {
    super.initState();
    Api.getLog().then((value) => {
          setState(() {
            _log = value;
          })
        });
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      Api.getLog().then((value) => {
            setState(() {
              _log = value;
            })
          });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
