import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/repair/repairDetails.dart';
class NotificationClass extends StatefulWidget {
  final area;
  final userId;
  final notify;
  const NotificationClass({this.area,this.userId,this.notify,Key key}) : super(key: key);

  @override
  _NotificationClassState createState() => _NotificationClassState(area: area,userId: userId,notify: notify);
}

class _NotificationClassState extends State<NotificationClass> {
  final area;
  final userId;
  final notify;
  _NotificationClassState({this.area,this.userId,this.notify});
  double height=0.0;
  double width=0.0;

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(text: "Hardware",),
              Tab(text: "Software"),
            ],
          ),
          centerTitle: true,
          title: Text('Requests'),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            ///hardware repair
            Container(
              height: height,
              width: width,
              child:Padding(
                padding:  EdgeInsets.all(10.0),
                child:  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection("repair").doc(area).collection("hardwareRepair").
                      where("userId",isEqualTo: userId).
                  snapshots(),
                  builder: (_,snap){
                    // dataList=[];
                    if(snap.hasError){
                      return Text("");
                    }
                    if(snap.hasData){
                      return  ListView.builder(
                        itemCount: snap.data.docs.length,
                        itemBuilder: (_, i) {
                          DocumentSnapshot snaps = snap.data.docs[i];
                          var mobile=snaps.get('mobile');
                          var model=snaps.get('model');
                          var detail=snaps.get("details")??"No Details";
                          var battery=snaps.get("battery");
                          var jack=snaps.get("Jacks");
                          var speaker=snaps.get("speaker");
                          var lcd=snaps.get("lcd");
                          var board=snaps.get("board");
                          var ic=snaps.get("IC");
                          var touch=snaps.get("Touch");
                          var button=snaps.get("Button");
                          var shopAddress=snaps.get("shopAddress");
                          var shopName=snaps.get("shopName");
                          var contact=snaps.get("contact");
                          var status=snaps.get("status");
                          return InkWell(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("$mobile $model"),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          // detail,
                                            (battery=="true")?"Battery":
                                            (jack=="true")?"Jacks":
                                            (speaker=="true")?"Speaker":
                                            (lcd=="true")?"LCD":
                                            (board=="true")?"Board":
                                            (ic=="true")?"IC":
                                            (touch=="true")?"Touch":
                                            (button=="true")?"Button":"",
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      ElevatedButton(
                                        style:ButtonStyle(
                                            // backgroundColor:MaterialStateProperty.all(Colors.blue)
                                        ),onPressed: (){
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (_)=>RepairingDetails(
                                                  notify: notify,
                                                  shopAddress: shopAddress,
                                                  status: status,
                                                  shopName: shopName,
                                                  contact: contact,
                                                  type: "hardwareRepair",
                                                  name: "$mobile$model",
                                                  detail: detail,
                                                  battery: battery,
                                                  lcd: lcd ,
                                                  board: board,
                                                  button: button,
                                                  ic: ic,
                                                  touch: touch,
                                                  jack: jack,
                                                  speaker: speaker,



                                                )
                                            ));
                                      },
                                        child: Text("Details"),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 3,
                                )
                              ],
                            ),
                          );
                          // return newPart(title,mobile,model,shopName,address,price,image);
                        },
                      );
                    }
                    return Text("");
                  },

                ),
              ),
            ),
            ///software repair
            Container(
              height: height,
              width: width,
              child:Padding(
                padding:  EdgeInsets.all(10.0),
                child:  StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("repair").doc(area).collection("softwareRepair").
                  where("userId",isEqualTo: userId).snapshots(),
                  builder: (_,snap){
                    // dataList=[];
                    if(snap.hasError){
                      return Text("");
                    }
                    if(snap.hasData){
                      return  ListView.builder(
                        itemCount: snap.data.docs.length,
                        itemBuilder: (_, i) {
                          DocumentSnapshot snaps = snap.data.docs[i];
                          var mobile=snaps.get('mobile');
                          var model=snaps.get('model');
                          var detail=snaps.get("details");
                          var pta=snaps.get("PTA");
                          var recovery=snaps.get("Recovery");
                          var software=snaps.get("Software");
                          var icloud=snaps.get("icloud");
                          var unlocking=snaps.get("UnLocking");
                          var bypass=snaps.get("ByPass");
                          var shopAddress=snaps.get("shopAddress");
                          var shopName=snaps.get("shopName");
                          var contact=snaps.get("contact");
                          var status=snaps.get("status");
                          return InkWell(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("$model $mobile"),
                                  subtitle: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            (pta=="true")?"PTA":
                                            (recovery=="true")?"Recovery":
                                            (software=="true")?"Software":
                                            (icloud=="true")?"Icloud":
                                            (unlocking=="true")?"Unlocking":
                                            (bypass=="true")?"ByPass": "",
                                            // (pta=="true")?"Pta":
                                            // (recovery=="true")?"Recovery":
                                            // (software=="true")?"Software":
                                            // (icloud=="true")?"icloud":
                                            // (unlocking=="true")?"unlocking":
                                            // (bypass=="true")?"bypass":"",
                                            overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                      ElevatedButton(
                                        style:ButtonStyle(
                                            // backgroundColor:MaterialStateProperty.all(Colors.blue)
                                        ),onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>
                                            RepairingDetails(
                                              notify: notify,
                                              shopAddress: shopAddress,
                                              status: status,
                                              type: "softwareRepair",
                                              shopName: shopName,
                                              contact: contact,
                                              name: "$mobile $model",
                                              detail: detail,
                                              pta: pta,
                                              software: software,
                                              icloud: icloud,
                                              bypass: bypass,
                                              unlocking: unlocking,
                                              recovery: recovery,

                                        )));
                                      },
                                        child: Text("Details"),
                                      )
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 3,
                                )
                              ],
                            ),
                          );
                          // return newPart(title,mobile,model,shopName,address,price,image);
                        },
                      );
                    }
                    return Text("");
                  },

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
