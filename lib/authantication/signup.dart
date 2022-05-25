
import 'dart:io';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';

import 'spiner.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

class SignUp extends StatefulWidget {
  final Function par;
  SignUp({this.par});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  Future gallery()async{
    Navigator.of(context).pop(true);
    var img= await ImagePicker.pickImage(source: ImageSource.gallery);
    // image=File(img.path);
    setState(() {
      image=File.fromUri(img.uri);
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
String simple="simple";
String seller="seller";
String tech="tech";
String group="simple";
 InputDecoration deco(String text){
    return InputDecoration(
      labelText: '$text',
      labelStyle: TextStyle(fontSize: 12),
      border:OutlineInputBorder(
      borderRadius:BorderRadius.circular(12),
      borderSide:BorderSide(color: Colors.black,
      width: 2) ),


    );
  }
  InputDecoration decopass(String text){
    return InputDecoration(
      suffixIcon:  InkWell(
        onTap:(){
          setState(() {
            obscure=false;
          });
        },
          child:Icon(Icons.remove_red_eye)),
      labelText: '$text',
      labelStyle: TextStyle(fontSize: 12),
      border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(12),
          borderSide:BorderSide(color: Colors.black,
              width: 2) ),


    );
  }

  File img(){
    return image;
  }
  String hint;
  File image;
  String email='';
  String phoneNumber='';
  String uname='';
  String address='';
  String shopName='';
  String pass='';
  String confirmPassword='';
  String error='';
  bool load=false;
  bool obscure=true;
  final AuthanticateUser _auth=AuthanticateUser();
  final _formKey =GlobalKey<FormState>();
  @override


  Widget build(BuildContext context) {
    return load ? Spiner():Scaffold(
        //backgroundColor: Colors.white,
      backgroundColor: Color(0xfffffeea),
        appBar: AppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft:Radius.circular(2),bottomRight:Radius.circular(82),)),
                toolbarHeight: 100,
         title: Column(
           children: [
             Image.asset('images/logo.png',height: 40,),
             Text("SIGN UP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
           ],
         ),
         centerTitle: true,
         backgroundColor:Colors.black
        ),

        body:SingleChildScrollView(
          child: Form(
           autovalidateMode: AutovalidateMode.onUserInteraction,
            key:_formKey ,
            child: Padding(padding: const EdgeInsets.all(10),
              child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(12),
                            shape: BoxShape.circle,
                            color: Colors.grey,
                            image: DecorationImage(
                              image: image!=null?FileImage(image):
                              AssetImage('images/cross.png',),fit: BoxFit.fill
                            )
                          ),
                                // child:image != null ?
                                ),
                      ),
                      InkWell(
                        splashColor:Colors.green,
                        onTap:(){showDialog(context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Choose Image',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)

                              ),
                              actions: <Widget>[
                                FlatButton.icon(onPressed: camera,
                                    icon: Icon(Icons.camera,color: Colors.grey,size: 30,),
                                    label: Text('Camera',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                                FlatButton.icon(onPressed: gallery,
                                    icon: Icon(Icons.image,color: Colors.grey,size: 30),
                                    label: Text('Gallery',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)))

                              ],
                            ));},
                        child: Icon(
                            Icons.add_a_photo,
                            size: 30,
                            color: Colors.grey),
                      ),

                      Text('Add a Photo',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                            fontSize: 12
                        ),),
                      ///Radio buttons
                      Row(
                        children: [
                          Radio<String>(
                              value:simple,
                              groupValue:group,
                              onChanged: (val){
                                setState(() {
                                  print(val);
                                  group=val;
                                });
                              }),
                          Text("Simple"),
                          Radio<String>(
                              value:seller,
                              groupValue:group,
                              onChanged: (val){
                                setState(() {
                                  group=val;
                                });

                              }),
                          Text("Seller"),
                          Radio<String>(
                              value: tech,
                              groupValue:group,
                              onChanged: (val){
                                setState(() {
                                  group=val;
                                });
                              }),
                          Text("Technician")
                        ],
                      ),
                      ///Name
                      Padding(padding: const EdgeInsets.only(bottom: 20)),
                      TextFormField(
                          autovalidateMode:AutovalidateMode.always,
                        keyboardType: TextInputType.name,
                      validator: MultiValidator([
                      RequiredValidator(errorText: "Required"),
                        PatternValidator( ("[a-zA-Z $Spacer)]"),errorText: 'Only Characters')
                              ]),
                          onChanged: (val){
                          setState(() {
                            uname=val;
                          });},
                          style: TextStyle(fontSize: 14),//password field
                          decoration:deco('NAME')),
                      ///Email
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                          autovalidateMode:AutovalidateMode.always,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(errorText: "Invalid Email"),

                          ]),
                          onChanged: (val){
                            setState(() {
                              email=val;});},
                          style: TextStyle(fontSize: 14),//password field
                          decoration:deco('EMAIL')),
                      ///phone
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                          autovalidateMode:AutovalidateMode.always,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            MaxLengthValidator(11, errorText: 'INVALID PHONE NUMBER'),
                            MinLengthValidator(11, errorText: 'INVALID PHONE NUMBER'),
                            PatternValidator( ("[0-9)]"),errorText: 'Only INTEGERS')
                          ]),
                          onChanged: (val){
                            setState(() {
                              phoneNumber=val;
                            });},
                          style: TextStyle(fontSize: 14),//password field
                          decoration:deco('PHONE NUMBER')),
                      ///Area selection
                      Padding(padding: EdgeInsets.all(5)),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(),
                            borderRadius: BorderRadius.circular(12.0)
                          ),
                          child: Center(
                            child: DropdownButtonFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: RequiredValidator(errorText: "Required"),
                              iconSize: 40,
                              isDense: true,
                              isExpanded:true,
                              hint: Text("Select Area",style: TextStyle(fontSize: 20.0),),
                              value: hint,
                              onChanged: (val){
                                setState(() {
                                  hint=val;
                                });
                              },

                              onSaved: (value) {
                                setState(() {
                                  hint = value;
                                });
                              },
                              items: [
                               DropdownMenuItem(child: Text("Select Area"),value:"Select Area",),
                               DropdownMenuItem(child: Text("Bhara Khu"),value: "bharaKhu",),
                               DropdownMenuItem(child: Text("Blue Area"),value: "bluearea"),
                               DropdownMenuItem(child: Text("Rawalpindi"),value: "rawalpindi"),
                               DropdownMenuItem(child: Text("Apara"),value: "apara"),
                              ],



                            ),
                          ),
                        ),
                      ),
                      ///shop name
                      (group =="seller" || group =="tech")?
                      Padding(padding: const EdgeInsets.only(bottom: 20)):Container(),
                      (group =="seller" || group =="tech")?
                      TextFormField(
                          autovalidateMode:AutovalidateMode.always,
                          // keyboardType: TextInputType.name,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            // PatternValidator( ("[a-zA-Z $Spacer)]"),errorText: 'Only Characters')
                          ]),
                          onChanged: (val){
                            setState(() {
                              shopName=val;
                            });},
                          style: TextStyle(fontSize: 14),//password field
                          decoration:deco('SHOP NAME')):Container(),
                      ///Address
                      (group =="seller" || group =="tech")?Padding(padding: const EdgeInsets.only(bottom: 20)):Container(),
                      (group =="seller" || group =="tech")?TextFormField(
                          autovalidateMode:AutovalidateMode.always,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            // PatternValidator( ("[a-zA-Z $Spacer)]"),errorText: 'Only Characters')
                          ]),
                          onChanged: (val){
                            setState(() {
                              address=val;
                            });},
                          style: TextStyle(fontSize: 14),//password field
                          decoration:deco('ADDRESS')):Container(),
                      ///Password
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                          autovalidateMode:AutovalidateMode.always,
                            obscureText: obscure,
                            validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                             MinLengthValidator(6,errorText: 'minimum 6 character required ')
                            ]),
                            onChanged: (val){
                            setState(() {
                            pass=val;
                            print(pass);});},
                            style: TextStyle(fontSize: 14),//user name text input field
                              decoration:
                              decopass('PASSWORD')),
                      ///Confirm Password
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                          autovalidateMode:AutovalidateMode.always,
                          obscureText: true,

                      validator:(val){
                          if(val.isEmpty) {
                            return 'Required';
                          }
                          if(val.length<6){
                            return 'minimum 6 Character Required';
                          }
                          if(val!=pass){
                            return 'Pasword did not match';
                          }
                          return null;
                          },
                      onChanged: (val){
                              setState(() {
                              confirmPassword=val;
                            });},
                          style: TextStyle(fontSize: 14),//password field
                          decoration:deco('CONFIRM PASSWORD')),
                      ///Buttons
                      SizedBox(
                        child: Text(error,style: TextStyle(
                            fontSize: 14,
                            color: Colors.red
                        ),),
                      ),
                      RaisedButton(onPressed: ()async{
                          if(_formKey.currentState.validate()&& image!=null ) {
                            setState(() {
                              load=true;
                            });
                          dynamic result = await _auth.Signup(email, pass,image,uname,phoneNumber,group,address,shopName,hint);
                          if(result!=null){
                            setState(() {
                              load=false;
                              Navigator.of(context).pop(true);

                            });
                          }
                          if (result == null) {
                            setState(() {
                              error = 'somting went wrong';
                            load=false;
                            });
                          }}
                          if(image==null){
                            setState(() {
                              error='Please upload a pohto';
                            });
                          }
                          },

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)
                      ),
                        child: Text(
                          'SIGNUP',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                          color: Colors.black,),

                      RaisedButton(onPressed: (){
                        showDialog(

                            context: context,
                            builder: (context)=> AlertDialog(
                              title: Text("Warning"),
                              content: Text("Are you sure want to Exit"),
                              actions: <Widget>[
                                FlatButton(onPressed: (){
                                  SystemNavigator.pop();
                                },child: Text("Yes"),),
                                FlatButton(onPressed: (){
                                  Navigator.of(context).pop(false);
                                },child: Text("No"),),
                              ],
                            )
                        );
                      },
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                        child: Text(
                          ' EXIT ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
                         ),color:Colors.red)
                    ],
                  ),

      ),


          ),
        ),

    );
  }
}

