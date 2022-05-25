import 'package:flutter/material.dart';

class AvailableDeadParts extends StatefulWidget {
  const AvailableDeadParts({Key key
    ,this.mobile,this.model,this.price,this.condition,this.color,this.details,this.frontCamera,
  this.backCamera,this.cameraGlass,this.battery,this.fingerPrint,this.chargingJack,this.volumeKey,this.powerKey,this.simTray,
  this.speaker,this.screen,this.earphone,this.mic,this.casing,this.board,
    this.headPhoneJack,this.flashLight,this.otherStrips}) : super(key: key);
  final mobile;
  final model;
  final price;
  final condition;
  final color;
  final details;
  final frontCamera;
  final backCamera;
  final cameraGlass;
  final battery;
  final fingerPrint;
  final chargingJack;
  final volumeKey;
  final powerKey;
  final simTray;
  final speaker;
  final screen;
  final earphone;
  final mic;
  final casing;
  final board;
  final headPhoneJack;
  final flashLight;
  final otherStrips;
  @override
  _AvailableDeadPartsState createState() => _AvailableDeadPartsState(
    mobile: mobile,model: model,price: price,condition: condition,color: color,details: details,
    frontCamera: frontCamera,backCamera: battery,cameraGlass: cameraGlass,battery: battery,fingerPrint: fingerPrint,
    chargingJack: chargingJack,volumeKey: volumeKey,powerKey: powerKey,simTray: simTray,speaker: speaker,
    screen: screen,earphone: earphone,mic: mic,casing: casing,board: board,headPhoneJack: headPhoneJack,flashLight: flashLight,
    otherStrips: otherStrips


  );
}

class _AvailableDeadPartsState extends State<AvailableDeadParts> {
  _AvailableDeadPartsState({
    this.mobile,this.model,this.price,this.condition,this.color,this.details,this.frontCamera,
    this.backCamera,this.cameraGlass,this.battery,this.fingerPrint,this.chargingJack,this.volumeKey,this.powerKey,this.simTray,
    this.speaker,this.screen,this.earphone,this.mic,this.casing,this.board,
    this.headPhoneJack,this.flashLight,this.otherStrips

});
  final mobile;
  final model;
  final price;
  final condition;
  final color;
  final details;
  final frontCamera;
  final backCamera;
  final cameraGlass;
  final battery;
  final fingerPrint;
  final chargingJack;
  final volumeKey;
  final powerKey;
  final simTray;
  final speaker;
  final screen;
  final earphone;
  final mic;
  final casing;
  final board;
  final headPhoneJack;
  final flashLight;
  final otherStrips;
  double height=0;
  double width=0;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Available Parts"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xfffffeea),
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
                      Text("$mobile",style: styleText(Colors.blue, width*0.05),),
                      SizedBox(
                        height: width*0.05,
                      ),
                      Text("Color:  $color"),

                    ],

                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("$model",style: styleText(Colors.blue, width*0.04),),
                      SizedBox(
                        height: width*0.05,
                      ),
                      Text("Condition:  $condition/10"),
                    ],

                  )
                ],
              ),
            ),
            SizedBox(
              height: width*0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  height: 2,
                  width: 50,
                ),
                Text("Available Parts"),
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

                      check("Board",Checkbox(
                        activeColor: Colors.blue,

                        onChanged: (val){},
                        value:(board=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Screen",Checkbox(
                        activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(screen=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Front Camera",Checkbox(
                        activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(frontCamera=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Back Camera",Checkbox(
                        activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(backCamera=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Camera Glass",Checkbox(
                        activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(cameraGlass=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Battery",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(battery=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Finger Print",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(fingerPrint=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Charging Jack",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(chargingJack=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Flash Light",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(flashLight=="true")?true:false,
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
                      check("Volume Key",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(volumeKey=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Power Key",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(powerKey=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Sim Tray",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(simTray=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Speaker",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(speaker=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Ear Phone",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(earphone=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Mic",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(mic=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Casing",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(casing=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Head Jack",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(headPhoneJack=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                      check("Other Strips ",Checkbox(activeColor: Colors.blue,
                        onChanged: (val){},
                        value:(otherStrips=="true")?true:false,
                      ),),
                      SizedBox(
                        width: width*0.3,
                      ),
                    ],

                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Price"),
            ),
            Center(
              child: Text(price)
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
                child:Center(
                  child: Text(details??"Nothing More",softWrap: true,),
                )
              ),
            ),
            Center(
              child: RaisedButton(
                color: Colors.black,
                onPressed: (){
                },

                child: Text("Buy",style: styleText(Colors.white, width*0.05,),),
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
    return  Column(
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
                  Text("$text:",style: styleText(Colors.black, width*0.03,),),
                ],
              )
          ),
        ),

      ],
    );
  }
  TextStyle styleText(color,size){
    return TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
    );
  }
  TextStyle deco(Color color, double size) {
    return TextStyle(
      fontSize: size,
      // fontWeight: FontWeight.w900,
      color: color,
      // fontFamily: 'Times new roman',
    );
  }
}
