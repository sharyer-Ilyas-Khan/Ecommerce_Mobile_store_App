import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/mobile/newPhone/detailsInfo.dart';

class UsedPhone extends StatefulWidget {
  final type;
  const UsedPhone({this.type,Key key}) : super(key: key);

  @override
  _UsedPhoneState createState() => _UsedPhoneState(type: type);
}

class _UsedPhoneState extends State<UsedPhone> {
  final type;
  _UsedPhoneState({this.type});
  double height=0;
  double width=0;
  String selectBrand="Select mobile";
  String selectModel="Select model";
  bool selectedBrand=false;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        title: Text("Buy Used Phone"),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  streamOfBrand(),
                  streamOfModel(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              child: Padding(
                padding:  EdgeInsets.all(10.0),
                child:  StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection(type).snapshots(),
                  builder: (_,snap){
                    if(snap.hasError){
                      return Text("");
                    }
                    if(snap.hasData){
                      return  ListView.builder(
                        itemCount: snap.data.docs.length,
                        itemBuilder: (_, i) {
                          DocumentSnapshot snaps = snap.data.docs[i];
                          var title=snaps.get('Brand');
                          var subtitle=snaps.get('Model');
                          var ram=snaps.get('Ram');
                          var rom=snaps.get('Rom');
                          var pta=snaps.get('PTA Approved');
                          var warranty=snaps.get('Warranty');
                          var checkWarranty=snaps.get('Check Warranty');
                          var condition=snaps.get('Condition');
                          var detail=snaps.get('Details');
                          var price=snaps.get('Demand');
                          var image=snaps.get('ImageUrl');
                          return newMobile(title,subtitle,ram,rom,pta,warranty,checkWarranty,condition,image,price,detail);
                        },
                      );
                    }
                    return Text("");
                  },

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget newMobile(name,subtitle,ram,rom,pta,warranty,checkWarranty,condition,image,price,details){
    return Padding(
      padding: EdgeInsets.only(top: 5,),
      child: Container(
        width: width*0.8,
        height: width*0.7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.55),offset: Offset(3,9),blurRadius: 20,spreadRadius: 0.2)
            ],
            color: Colors.white
        ),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: width*0.2,
                // height: width*0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(image),fit: BoxFit.fill
                    )
                ),
              ),
              title: Text(name),
              subtitle: Text(subtitle),
              isThreeLine: true,
            ),
            Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("PTA: $pta"),
                        Text("RAM: $ram"),
                        Text("C-Warranty:$checkWarranty"),
                        Text("Warranty: $warranty",),
                        Container(
                          width: width*0.4,
                            child: Text("Details: $details",softWrap: true,)),

                      ],
                    ),
                    Column(
                      children: [
                        Text("Condition:$condition/10"),
                        Text("ROM: $rom"),
                        Text("Price:$price"),

                      ],
                    ),

                  ],
                ),
                Padding(
                  padding:EdgeInsets.only(right:15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(

                          onPressed: (){

                      }

                    , child: Text('Buy'))
                    ],
                  ),
                )
              ],
            )
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
}
