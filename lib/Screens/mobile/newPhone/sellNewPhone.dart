import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

import '../../../VoiceSearch.dart';

class SellNewPhone extends StatefulWidget {
  const SellNewPhone({Key key}) : super(key: key);

  @override
  _SellNewPhoneState createState() => _SellNewPhoneState();
}

class _SellNewPhoneState extends State<SellNewPhone> {
  double height=0;
  double width=0;
  String ram="Select Ram";
  String rom="Select Rom";
  String checkWarranty="No";
  String warranty="No";
  String pta="Non";
  String repaired="No";
  String demand;
  File image;
  String selectBrand="Select mobile";
  String selectModel="Select model";
  String selectColor="ex: black";
  String selectCondition="ex: 7";
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
      backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        title: Text("New Phone"),
        centerTitle: true,
      ),
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
                        SizedBox(
                          width: width*0.3,
                        ),
                        dropDown("RAM",DropdownButton(
                          underline: Container(),
                          iconSize: height*0.05,
                          onChanged: (val){
                            setState(() {
                              ram=val;
                            });
                          },
                          hint:new Text(ram),
                          focusColor: Colors.grey,
                          items:  [
                            DropdownMenuItem(child: Text("1GB"),value: "1GB",),
                            DropdownMenuItem(child: Text("2GB"),value: "2GB",),
                            DropdownMenuItem(child: Text("3GB"),value: "3GB",),
                            DropdownMenuItem(child: Text("4GB"),value: "4GB",),
                            DropdownMenuItem(child: Text("6GB"),value: "6GB",),
                            DropdownMenuItem(child: Text("8GB"),value: "8GB",),
                            DropdownMenuItem(child: Text("12GB"),value: "12GB",),
                          ],
                          style: styleText(Colors.black, width*0.03,"Times"),
                        )),
                        SizedBox(
                          width: width*0.3,
                        ),
                        dropDown("Warranty",DropdownButton(
                          underline: Container(),
                          iconSize: height*0.05,
                          onChanged: (val){
                            setState(() {
                              warranty=val;
                            });
                          },
                          hint:new Text(warranty),
                          focusColor: Colors.grey,
                          items:  [
                            DropdownMenuItem(child: Text("1-3 Month"),value: "1-3 Month",),
                            DropdownMenuItem(child: Text("4-6 Month"),value: "4-6 Month",),
                            DropdownMenuItem(child: Text("7-9 Month"),value: "7-9 Month",),
                            DropdownMenuItem(child: Text("10-12 Month"),value:"10-12 Month",),
                          ],
                          style: styleText(Colors.black, width*0.03,"Times"),
                        )),
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
                          style: styleText(Colors.black, width*0.03,"Times"),
                        )),
                        SizedBox(
                          width: width*0.3,
                        ),
                        dropDown("PTA Approved", DropdownButton(
                          underline: Container(),
                          iconSize: height*0.05,
                          onChanged: (val){
                            setState(() {
                              pta=val;
                            });
                          },
                          hint:new Text(pta),
                          focusColor: Colors.grey,
                          items: [
                            DropdownMenuItem(child: Text("Yes"),value:"Yes"),
                            DropdownMenuItem(child: Text("NO"),value:"No"),
                          ],
                          style: styleText(Colors.black, width*0.03,"Times"),
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
                        dropDown("Storage", DropdownButton(
                          underline: Container(),
                          iconSize: height*0.05,
                          onChanged: (val){
                            setState(() {
                              rom=val;
                            });
                          },
                          hint:new Text(rom),
                          focusColor: Colors.grey,
                          items: [
                            DropdownMenuItem(child: Text("8GB"),value: "8GB",),
                            DropdownMenuItem(child: Text("16GB"),value: "16GB",),
                            DropdownMenuItem(child: Text("32GB"),value: "32GB",),
                            DropdownMenuItem(child: Text("64GB"),value: "64GB",),
                            DropdownMenuItem(child: Text("128GB"),value: "128GB",),
                            DropdownMenuItem(child: Text("256GB"),value: "256GB",),
                          ],
                          style: styleText(Colors.black, width*0.03,"Times"),
                        )),
                        SizedBox(
                          width: width*0.3,
                        ),

                        dropDown("Check Warranty", DropdownButton(
                          underline: Container(),
                          iconSize: height*0.05,
                          onChanged: (val){
                            setState(() {
                              checkWarranty=val;
                            });
                          },
                          hint:new Text(checkWarranty),
                          focusColor: Colors.grey,
                          items:[
                            DropdownMenuItem(child: Text("1 day"),value: "1 day",),
                            DropdownMenuItem(child: Text("2 days"),value: "2 day",),
                            DropdownMenuItem(child: Text("3 days"),value: "3 day",),
                          ],
                          style: styleText(Colors.black, width*0.03,"Times"),
                        ) ),
                        SizedBox(
                          width: width*0.3,
                        ),

                        dropDown("Repaired", DropdownButton(
                          underline: Container(),
                          iconSize: height*0.05,
                          onChanged: (val){
                            setState(() {
                              repaired=val;
                            });
                          },
                          hint:new Text(repaired),
                          focusColor: Colors.grey,
                          items: [
                            DropdownMenuItem(child: Text("Yes"),value: "Yes"),
                            DropdownMenuItem(child: Text("NO"),value: "No",),
                          ],
                          style: styleText(Colors.black, width*0.03,"Times"),
                        ) ),
                        SizedBox(
                          width: width*0.3,
                        ),
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
                        )

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
                    if(image!=null && demand!=null && selectBrand!="Select mobile" && ram!= "Select Ram" && rom!= "Select Rom") {
                      usedMobileData(
                          selectBrand,
                          selectModel,
                          ram,
                          rom,
                          warranty,
                          checkWarranty,
                          selectCondition,
                          repaired,
                          pta,
                          demand,
                          voiceText);
                    }
                    if(image==null || demand==null || selectBrand=="Select mobile" || ram== "Select Ram" || rom== "Select Rom"){
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
  usedMobileData(brand,model,ram,rom,warranty,checkWarranty,condition,repaired,ptaApproved,demandPrice,details)async{
    var pimage= FirebaseStorage.instance.ref("image").child("uploads");
    var task=await pimage.putFile(image);
    var imgurl=await task.ref.getDownloadURL();
    print(imgurl);

    await FirebaseFirestore.instance.collection("newmobiles").doc().set(
        {
          'Brand':brand,
          'Model': model,
          'Ram': ram,
          'Rom': rom,
          'Warranty': warranty,
          'Check Warranty': checkWarranty,
          'Condition': condition,
          'Repaired':repaired,
          'PTA Approved': ptaApproved,
          'Demand':demandPrice,
          'Details':details,
          'ImageUrl':imgurl,
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
