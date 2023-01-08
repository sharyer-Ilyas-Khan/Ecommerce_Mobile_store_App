
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class DeliveryService extends StatefulWidget {
  const DeliveryService({Key key}) : super(key: key);

  @override
  _DeliveryServiceState createState() => _DeliveryServiceState();
}

class _DeliveryServiceState extends State<DeliveryService> {
  
  String location='';
  double height=0.0;
  double width=0.0;
  String hint;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xfffffeea),
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(text: "Send",),
              Tab(text: "Receive"),
            ],
          ),
          centerTitle: true,
          title: Text('Delivery'),
        ),
        body: TabBarView(
          children: [
            ///send
            Padding(
              padding: EdgeInsets.all(13.0),
              child: ListView(
                children: [
                  Text("Add Drop-off location"),
                  SizedBox(height: width*0.05),
                  TextFormField(

                    onChanged: (value){
                      setState(() {
                        location=value;
                      });
                    },
                    decoration: deco("location"),
                  ),
                  SizedBox(height: width*0.1),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
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
                  ),
                ],
              ),
            ),
            ///receive
            Padding(
              padding: EdgeInsets.all(13.0),
              child: ListView(
                children: [
                  Container(
                    width:width,
                    height: width*0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1,color: Colors.black38),
                      boxShadow: [
                        BoxShadow(color: Colors.black38,offset: Offset(0,2),blurRadius: 1,spreadRadius: 2)
                      ],
                      borderRadius: BorderRadius.circular(12),

                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text("Information",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w900,fontSize: width*0.05),)),
                            SizedBox(height: width*0.04,),
                            Text("We Really do care about you and your time. "
                                "So we are providing best delivery service for our customers. Please Add"
                                " a location where you want us to deliver your item."),
                            SizedBox(height: width*0.05,),
                            Text("From our"),
                            SizedBox(height: width*0.03,),
                            Row(
                              children: [
                                Icon(Icons.home_work,color: Colors.amber,),
                                Text(".......Wearhouse"),
                              ],
                            ),
                            SizedBox(height: width*0.03,),
                            Text("To"),
                            SizedBox(height: width*0.03,),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,color: Colors.blue,),
                                Text(".......you"),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: width*0.1),
                  Text("Add Drop-off location"),
                  SizedBox(height: width*0.05),
                  TextFormField(

                    onChanged: (value){
                      setState(() {
                        location=value;
                      });
                    },
                    decoration: deco("location"),
                  ),
                  SizedBox(height: width*0.1),
                  Padding(
                    padding:EdgeInsets.only(left: 25.0,right: 25.0),
                    child: ElevatedButton(
                      style:ButtonStyle(
                          backgroundColor:MaterialStateProperty.all(Colors.amber)
                      ),onPressed: (){

                    },
                      child: Text('Confirm Delivery'),

                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
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
  TextStyle decor(Color color, double size) {
    return TextStyle(
      fontSize: size,
      color: color,
    );
  }
  TextStyle styleText(color,size,){
    return TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold
    );
  }
}
