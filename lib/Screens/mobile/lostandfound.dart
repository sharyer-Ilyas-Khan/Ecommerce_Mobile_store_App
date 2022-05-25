import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
class LostComplaint extends StatefulWidget {
  const LostComplaint({Key key}) : super(key: key);

  @override
  _LostComplaintState createState() => _LostComplaintState();
}

class _LostComplaintState extends State<LostComplaint> {
  double height=0;
  double width=0;
  bool selectedBrand=false;
  var imei;
  var mobileName;
  var mobileModel;
  var condition;
  var color;
  var lostArea;
  var contact;
  final formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lost Complaint"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xfffffeea),
body:Padding(padding: const EdgeInsets.only(left: 2,right: 2,top: 2,),
  child: Form(
      autovalidateMode:AutovalidateMode.always,

      key: formKey,
        child:SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.event_note_outlined,
                  size: width*0.2,
                  color: Colors.blue,
                ),
              ),
              // Center(
              //   child: Text(
              //     "Please enter all the details\n"
              //         "Required field *"
              //   )
              // ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextFormField(

                  decoration: deco('Enter IMEI *'),
                  validator: RequiredValidator(
                      errorText: "Required"
                  ),
                    onChanged: (val){
                      setState(() {
                        imei=val;
                      });
                  },
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(padding:EdgeInsets.only(bottom: 5)),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: deco('Mobile Name *'),
                  validator: RequiredValidator(
                      errorText: "Required"
                  ),
                  onChanged: (val){
                    setState(() {
                      mobileName=val;
                    });
                  },
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(padding:EdgeInsets.only(bottom: 5)),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: deco('Mobile Model *'),
                  validator: RequiredValidator(
                      errorText: "Required"
                  ),
                  onChanged: (val){
                    setState(() {
                      mobileModel=val;
                    });
                  },
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(padding:EdgeInsets.only(bottom: 5)),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: deco('Condition 10/? '),
                  // validator: RequiredValidator(
                  //     errorText: "Required"
                  // ),
                  onChanged: (val){
                    setState(() {
                      condition=val;
                    });
                  },
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(padding:EdgeInsets.only(bottom: 5)),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: deco('Color *'),
                  validator: RequiredValidator(
                      errorText: "Required"
                  ),
                  onChanged: (val){
                    setState(() {
                      color=val;
                    });
                  },
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(padding:EdgeInsets.only(bottom: 5)),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: deco('Area Where Lost *'),
                  validator: RequiredValidator(
                      errorText: "Required"
                  ),
                  onChanged: (val){
                    setState(() {
                      lostArea=val;
                    });
                  },
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(padding:EdgeInsets.only(bottom: 5)),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: deco('Contact Number *'),
                  validator: RequiredValidator(
                      errorText: "Required"
                  ),
                  onChanged: (val){
                    setState(() {
                      contact=val;
                    });
                  },
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(padding:EdgeInsets.only(bottom: 5)),
              Center(
                child: ElevatedButton(
                  onPressed: uploadData,
                  child: Text("Add Complaint"),
                ),
              )
            ],
          ),
        ) )
),
    );
  }
  InputDecoration deco(String text){
    return InputDecoration(

      labelText: '$text',
      border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(12),
          borderSide:BorderSide(
              width: 2) ),


    );
  }
  Future uploadData()async {
    return await FirebaseFirestore.instance.collection("lostandfound").doc(imei).set(
        {
          'IMEI': imei,
          'color': color,
          'name': mobileName,
          'model': mobileModel,
          'condition': condition,
          'area': lostArea,
          'contact': contact,
            'status':'lost'
        }
    );
  }
}
