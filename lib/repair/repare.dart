import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/Dashboard.dart';
import 'package:mobile_app/Screens/verify/warrantycheck.dart';
import 'package:provider/provider.dart';

import '../VoiceSearch.dart';

class Repairing extends StatefulWidget {
  final area;
  final userId;
  const Repairing({this.area,this.userId,Key key}) : super(key: key);

  @override
  _RepairingState createState() => _RepairingState(area: area,userId: userId);
}

class _RepairingState extends State<Repairing> {
  final area;
  final userId;
  _RepairingState({this.area,this.userId});
  double height=0;
  double width=0;
  bool voice=false;
  bool board=false;
  bool jack=false;
  bool lcd=false;
  bool battery=false;
  bool ic=false;
  bool software=false;
  bool iCloud=false;
  bool byPass=false;
  bool unlock=false;
  bool recovery=false;
  bool pta=false;
  bool speaker=false;
  bool touch=false;
  bool button=false;
  var voiceText;
  bool isListening = false;
  String selectBrand="Select mobile";
  String selectModel="Select model";
  String error="";
  bool selectedBrand=false;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
   return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xfffffeea),
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(text: "Hardware",),
              Tab(text: "Software"),
            ],
          ),
          centerTitle: true,
          title: Text('Repairing'),
        ),
        body: TabBarView(
          children: [
            ///hardware
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Mobile Details"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          streamOfBrand()
                        ],
                      ),
                      Column(
                        children: [
                         streamOfModel()
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(color:Colors.grey,width:width*0.12,height:width*0.007,),
                      Text("  Mark Problem  "),
                      Container(color:Colors.grey,width:width*0.5,height:width*0.007,)
                    ],
                  ),
                  Container(
                    width: width*0.9,
                    height:height*0.3,
                    // color: Colors.grey,
                    child: GridView.count(
                      crossAxisCount: 2,
                    // mainAxisSpacing: 3,
                    // crossAxisSpacing: 5,
                    childAspectRatio: 3.1,
                    children: [
                      check("Board",Checkbox(
                        onChanged: (value){
                          setState(() {
                            board=value;
                          });

                        },
                        value:board,
                      ),),
                      check("Jacks",Checkbox(
                        onChanged: (value){
                          setState(() {
                            jack=value;
                          });

                        },
                        value:jack,
                      ),),
                      check("LCD",Checkbox(
                        onChanged: (value){
                          setState(() {
                            lcd=value;
                          });

                        },
                        value:lcd,
                      ),),
                      check("Battery",Checkbox(
                        onChanged: (value){
                          setState(() {
                            battery=value;
                          });

                        },
                        value:battery,
                      ),),
                      check("IC",Checkbox(
                        onChanged: (value){
                          setState(() {
                            ic=value;
                          });

                        },
                        value:ic,
                      ),),
                      check("Buttons",Checkbox(
                        onChanged: (value){
                          setState(() {
                            button=value;
                          });

                        },
                        value:button,
                      ),),
                      check("Speakers",Checkbox(
                        onChanged: (value){
                          setState(() {
                            speaker=value;
                          });

                        },
                        value:speaker,
                      ),),
                      check("Touch",Checkbox(
                        onChanged: (value){
                          setState(() {
                            touch=value;
                          });

                        },
                        value:touch,
                      ),),
                      ]
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(color:Colors.grey,width:width*0.12,height:width*0.007,),
                      Text("  Other  "),
                      Container(color:Colors.grey,width:width*0.7,height:width*0.007,)
                    ],
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  Center(
                    child: Container(
                      width: width * 0.8,
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        // color:Colors.red,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black)
                      ),
                      child:voice? SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("$voiceText",softWrap: true,style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.04,
                                color: Colors.black,
                              ),),
                            ),
                            AvatarGlow(
                                animate: isListening,
                                glowColor: Colors.deepOrange,
                                child: isListening?Icon(
                                  Icons.mic,
                                  size: MediaQuery.of(context).size.width*0.063,
                                  color: Colors.orange,
                                ):InkWell(
                                  onTap: (){
                                    setState(() {
                                      // spiner=false;
                                      voice=false;
                                      isListening=false;
                                      voiceText="Listening....";

                                    });
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    size: MediaQuery.of(context).size.width*0.063,
                                    color: Colors.red,
                                  ),
                                ),
                                endRadius:30),
                          ],
                        ),
                      ):InkWell(
                        onTap: (){
                          setState(() {
                            print(area);
                            voice=true;
                            isListening=true;
                            toggleRecording();
                          });
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.mic),
                              Text("speak"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height*0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(error,style: TextStyle(color: Colors.red),),
                  ),
                  InkWell(
                      onTap: ()async{
                        var result=await uploadHardwareData(userId.uid);
                        voiceText='';
                        isListening=false;
                        if(result==null){
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                title: Center(
                                    child: Column(
                                      children: [
                                        Text("Status",style: styleText(Colors.grey,16.0,FontWeight.normal)),
                                        Divider(
                                          color: Colors.grey,
                                          height: 5,
                                          thickness: 2,
                                        ),
                                      ],
                                    )),
                                content: Container(
                                  height: width*0.3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Text("Your Request is Successfully Posted",style: styleText(Colors.grey,13.0,FontWeight.normal),),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style:ButtonStyle(
                                                backgroundColor:MaterialStateProperty.all(Colors.blue)
                                            ),onPressed: (){
                                            Navigator.pop(ctx);
                                            Navigator.push(context, MaterialPageRoute(builder: (_)=>Dashboard()));
                                          },child: Text("Done"),),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          );
                        }
                        else
                          setState(() {
                            error="Someting went wrong";
                          });

                      },
                    child:Container(
                      width: width*0.3,
                      height: width*0.1,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                          child: Text("Done",style: TextStyle(color: Colors.white),)),
                    )
                  )
                ],
              ),
            ),
            ///software
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Mobile Details"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          streamOfBrand()
                        ],
                      ),
                      Column(
                        children: [
                          streamOfModel()
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(color:Colors.grey,width:width*0.12,height:width*0.007,),
                      Text("  Mark Problem  "),
                      Container(color:Colors.grey,width:width*0.5,height:width*0.007,)
                    ],
                  ),
                  Container(
                    width: width*0.9,
                    height:height*0.3,
                    // color: Colors.grey,
                    child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        childAspectRatio: 3.2,
                        children: [
                          check("Software",Checkbox(
                            onChanged: (value){
                              setState(() {
                                software=value;
                              });

                            },
                            value:software,
                          ),),
                          check("Unlocking",Checkbox(
                            onChanged: (value){
                              setState(() {
                                unlock=value;
                              });

                            },
                            value:unlock,
                          ),),
                          check("iCloud",Checkbox(
                            onChanged: (value){
                              setState(() {
                                iCloud=value;
                              });

                            },
                            value:iCloud,
                          ),),
                          check("Recovery",Checkbox(
                            onChanged: (value){
                              setState(() {
                                recovery=value;
                              });

                            },
                            value:recovery,
                          ),),
                          check("By Pass",Checkbox(
                            onChanged: (value){
                              setState(() {
                                byPass=value;
                              });

                            },
                            value:byPass,
                          ),),
                          check("PTA",Checkbox(
                            onChanged: (value){
                              setState(() {
                                pta=value;
                              });

                            },
                            value:pta,
                          ),),

                        ]
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(color:Colors.grey,width:width*0.12,height:width*0.007,),
                      Text("  Other  "),
                      Container(color:Colors.grey,width:width*0.7,height:width*0.007,)
                    ],
                  ),
                  SizedBox(
                    height: height*0.02,
                  ),
                  Center(
                    child: Container(
                      width: width * 0.8,
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        // color:Colors.red,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black)
                      ),
                      child:voice? SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("$voiceText",softWrap: true,style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.04,
                                color: Colors.black,
                              ),),
                            ),
                            AvatarGlow(
                                animate: isListening,
                                glowColor: Colors.deepOrange,
                                child: isListening?Icon(
                                  Icons.mic,
                                  size: MediaQuery.of(context).size.width*0.063,
                                  color: Colors.orange,
                                ):InkWell(
                                  onTap: (){
                                    setState(() {
                                      // spiner=false;
                                      voice=false;
                                      isListening=false;
                                      voiceText="Listening....";

                                    });
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    size: MediaQuery.of(context).size.width*0.063,
                                    color: Colors.red,
                                  ),
                                ),
                                endRadius:30),
                          ],
                        ),
                      ):InkWell(
                        onTap: (){
                          setState(() {
                            voice=true;
                            isListening=true;
                            toggleRecording();
                          });
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.mic),
                              Text("speak"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height*0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(error,style: TextStyle(color: Colors.red),),
                  ),
                  InkWell(
                    onTap: () async{
                      var result= await uploadSoftwareData(userId.uid);
                      voiceText='';
                      isListening=false;
                      if(result==null){
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                              title: Center(
                                  child: Column(
                                    children: [
                                      Text("Status",style: styleText(Colors.grey,16.0,FontWeight.normal)),
                                      Divider(
                                        color: Colors.grey,
                                        height: 5,
                                        thickness: 2,
                                      ),
                                    ],
                                  )),
                              content: Container(
                                height: width*0.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Text("Your Request is Successfully Posted",style: styleText(Colors.grey,13.0,FontWeight.normal),),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style:ButtonStyle(
                                              backgroundColor:MaterialStateProperty.all(Colors.blue)
                                          ),onPressed: (){
                                          Navigator.pop(ctx);
                                          Navigator.push(context, MaterialPageRoute(builder: (_)=>Dashboard()));
                                        },child: Text("Done"),),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ),
                        );
                      }
                      else
                        setState(() {
                          error="somting went wrong";
                        });
                    },
                      child:Container(
                        width: width*0.3,
                        height: width*0.1,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                            child: Text("Done",style: TextStyle(color: Colors.white),)),
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget streamOfBrand(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('mobiles').snapshots(),
        builder: (context , snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading.....',style: deco(Colors.black, 12),);}
          else
          {
            List <DropdownMenuItem> brandList = [];
            for (int i = 0; i < snapshot.data.docs.length; i++) {
              DocumentSnapshot snap = snapshot.data.docs[i];
              brandList.add(
                  DropdownMenuItem(
                    child: Text(
                        snap.id.toString(),
                        style:deco(Colors.black,width*0.04)),
                    value: "${snap.id}",
                  )
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton<dynamic>(

                  iconSize: MediaQuery.of(context).size.width*0.05,
                  items: brandList.toList(),
                  onChanged:(value){
                    setState(() {
                      selectBrand=value;

                    });
                  },
                  isExpanded: false,


                  hint: new Text(selectBrand,
                      style: deco(Colors.black,width*0.04)),
                )
              ],
            );
          }

        });
  }
  Widget streamOfModel(){
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('mobiles').doc(selectBrand).collection('models').snapshots(),
        builder: (context , snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading.....',style: deco(Colors.black, 12),);}
          else
          {
            List <DropdownMenuItem> modelList = [];
            for (int i = 0; i < snapshot.data.docs.length; i++) {
              DocumentSnapshot snap = snapshot.data.docs[i];
              modelList.add(
                  DropdownMenuItem(
                    child: Text(
                        snap.id.toString(),
                        style:deco(Colors.black,width*0.04)),
                    value: "${snap.id}",
                  )
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DropdownButton<dynamic>(

                  iconSize: width*0.05,
                  items: modelList.toList(),
                  onChanged:(value){
                    setState(() {
                      selectModel=value;

                    });
                  },
                  isExpanded: false,


                  hint: new Text(selectModel,
                      style: deco(Colors.black,width*0.04)),
                )
              ],
            );
          }

        });
  }
  TextStyle deco(Color color, double size) {
    return TextStyle(
      fontSize: size,
      // fontWeight: FontWeight.w900,
      color: color,
      // fontFamily: 'Times new roman',
    );
  }
  Future toggleRecording() async{
    if(isListening==true)
      SpeechApi.toggleRecording(
        onResult: (text) => setState(() {
          this.voiceText = text;
          isListening=false;
        }),

        onListening: (isListening) {
          this.isListening = isListening;
          setState(() => this.isListening = isListening);
        },
      );
  }
  Widget check(text,check){
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:8.0,left: 5.0,bottom: 8.0),
            child: Container(
                height: height*0.05,
                width: width*0.45,
                decoration:BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [
                    check,
                    Text("$text:",style: styleText(Colors.black, width*0.035,"Arial"),),
                  ],
                )
            ),
          ),

        ],
      ),
    );
  }
  TextStyle styleText(color,size,family){
    return TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
    );
  }
  Future uploadHardwareData(user)async {
    return await FirebaseFirestore.instance.collection("repair").
    doc(area).collection("hardwareRepair").doc(user).set(
        {
          "mobile":selectBrand,
          "model":selectModel,
          "details":voiceText.toString(),
          "battery":battery.toString(),
          "Jacks":jack.toString(),
          "speaker":speaker.toString(),
          "lcd":lcd.toString(),
          "board":board.toString(),
          "IC":ic.toString(),
          "Touch":touch.toString(),
          "Button":button.toString(),
          "shopAddress":"",
          "shopName":"",
          "contact":"",
          "userId":user,
          "status":"pending"
        }
    );
  }
  Future uploadSoftwareData(user)async {
    return await FirebaseFirestore.instance.collection("repair").
    doc(area).collection("softwareRepair").doc(user).set(
        {
          "mobile":selectBrand,
          "model":selectModel,
          "details":voiceText.toString(),
          "Software":software.toString(),
          "UnLocking":unlock.toString(),
          "PTA":pta.toString(),
          "icloud":iCloud.toString(),
          "Recovery":recovery.toString(),
          "ByPass":byPass.toString(),
          "shopAddress":"",
          "shopName":"",
          "contact":"",
          "userId":user,
          "status":"pending"
        }
    );
  }
}
