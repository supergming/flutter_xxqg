import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:study_xxqg/base/http/api.dart';
import 'package:study_xxqg/base/log/log.dart';
import 'package:study_xxqg/base/model/UserInfoBean.dart';
import 'package:date_format/date_format.dart';
import 'package:study_xxqg/base/user/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {




  List<UserInfoBean> _list = [];


  @override
  void activate() {
    super.activate();
    Log.d("active");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(itemBuilder: (BuildContext context,int index){
              return InkWell(
                onLongPress: (){
                  deleteUser(context,_list[index].uid ?? "");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    !_list[index].isStudy!
                                        ? const SizedBox.shrink()
                                        : const SizedBox(
                                      width: 15,
                                      height: 15,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: _list[index].isStudy! ? 0 : 5,
                                    ),
                                    Expanded(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Text(
                                          _list[index].nick ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            // color: ref.watch(themeProvider).themeColor.titleColor(),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Material(
                                color: Colors.transparent,
                                child: Text(
                                 formatDate(DateTime.fromMicrosecondsSinceEpoch(_list[index].loginTime!*1000000), [yyyy, '-', mm, '-', dd," ",HH,":",nn,";",ss]),
                                  maxLines: 1,
                                  style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.cyan,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(child: Row(
                                children: [
                                  InkWell(//??????????????????InkWell??????
                                    onTap: (){
                                      changeStudy(_list[index].isStudy ?? false, _list[index].uid ?? "");
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: !_list[index].isStudy! ? Colors.blue : Colors.red
                                      ),
                                      child:  Center(//??????Center???????????????
                                        child: Text(!_list[index].isStudy! ? "????????????" : "????????????",style: const TextStyle(fontSize: 20),),
                                      ),
                                    ),
                                  ),

                                ],
                              )),
                              InkWell(//??????????????????InkWell??????
                                onTap: (){
                                  showScore(context,_list[index].token ?? "");
                                },
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.yellow
                                  ),
                                  child:  const Center(//??????Center???????????????
                                    child: Text("????????????",style: TextStyle(fontSize: 20),),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 5,
                      indent: 15,
                    ),
                  ],
                ),
              );
        },itemCount: _list.length,),
      ),
    );
  }


  Future<void> onRefresh()async {


      var users = await Api.getUsers();
      setState((){
        _list = users;
      });
  }

  void changeStudy(bool isStudy,String uid)async{
    if(isStudy){
      await Api.stopStudy(uid);
    }else{
      await Api.startStudy(uid);
    }
    await onRefresh();
  }
  
  void deleteUser(BuildContext ctx, String uid)async{
    if (UserInfo.getInfo().isAdmin){
      var dialog = AlertDialog(title: const Text("????????????"),content: Text("?????????????????????????????????"),actions:  <Widget>[
        TextButton(
          child: const Text('??????'),
          onPressed: (){
            Navigator.of(context).pop();//????????????
          },
        ),
        TextButton(
          child: const Text("??????"),
          onPressed: (){
            Api.deleteUser(uid).then((value) => {
              if (value){
                Fluttertoast.showToast(msg: "???????????????"),
                onRefresh()
              }
            });
            Navigator.of(context).pop();//????????????
          },
        )
      ]);
      showDialog(context: ctx, builder: (ctx){
        return dialog;
      });
    }else{
      Fluttertoast.showToast(msg: "?????????????????????");
    }
  }

  void showScore(BuildContext ctx, String token)async{
      String score = await Api.score(token);
      var dialog = AlertDialog(title: const Text("????????????"),content: Text(score));
      showDialog(context: ctx, builder: (ctx){
          return dialog;
      });
  }

  @override
  void initState() {
    super.initState();
    onRefresh();
  }
}
