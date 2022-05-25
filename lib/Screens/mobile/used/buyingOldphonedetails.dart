import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuyingUsedPhoneDetails extends StatefulWidget {
  final brand;
  const BuyingUsedPhoneDetails({Key key,this.brand}) : super(key: key);

  @override
  _BuyingUsedPhoneDetailsState createState() => _BuyingUsedPhoneDetailsState(brand: brand);
}

class _BuyingUsedPhoneDetailsState extends State<BuyingUsedPhoneDetails> {
  final brand;
  _BuyingUsedPhoneDetailsState({this.brand});
  double height=0;
  double width=0;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("$brand".toUpperCase(),style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Check List"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Follow these check list and Codes"),
            ),  Padding(
              padding:EdgeInsets.only(left:10.0),
              child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(right:8.0,left: 15,top: 8,bottom: 8),
                child: Container(
                    width: width*0.065,
                    height: height*0.035,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(3),
              ),
          ),
        ),
        Text("Codes:"),
      ],
    ),
            ),

            StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection(brand).snapshots(),
             builder: (_,snap){
            if(snap.hasError){
              return Text("");
            }
           if(snap.hasData){
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  height: height*0.4,
                  child: ListView.builder(
                    itemCount: snap.data.docs.length,
                    itemBuilder: (_, i) {
                      DocumentSnapshot snaps = snap.data.docs[i];
                      var title=snaps.get('code');
                      var description=snaps.get('purpose');
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(

                          leading: Icon(Icons.qr_code_outlined,color: Colors.red,),

                          title: Text(title,style: TextStyle(color: Colors.white),),
                          subtitle: Text(description,style: TextStyle(color: Colors.white),),
                          tileColor: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
              );
            }
           return Text("");
             },

    ),

           checkList("Body Check:", "check body condition closely from all sides, check if the phone from away to check if the phone is bend.check if the phone is repaired or opened or not. "
               "open Sim Tray, give air pressure with mouth if  it is opened air will flow, if not repaired, pressure will retain."),
           checkList("Check Cameras:", "check Both Cameras and flash. check camera on "
               "different color angles, Zoom in out check, Focus check, "
               "check camera physically if there is any dust in it or not."),
           checkList("check speakers and Mic:", "Voice quality if speaker is busting the sound. check mic by putting sim and calling or recording"),
           checkList("Charging Speed and Heat up:", "check Charging speed and keep an eye if the phone is getting heat up. Note discharging speed as well."),
           checkList("Memory card:", "Put a memory card in Phone to check if it works or not."),
           checkList("Security:", "Reset the Phone and check fingerprint,face id and retina scans if available."),
          ],
        ),
      )
    );
  }

  Widget checkList(title,description){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(right:8.0,left: 15,top: 8,bottom: 8),
                child: Container(
                  width: width*0.065,
                  height: height*0.035,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              Text(title),
            ],
          ),
          Container(
            width: width*0.9,
            height: height*0.25,
            child: Padding(
              padding:  EdgeInsets.all(10.0),
              child: Text(description,style: TextStyle(color: Colors.white),),
            ),
            decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),

            ),
          )
        ],
      ),
    );
  }
}
