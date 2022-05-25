import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/VoiceSearch.dart';
class SellPart extends StatefulWidget {
  const SellPart({Key key}) : super(key: key);

  @override
  _SellPartState createState() => _SellPartState();
}

class _SellPartState extends State<SellPart> {
  double height=0;
  double width=0;
  String name;
  String shopAddress;
  String shopName;
  String title;
  String demand;
  String quantity;
  File image;
  String selectBrand="Select mobile";
  String selectModel="Select model";
  String text = 'Tap on button and speak something.';
  bool isListening = false;
  bool voice=false;
  var voiceText;
  var error="";
  final _formKey = GlobalKey<FormState>();
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
      appBar: AppBar(
        title: Text("Spare Parts"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xfffffeea),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode:AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Center(
                child: InkWell(
                  onTap: (){
                    showDialog(context: context,
                        builder: (context) => AlertDialog(

                            title: Text('Choose Image',style: deco(Colors.black, 12)),
                            actions: <Widget>
                            [
                              FlatButton.icon(onPressed: camera,
                                  icon: Icon(Icons.camera,color: Colors.amber,size: 30,),
                                  label: Text('Camera',style: deco(Colors.black, 12))),
                              FlatButton.icon(onPressed: gallery,
                                  icon: Icon(Icons.image,color: Colors.amber,size: 30),
                                  label: Text('Gallery',style: deco(Colors.black, 12)))])

                    );
                  },
                  child: Container(
                    width: width * 0.6,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      // color:Colors.red,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black)
                    ),
                    child:(image!=null)?
                    Padding(
                      padding:  EdgeInsets.only(top:10.0,bottom:10,left: 20,right: 20),
                      child: Image.file(image,fit:BoxFit.fill,),
                    ): Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo),
                          Text("Add Images")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name:",style: styleText(Colors.black, width*0.035,""),),
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
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left:8.0),
                                      child: TextFormField(
                                        onChanged: (val){
                                          setState(() {
                                            name=val;
                                          });
                                        },
                                        // validator: MultiValidator([
                                        //   RequiredValidator(errorText: "Required"),
                                        // ]),
                                        style: styleText(Colors.black, width*0.045,""),
                                        decoration: InputDecoration(

                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shop Name:",style: styleText(Colors.black, width*0.035,""),),
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
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left:8.0),
                                      child: TextFormField(
                                        onChanged: (val){
                                          setState(() {
                                            shopName=val;
                                          });
                                        },
                                        // validator: MultiValidator([
                                        //   RequiredValidator(errorText: "Required"),
                                        // ]),
                                        style: styleText(Colors.black, width*0.045,""),
                                        decoration: InputDecoration(

                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ),

                          ],
                        ),
                        SizedBox(
                          height: width*0.2,
                        )


                      ],

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        streamOfModel(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Demand Price:",style: styleText(Colors.black, width*0.035,""),),
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
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left:8.0),
                                      child: TextFormField(
                                        onChanged: (val){
                                          setState(() {
                                            demand=val;
                                          });
                                        },
                                        // validator: MultiValidator([
                                        //   RequiredValidator(errorText: "Required"),
                                        // ]),
                                        style: styleText(Colors.black, width*0.045,""),
                                        decoration: InputDecoration(

                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ),

                          ],
                        ),
                        // SizedBox(
                        //   width: width*0.3,
                        // ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shop Address:",style: styleText(Colors.black, width*0.035,""),),
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
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left:8.0),
                                      child: TextFormField(
                                        onChanged: (val){
                                          setState(() {
                                            shopAddress=val;
                                          });
                                        },
                                        // validator: MultiValidator([
                                        //   RequiredValidator(errorText: "Required"),
                                        // ]),
                                        style: styleText(Colors.black, width*0.045,""),
                                        decoration: InputDecoration(

                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ),

                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Quantity:",style: styleText(Colors.black, width*0.035,""),),
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
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(left:8.0),
                                      child: TextFormField(
                                        onChanged: (val){
                                          setState(() {
                                            shopAddress=val;
                                          });
                                        },
                                        // validator: MultiValidator([
                                        //   RequiredValidator(errorText: "Required"),
                                        // ]),
                                        style: styleText(Colors.black, width*0.045,""),
                                        decoration: InputDecoration(

                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            ),

                          ],
                        ),

                      ],

                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
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
              Center(
                child: Text(error,style: TextStyle(color: Colors.red),),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: (){
                    if(image!=null && demand!=null && selectBrand!="Select mobile" && name!= "" && title!= "") {
                      usedMobileData(
                          selectBrand,
                          selectModel,
                          shopName,
                          shopAddress,
                          demand,
                          voiceText,quantity);
                    }
                    if(image==null || demand==null || selectBrand=="Select mobile" || name == "" || title== ""){
                      setState(() {
                        error="Please Complete The Form";
                      });

                    }

                  },


                  child: Text("Sell",style: styleText(Colors.white, width*0.05,"Cursive"),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  dynamic val;
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
  Widget dropDown(text,child){
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$text:",style: styleText(Colors.black, width*0.035,"Times new roman"),),
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
  TextStyle styleText(color,size,family){
    return TextStyle(
        color: color,
        fontSize: size,
        fontFamily:"fred",
        fontWeight: FontWeight.bold
    );
  }
  usedMobileData(brand,model,shop,shopaddress,demandPrice,details,quantity)async{
    var pimage= FirebaseStorage.instance.ref("image").child("uploads");
    var task=await pimage.putFile(image);
    var imgurl=await task.ref.getDownloadURL();
    print(imgurl);

    await FirebaseFirestore.instance.collection("parts").doc().set(
        {
          'mobil':brand,
          'model': model,
          'shop Address': shop,
          'shop Name': shopaddress,
          'price':demandPrice,
          'Details':details,
          'quantity':quantity,
          'image':imgurl,
        }
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
  Future gallery()async{
    Navigator.of(context).pop(true);
    // ignore: invalid_use_of_visible_for_testing_member
    var img= await ImagePicker.pickImage(source: ImageSource.gallery);
    image=File(img.path);
    setState(() {
      image=File.fromUri(img.uri);
    });
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
  Future camera()async{
    Navigator.of(context).pop(true);
    // ignore: invalid_use_of_visible_for_testing_member
    var img= await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      image=File.fromUri(img.uri);
    });
  }
  File img(){
    return image;
  }
}
