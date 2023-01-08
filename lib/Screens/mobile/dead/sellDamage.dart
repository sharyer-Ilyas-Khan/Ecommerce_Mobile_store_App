import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../VoiceSearch.dart';

class DamagedPhone extends StatefulWidget {
  const DamagedPhone({Key key}) : super(key: key);

  @override
  _DamagedPhoneState createState() => _DamagedPhoneState();
}

class _DamagedPhoneState extends State<DamagedPhone> {
  bool frontCamera=false;
  bool backCamera=false;
  bool cameraGlass=false;
  bool battery=false;
  bool fingerPrint=false;
  bool chargingJack=false;
  bool volumeKey=false;
  bool powerKey=false;
  bool simTray=false;
  bool speaker=false;
  bool screen=false;
  bool earphone=false;
  bool mic=false;
  bool casing=false;
  bool board= false;
  bool headPhoneJack=false;
  bool flashLight=false;
  bool otherStrips=false;
  String selectBrand="Select mobile";
  String selectModel="Select model";
  String selectColor="black";
  String selectCondition="2";
  var sellingPrice;
  String text = 'Tap on button and speak something.';
  bool isListening = false;
  double height=0;
  double width=0;
  bool voice=false;
  var voiceText;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        title: Text("Damaged Phone"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left:width*0.06,right:width*0.05,top: width*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      streamOfBrand(),
                      SizedBox(
                        width: width*0.3,
                      ),
                      dropDown("Color",
                          DropdownButton
                            (
                            underline: Container(),
                            iconSize: height*0.05,
                            onChanged: (val){
                              setState(() {
                                selectColor=val;
                              });
                            },
                            hint:new Text(selectColor),
                            focusColor: Colors.grey,
                            items: [
                              DropdownMenuItem(
                                child: Text("Red"),
                                value: 'red',
                              ),
                              DropdownMenuItem(child: Text("Blue"),value: 'blue',),
                              DropdownMenuItem(child: Text("Black"),value: 'black',),
                              DropdownMenuItem(child: Text("Green"),value: 'green',),
                              DropdownMenuItem(child: Text("Golden"),value: 'golden',),
                              DropdownMenuItem(child: Text("other"),value: 'other',),
                            ],
                            style: styleText(Colors.black, width*0.03),
                          )),

                    ],

                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      streamOfModel(),
                      SizedBox(
                        width: width*0.3,
                      ),
                      dropDown("Condition",DropdownButton
                        (
                        underline: Container(),
                        iconSize: height*0.05,
                        onChanged: (val){
                          setState(() {
                            selectCondition=val;
                          });
                        },
                        hint:new Text("$selectCondition/10"),
                        focusColor: Colors.grey,
                        items: [
                          DropdownMenuItem(child: Text("4/10"),value:"4",),
                          DropdownMenuItem(child: Text("5/10"),value:"5",),
                          DropdownMenuItem(child: Text("6/10"),value:"6"),
                          DropdownMenuItem(child: Text("7/10"),value:"7"),
                          DropdownMenuItem(child: Text("8/10"),value:"8"),
                          DropdownMenuItem(child: Text("9/10"),value:"9"),
                          DropdownMenuItem(child: Text("10/10"),value:"10"),],
                        style: styleText(Colors.black, width*0.03,),
                      )),
                    ],

                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  height: 2,
                  width: 50,
                ),
                Text("Mark Available Parts"),
                Container(
                  color: Colors.blue,
                  height: 2,
                  width: 50,
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left:width*0.01,right:width*0.05,top: width*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      check("Board",
                        CheckboxListTile(
                          dense: true,
                          // contentPadding: EdgeInsets.all(0.0),
                          title: Text("Board"),
                          activeColor: Colors.blue,
                          onChanged: (value){
                            setState(() {
                              board=value;
                            });

                          },
                          value:board,
                        ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Screen", CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Screen"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            screen=value;
                          });

                        },
                        value:screen,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Front Camera", CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Front Camera"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            frontCamera=value;
                          });

                        },
                        value:frontCamera,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Back Camera", CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Back Camera"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            backCamera=value;
                          });

                        },
                        value:backCamera,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Camera Glass", CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Camera Glass"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            cameraGlass=value;
                          });

                        },
                        value:cameraGlass,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Battery",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Battery"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            battery=value;
                          });

                        },
                        value:battery,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Finger Print",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Finger Print"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            fingerPrint=value;
                          });

                        },
                        value:fingerPrint,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("ChargingJack",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("ChargingJack"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            chargingJack=value;
                          });

                        },
                        value:chargingJack,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Flash Light",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Flash Light"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            flashLight=value;
                          });

                        },
                        value:flashLight,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                    ],

                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      check("Volume Key",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Volume Key"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            volumeKey=value;
                          });

                        },
                        value:volumeKey,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Power Key",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Power Key"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            powerKey=value;
                          });

                        },
                        value:powerKey,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Sim Tray",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Sim Tray"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            simTray=value;
                          });

                        },
                        value:simTray,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Speaker",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Speaker"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            speaker=value;
                          });

                        },
                        value:speaker,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Earphone",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Earphone"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            earphone=value;
                          });

                        },
                        value:earphone,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Mic",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Mic"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            mic=value;
                          });

                        },
                        value:mic,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Casing",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Casing"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            casing=value;
                          });

                        },
                        value:casing,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Head Jack",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Head Jack"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            headPhoneJack=value;
                          });

                        },
                        value:headPhoneJack,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Other Strips",CheckboxListTile(
                        dense: true,
                        // contentPadding: EdgeInsets.all(0.0),
                        title: Text("Other Strips"),
                        activeColor: Colors.blue,
                        onChanged: (value){
                          setState(() {
                            otherStrips=value;
                          });

                        },
                        value:otherStrips,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                    ],

                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                  width: width*0.7,
                  height: width*0.13,
                  child: TextFormField(
                      onChanged: (val){
                        setState(() {
                          sellingPrice=val;
                        });
                      },
                      decoration: inputDeco('Selling Price')
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("More Details"),
            ),
            Center(
              child: Container(
                width: width * 0.6,
                height: height * 0.15,
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
                ):
                InkWell(
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
            Center(
              child:ElevatedButton(
                style:ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.black)
                ),

                onPressed: (){
                  uploadData();
                },

                child: Text("Sell",style: styleText(Colors.white, width*0.05,),),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget dropDown(text,child){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$text:",style: styleText(Colors.black, width*0.035),),
        Padding(
          padding: const EdgeInsets.only(top:8.0,left: 8.0,bottom: 8.0),
          child: Container(
            height: height*0.05,
            width: width*0.4,
            decoration:BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)
            ),
            child:   Center(
                child: child
            ),
          ),
        ),

      ],
    );
  }
  Widget check(text,check){
    return  Padding(
      padding: const EdgeInsets.only(top:0.0,left: 5.0,bottom: 8.0),
      child: Container(
          height: height*0.07,
          width: width*0.45,
          decoration:BoxDecoration(
              color: Colors.grey.shade300,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(12)
          ),
          child:Center(child:check)
        // child: Row(
        //   children: [
        //     check,
        //     Text("$text",style: styleText(Colors.black, width*0.035),),
        //   ],
        // )
      ),
    );
  }
  TextStyle styleText(color,size,){
    return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: "fred"
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
    );
  }
