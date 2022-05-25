import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:mobile_app/Screens/mobile/dead/avalibleDeadParts.dart';
import 'package:mobile_app/Screens/mobile/newPhone/detailsInfo.dart';

class BuyDeadPhones extends StatefulWidget {
  const BuyDeadPhones({Key key}) : super(key: key);

  @override
  _BuyDeadPhonesState createState() => _BuyDeadPhonesState();
}

class _BuyDeadPhonesState extends State<BuyDeadPhones> {
  double height=0;
  double width=0;
  bool selectedBrand=false;
  bool buy=false;
  var title="";
  var mobile="";
  var model="";
  var shopName="";
  var address="";
  var price="";
  var condition="";
  var color="";
  var details="";
  var frontCamera="";
  var backCamera="";
  var cameraGlass="";
  var battery="";
  var fingerPrint="";
  var chargingJack="";
  var volumeKey="";
  var powerKey="";
  var simTray="";
  var speaker="";
  var screen="";
  var earphone="";
  var mic="";
  var casing="";
  var board="";
  var headPhoneJack="";
  var flashLight="";
  var otherStrips="";
  var image="";
  double total=0.0;
  int increment=0;
  var dataList=[]??['loading failed'];
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffffeea),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Dead Phones"),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:  EdgeInsets.all(2.0),
              child: Container(
                child: GFSearchBar(
                    searchList:dataList,
                    searchQueryBuilder: (query, list) => list
                        .where((item) {
                      return item.toString().toLowerCase().contains(query.toLowerCase());
                    })
                        .toList(),
                    overlaySearchListItemBuilder: (dynamic item) => Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    onItemSelected: (dynamic item) {
                      setState(() {
                        print('$item');
                      });
                    }),
              ),
            ),

          ),
          Expanded(
            flex: 9,
            child: Stack(
                children:[
                  Container(
                    child: Padding(
                      padding:  EdgeInsets.all(10.0),
                      child:  StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("deadphones").snapshots(),
                        builder: (_,snap){
                          dataList=[];
                          if(snap.hasError){
                            return Text("");
                          }
                          if(snap.hasData){
                            return  ListView.builder(
                              itemCount: snap.data.docs.length,
                              itemBuilder: (_, i) {
                                DocumentSnapshot snaps = snap.data.docs[i];
                                mobile=snaps.get("mobile");
                                model=snaps.get("model");
                                condition=snaps.get("condition");
                                color=snaps.get("color");
                                price=snaps.get("price");
                                details=snaps.get("details");
                                frontCamera=snaps.get("frontCamera");
                                backCamera=snaps.get("backCamera");
                                cameraGlass=snaps.get("cameraGlass");
                                battery=snaps.get("battery");
                                fingerPrint=snaps.get("fingerPrint");
                                chargingJack=snaps.get("chargingJack");
                                volumeKey=snaps.get("volumeKey");
                                powerKey=snaps.get("powerKey");
                                simTray=snaps.get("simTray");
                                speaker=snaps.get("speaker");
                                screen=snaps.get("screen");
                                earphone=snaps.get("earphone");
                                mic=snaps.get("mic");
                                casing=snaps.get("casing");
                                board=snaps.get("board");
                                headPhoneJack=snaps.get("headPhoneJack");
                                flashLight=snaps.get("flashLight");
                                otherStrips=snaps.get("otherStrips");
                                dataList.add("$mobile $model");
                                return newPart(mobile,model,condition,color,price,details,
                                    frontCamera,backCamera,cameraGlass,battery,fingerPrint,chargingJack,volumeKey,powerKey,simTray,
                                  speaker,screen,earphone,mic,casing,board,headPhoneJack,flashLight,otherStrips,);
                              },
                            );
                          }
                          return Text("");
                        },

                      ),
                    ),

                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
  Widget newPart(mobile,model,condition,color,price,details,
      frontCamera,backCamera,cameraGlass,battery,fingerPrint,chargingJack,volumeKey,powerKey,simTray,
      speaker,screen,earphone,mic,casing,board,headPhoneJack,flashLight,otherStrips,){
    return Padding(
      padding: EdgeInsets.only(top: 15,left: 10,right: 10),
      child: Container(
        width: width*0.8,
        // height: width*0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.55),
                  offset: Offset(3,9),blurRadius: 6,spreadRadius: 0.1)
            ],
            color: Colors.white
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: width*0.16,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/dead phone.png"),fit: BoxFit.fill,
                    )
                ),
              ),
              title: Text("$mobile $model"),
              subtitle: Text("Price:${price??"0.00"}"),
              isThreeLine: true,
            ),
            Padding(
              padding:EdgeInsets.only(right:15.0,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  RaisedButton(
                      onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>
                        AvailableDeadParts(
                            mobile: mobile,model: model,price: price,condition: condition,color: color,details: details,
                            frontCamera: frontCamera,backCamera: battery,cameraGlass: cameraGlass,battery: battery,fingerPrint: fingerPrint,
                            chargingJack: chargingJack,volumeKey: volumeKey,powerKey: powerKey,simTray: simTray,speaker: speaker,
                            screen: screen,earphone: earphone,mic: mic,casing: casing,board: board,headPhoneJack: headPhoneJack,flashLight: flashLight,
                            otherStrips: otherStrips
                        )));
                  },
                      color: Colors.green,
                      child: Text('More Details',style: styleText(Colors.white,13.0),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle styleText(color,font,){
    return TextStyle(
        color: color,
        fontSize: font,
        fontWeight: FontWeight.normal
    );
  }
}

