import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RepairingDetails extends StatefulWidget {
  final notify;
  final area;
  final docId;
 final name;
 final type;
 final detail;
 final battery;
 final jack;
 final speaker;
 final lcd;
 final board;
 final ic;
 final touch;
 final button;
 final pta;
 final recovery;
 final software;
 final icloud;
 final unlocking;
 final bypass;
 final shopAddress;
 final shopName;
 final status;
 final contact;

  const RepairingDetails({this.area,this.docId,this.shopAddress,this.shopName,this.status,this.contact,
    this.notify,this.type,this.name,this.detail,this.battery,
    this.jack,this.speaker,this.lcd,this.board,
    this.ic,this.touch,this.button,this.pta,this.recovery,
    this.software,this.icloud,this.unlocking,this.bypass,
    Key key}) : super(key: key);

  @override
  _RepairingDetailsState createState() => _RepairingDetailsState(
    area: area,
    docId: docId,
    shopAddress: shopAddress,
    shopName: shopName,
    contact: contact,
    status: status,
    notify: notify,
    name: name,
    type:type,
    detail: detail,
    battery: battery,
    jack: jack,
    speaker:speaker,
    lcd: lcd,
    board: board,
    ic:ic,
    touch:touch,
    button:button,
    pta:pta,
    recovery:recovery,
   software:software,
   icloud:icloud,
   unlocking:unlocking,
   bypass:bypass,

  );
}

class _RepairingDetailsState extends State<RepairingDetails> {
  final notify;
  final area;
  final docId;
  final type;
  final name;
  final detail;
  final battery;
  final jack;
  final speaker;
  final lcd;
  final board;
  final ic;
  final touch;
  final button;
  final pta;
  final recovery;
  final software;
  final icloud;
  final unlocking;
  final bypass;
  final shopAddress;
  final shopName;
  final status;
  final contact;
  _RepairingDetailsState({this.area,this.docId,this.shopAddress,this.shopName,this.status,this.contact,this.notify,this.type,this.name,this.detail,this.battery,
    this.jack,this.speaker,this.lcd,this.board,
    this.ic,this.touch,this.button,this.pta,this.recovery,
  this.software,this.icloud,this.unlocking,this.bypass,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
      ),
      body: Container(
          child: (type=="hardwareRepair")?
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Name:"),
                            Text("Battery:"),
                            Text("Jack:"),
                            Text("Speaker:"),
                            Text("LCD:"),
                            Text("Board:"),
                            Text("IC:"),
                            Text("Touch:"),
                            Text("Buttons:"),
                            Text("Status"),
                            Text("Details:"),

                            (notify==true && status!="pending")?Text("Shop Name"):Container(),
                            (notify==true && status!="pending")?Text("Contact"):Container(),
                            (notify==true && status!="pending")?Text("Shop Address"):Container(color: Colors.red,),

                            Container(
                              height: 50,
                              width: 2,
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(name,style: TextStyle(color: Colors.blue)),
                            Text((battery=="true")?"damage":"fine",style: styles(battery)),
                            Text((jack=="true")?"damage":"fine",style: styles(jack)),
                            Text((speaker=="true")?"damage":"fine",style: styles(speaker)),
                            Text((lcd=="true")?"damage":"fine",style: styles(lcd)),
                            Text((board=="true")?"damage":"fine",style: styles(board)),
                            Text((ic=="true")?"damage":"fine",style: styles(ic)),
                            Text((touch=="true")?"damage":"fine",style: styles(touch)),
                            Text((button=="true")?"damage":"fine",style: styles(button)),
                            Text((status=="pending")?"Pending":"Accept",style: styles(status)),
                            Container(
                                height: 70,
                                width: 200,
                                child: Text((detail=="")?"No Details":detail,softWrap:true,style: TextStyle(color: Colors.grey))),
                            (notify==true && status!="pending")?Text(shopName):Container(),
                            (notify==true && status!="pending")?Text(contact):Container(),
                            (notify==true && status!="pending")?Container(height: 40,width: 200,
                                child: Text(shopAddress,softWrap: true,style: TextStyle(color: Colors.blue))):
                            Container(),



                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (notify==true)?RaisedButton(onPressed: (){
                      print(notify);
                    },
                      color: Colors.red,
                      child: Text("Cancel"),

                    ):RaisedButton(onPressed: (){
                      update();
                      print(notify);
                      },
                    color: Colors.green,
                    child: Text("Book"),

    ),
                  ],
                ),
              ],
            ),
          ):
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Name:"),
                          Text("PTA:"),
                          Text("Recovery:"),
                          Text("Software:"),
                          Text("Icloud:"),
                          Text("UnLocking:"),
                          Text("By Pass:"),
                          Text("Status"),
                          Text("Details:"),
                          (notify==true && status!="pending")?Text("Shop Name"):Container(),
                          (notify==true && status!="pending")?Text("Contact"):Container(),
                          (notify==true && status!="pending")?Text("Shop Address"):Container(color: Colors.red,),
                          Container(
                            height: 15,
                            width: 2,
                          ),
                          // Container(
                          //   height: 70,
                          //   width: 2,
                          // )
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(name,style: TextStyle(color: Colors.blue)),
                          Text((pta=="true")?"damage":"fine",style: styles(pta)),
                          Text((recovery=="true")?"damage":"fine",style: styles(recovery)),
                          Text((software=="true")?"damage":"fine",style: styles(software)),
                          Text((icloud=="true")?"damage":"fine",style: styles(icloud)),
                          Text((unlocking=="true")?"damage":"fine",style: styles(unlocking)),
                          Text((bypass=="true")?"damage":"fine",style: styles(bypass)),
                          Text((status=="pending")?"Pending":"Accept",style: styles(status)),
                          Container(
                              height: 40,
                              width: 200,
                              child: Text((detail=="")?"No Details":detail,softWrap:true,style: TextStyle(color: Colors.blue))),

                          (notify==true && status!="pending")?Text(shopName):Container(),
                          (notify==true && status!="pending")?Text(contact):Container(),
                          (notify==true && status!="pending")?
                          Container(
                              height: 40,
                              width: 200,
                              child: Text(shopAddress,softWrap: true,style: TextStyle(color: Colors.blue))):Container(),

                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (notify==true)?
                    RaisedButton(onPressed: (){
                      print(notify);
                    },
                      color: Colors.red,
                      child: Text("Cancel"),

                    ):
                    RaisedButton(onPressed: (){
                      update();
                      print(notify);
                    },
                      color: Colors.green,
                      child: Text("Book"),

                    ),
                 ],
                ),
              ],
            ),
          ),
      ),
    );
  }
  update()async{
    await FirebaseFirestore.instance.collection("repair").doc(area).collection(type).doc(docId).update(
        {
          'status': 'booked',
        });
  }
  TextStyle styles(color){
    return TextStyle(
        color: (color=="true")?Colors.red:Colors.blue,
    );
  }
}
