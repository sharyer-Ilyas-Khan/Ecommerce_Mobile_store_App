import 'dart:ui';
import 'package:mobile_app/Screens/Dashboard.dart';

import 'RestPass.dart';
import 'spiner.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'auth.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Login extends StatefulWidget {
  final Function par;
  Login({this.par});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void Change(){
    setState(() {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => SignUp()
      ));
    });}

  InputDecoration deco(String text){
    return InputDecoration(
      labelText: '$text',
      border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(12),
          borderSide:BorderSide(color: Colors.black,
              width: 2) ),


    );
  }
  bool obscr=true;
  InputDecoration decopass(String text){
    return InputDecoration(
      suffixIcon:  InkWell(
          onTap:(){
            setState(() {
              obscr=false;
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
  bool load=false;
  String email='';
  String pass='';
  String erorr='';
  final AuthanticateUser _auth=AuthanticateUser();
  final _formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return load ? Spiner(): Scaffold(
        backgroundColor: Color(0xfffffeea),
            appBar: AppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft:Radius.circular(2),bottomRight:Radius.circular(82),)),
                toolbarHeight: 100,
                title: Column(
                  children: [
                    Image.asset('images/logo.png',height: 40,),
                    Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                  ],
                ),
                centerTitle: true,
                backgroundColor:Colors.black
            ),
       //signup
        body: Padding(padding: const EdgeInsets.only(left: 12,right: 12,top: 12),
          child:Form(
            key: _formkey,
              autovalidateMode:AutovalidateMode.always,
              child:SingleChildScrollView(
              child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Image.asset('images/logo.png',width: 300,height: 200,),
             Container(
                 padding:EdgeInsets.all(2),
                 decoration:BoxDecoration(
                     borderRadius: BorderRadius.circular(64.0),
                     border: Border.all(
                       color: Colors.black,
                       style: BorderStyle.solid,
                       width: 2.0,
                     )),
               child: Icon(
                  Icons.person_rounded,
                  color:Colors.grey,
                  size: 70,
               ) ,
              ),

              Padding(padding: EdgeInsets.only(top: 20)),
                 TextFormField(
                        validator: MultiValidator([
                    RequiredValidator(errorText: "Required"),
                    EmailValidator(errorText: "Invalid Email"),
                        ]),
                        onChanged: (val){
                          setState(() {
                            email=val;});},
                  style: TextStyle(fontSize: 12),//password field
                  decoration:deco('Email')),
              Padding(padding:EdgeInsets.only(bottom: 5)),
                  TextFormField(
                  obscureText: obscr,
                      validator: MultiValidator([
                    RequiredValidator(errorText: "Required"),
                    MinLengthValidator(6,errorText: 'minimum 6 character required ')
                  ]),
                onChanged: (val){
                setState(() {
                pass=val;});},
                      style: TextStyle(fontSize: 12),//password field
                  decoration:decopass('PASSWORD'))
                ,
                TextButton(onPressed: (){
                  setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>ResetScreen()));
                  });
                },
                    child: Text("Reset Password?")),
                TextButton(onPressed: (){
                  setState(Change);
                },
                    child: Text("Create Account")),

                SizedBox(
                  child: Text(erorr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),

                  ),
                ),
                ElevatedButton(
                  style:ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.black)
                  ),onPressed:()async {
                if(_formkey.currentState.validate()){
                  setState(() {
                    load=true;
                  });
                  dynamic result = await _auth.Signin(email, pass);
                  if(result!=null){
                    setState(() {
                      load=false;
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Dashboard()));

                    });
                  }
                  if (result == null) {
                  setState(() {
                    erorr = 'somting went wrong';
                    load=false;
                  });
              }}},


                child: Text('LOGIN',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

              ),

                ElevatedButton(
                    style:ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Colors.red)
                    ),
                  onPressed: (){

               showDialog(

                  context: context,
                  builder: (context)=> AlertDialog(
                    title: Text("Warning"),
                    content: Text("Are you sure want to Exit"),
                    actions: <Widget>[
                     TextButton(onPressed: (){
                       SystemNavigator.pop();
                     },child: Text("Yes"),),
                      TextButton(onPressed: (){
                        Navigator.of(context).pop(false);
                      },child: Text("No"),),
                    ],
                  )
                  );

                },
                child: Text('EXIT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
           ),

            ],
          ),
        )
        ),)
    );
  }
}

