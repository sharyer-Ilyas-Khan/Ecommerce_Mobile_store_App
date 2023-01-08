import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class Verification extends StatefulWidget {
  final verifier;
  final address;
  const Verification({Key key,this.address,this.verifier}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState(verifier: verifier,address: address);
}

class _VerificationState extends State<Verification> {
  final verifier;
  final address;
  _VerificationState({this.verifier,this.address});
  double height=0;
  double width=0;
  ScreenshotController screenshotController = ScreenshotController();
  String selectBrand='Select Brand';
  String selectModel='Select Model';
  String bookType='Select booking';
  String buyingPrice='0.0';
  double fee=0.0;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffffeea),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Verification'),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text("Mobile Details"),
        ),
          Expanded(
            child: Container(
             // width:width*0.9,
            child: Row(
              children: [
                ///streams
                Expanded(
                  child: Column(
                    children: [
                      streamOfBrand()
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                     streamOfModel(),
                    ],
                  ),
                ),
              ],
            ),
            ),
          ),
          Expanded(
            child: Container(
              // width: width*0.9,
              child: Row(
                children: [
                  ///streams
                  Padding(
                    padding:  EdgeInsets.only(left:14.0),
                    child: Container(
                      width: width*0.5,
                        height: width*0.15,
                        child: TextFormField(
                          onChanged: (val){
                            setState(() {
                              buyingPrice=val;
                            });
                          },
                          decoration: inputDeco('Buying Price')
                        )),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Book Type'),
                        DropdownButton(
                          onChanged: (val){
                            setState(() {
                              bookType=val;
                            });
                          },
                            hint: Text(bookType, style:deco(Colors.black,width*0.04)),
                            items:[
                              DropdownMenuItem(
                                child: Text('physical',style:deco(Colors.black,width*0.04)),value: 'physical',),
                              DropdownMenuItem(
                                child: Text('online', style:deco(Colors.black,width*0.04)),value: 'online',),

                        ])
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  setState(() {
                    if(double.parse(buyingPrice) <=10000 )
                    fee=(double.parse(buyingPrice)*4.0)/100+50;
                    if(double.parse(buyingPrice) >10000 &&double.parse(buyingPrice) <=20000 )
                      fee=(double.parse(buyingPrice)*3.0)/100 +50;
                    if(double.parse(buyingPrice) >20000 && double.parse(buyingPrice) <=40000 )
                      fee=(double.parse(buyingPrice)*2)/100 +50;
                    if(double.parse(buyingPrice) >40000)
                      fee=(double.parse(buyingPrice)*1.5)/100 +50;
                  });
                },
                child: Container(
                  // width: width*0.6,
                  // height: width*0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),

                  child: Center(child: Text("Generate Price")),
                ),
              ),
            ),
          ),
          Expanded(
             flex: 4,
          child: Center(child: Text(fee.toString(),style: TextStyle(fontSize: 50),))),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (ctx) => Screenshot(
                      controller:screenshotController ,
                      child: AlertDialog(
                          backgroundColor: Colors.black,
                          content: Container(
                            height: height*0.6,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.white)
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: height*0.05,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Details",style:DataStyles(Colors.white,18))
                                    ],),
                                  SizedBox(height: height*0.05,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Verifier:",style:DataStyles(Colors.white,14)),
                                          Text("Mobile:",style:DataStyles(Colors.white,14)),
                                          Text("Model:",style:DataStyles(Colors.white,14)),
                                          Text("Price:",style:DataStyles(Colors.white,14)),
                                          Text("B.Type:",style:DataStyles(Colors.white,14)),
                                          Text("Fee:",style:DataStyles(Colors.white,14)),
                                        ],
                                      ),
                                      SizedBox(
                                        width: width*0.05,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(verifier,style:DataStyles(Colors.blue,14),),
                                          Text(selectBrand,style:DataStyles(Colors.blue,14),),
                                          Text(selectModel,style:DataStyles(Colors.blue,14)),
                                          Text(buyingPrice,style:DataStyles(Colors.blue,14)),
                                          Text(bookType,style:DataStyles(Colors.blue,14)),
                                          Text(fee.toString(),style:DataStyles(Colors.blue,14)),
                                         ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Address:",style:DataStyles(Colors.white,14)),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                              width: width*0.4,
                                              child: Text(address,softWrap:true,style:DataStyles(Colors.blue,14))),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: height*0.05,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                        style:ButtonStyle(
                                            backgroundColor:MaterialStateProperty.all(Colors.amber)
                                        ),
                                        onPressed: (){
                                        screenshotController
                                            .capture(
                                            delay: Duration(milliseconds: 10),
                                            pixelRatio: MediaQuery.of(context).devicePixelRatio)
                                            .then((capturedImage) async {
                                          if (capturedImage != null) {
                                            print(capturedImage);
                                                final directory = await getApplicationDocumentsDirectory();
                                            final imagePath = await File('${directory.path}/${DateTime.now().toString()}image.png').writeAsBytes(capturedImage);
                                           GallerySaver.saveImage(imagePath.path);
                                            /// Share Plugin
                                            // await Share.shareFiles([imagePath.path]);
                                          }
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text("Screenshot Saved"),
                                          ));

                                        }).catchError((onError) {
                                          print(onError);

                                        });
                                        // update(documentSnapshot.get('IMEI').toString().toLowerCase());
                                        // Navigator.pop(ctx);
                                      },

                                       child: Row(
                                      children: [
                                      Icon(Icons.download_outlined),
                                      Text("Save to Gallery"),
                                    ],
                                  ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                      ),
                    ),
                  );

                },
                child: Container(
                    // width: width*0.6,
                    // height: width*0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Center(
                        child: Text('Book'))),
              ),
            ),
          )

        ],
      ),
    );
  }
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
  TextStyle DataStyles(color,double size){
    return TextStyle(
      fontSize: size,
      color: color,



    );
  }
  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Ricept"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: capturedImage != null
                      ? Image.memory(capturedImage)
                      : Container()),
              Center(
                child: ElevatedButton(
                  onPressed: ()async{
                    if (capturedImage != null) {
                      final directory = await getApplicationDocumentsDirectory();
                      final imagePath = await File('${directory.path}/image.png').create();
                      await imagePath.writeAsBytes(capturedImage);
                      print(imagePath.path);
                      print('done');

                      /// Share Plugin
                      // await Share.shareFiles([imagePath.path]);
                    }
                    print('not');
                  },
                  child: Row(
                    children: [
                       Icon(Icons.download_outlined),
                      Text("Save to Gallery"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
saved(image) async {
  final directory = await getApplicationDocumentsDirectory();
  final imagePath = await File('${directory.path}/image.png').create();
  await imagePath.writeAsBytes(image);
  }
}