//   if(comment=="true")
//   DataCell(
//   Checkbox(
//   value: true,
//   onChanged: (value)async{
//   await FirebaseFirestore.instance.collection('permissions').doc(documentSnapshot.id).update({"comment":"false"});
// },
// )
// ),
// if(comment=="false")
// DataCell(
// Checkbox(
// value: false,
// onChanged: (value)async{
// await FirebaseFirestore.instance.collection('permissions').doc(documentSnapshot.id).update({"comment":"true"});
// },
// )
  InputDecoration inputDeco(String text){
    return InputDecoration(
      labelStyle: TextStyle(
          fontSize: 12
      ),
      labelText: '$text',
      border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(12),
          borderSide:BorderSide(color: Colors.black,
              width: 2) ),


    );
  }
  Future uploadData()async {
    return await FirebaseFirestore.instance.collection("deadphones").doc().set(
        {
          "mobile":selectBrand,
          "model":selectModel,
          "condition":selectCondition,
          "color":selectColor,
          "price":sellingPrice,
          "details":voiceText,
          "frontCamera":frontCamera.toString(),
          "backCamera":backCamera.toString(),
          "cameraGlass":cameraGlass.toString(),
          "battery":battery.toString(),
          "fingerPrint":fingerPrint.toString(),
          "chargingJack":chargingJack.toString(),
          "volumeKey":volumeKey.toString(),
          "powerKey":powerKey.toString(),
          "simTray":simTray.toString(),
          "speaker":speaker.toString(),
          "screen":screen.toString(),
          "earphone":earphone.toString(),
          "mic":mic.toString(),
          "casing":casing.toString(),
          "board":board.toString(),
          "headPhoneJack":headPhoneJack.toString(),
          "flashLight":fingerPrint.toString(),
          "otherStrips":otherStrips.toString(),
        }
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
}
