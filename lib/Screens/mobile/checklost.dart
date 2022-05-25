import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hexcolor/hexcolor.dart';
class CheckLost extends StatefulWidget {
  const CheckLost({Key key}) : super(key: key);

  @override
  _CheckLostState createState() => _CheckLostState();
}

class _CheckLostState extends State<CheckLost> {
  double height=0;
  double width=0;
  var dataList=[]??['loading failed'];
  bool selectedBrand=false;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        title: Text("Check IMEI"),
        centerTitle: true,
      ),
body: Column(
  children: [
    Expanded(
        flex: 1,
        child: Container(
          child: Padding(
            padding:  EdgeInsets.all(2.0),
            child: Container(
              child: GFSearchBar(
                  searchList: dataList,
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
              // child:TextFormField(
              //   decoration: deco('Enter IMEI'),
              //   validator: RequiredValidator(
              //     errorText: "Required"
              //   ),
              // ),
            ),
    )),
    Expanded(
        flex:4,
        child: Padding(
          padding:EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12)
            ),
      child: Padding(
        padding:  EdgeInsets.all(5.0),
        child: datatable(),
      )
    ),
        ))
  ],
),
    );
  }
  InputDecoration deco(String text,helper){
    return InputDecoration(
      labelText: '$text',
      helperText: helper,
      border:OutlineInputBorder(
          borderRadius:BorderRadius.circular(12),
          borderSide:BorderSide(color: Colors.black,
              width: 2) ),


    );
  }
  TextStyle DataStyles(color,double size){
    return TextStyle(
        fontSize: size,
      color: color,



    );
  }
  TextStyle HeadStyles(){
    return TextStyle(
      fontSize: 14,
        fontWeight: FontWeight.bold,
      color: Colors.white
    );
  }
  Widget datatable(){
    return StreamBuilder<QuerySnapshot>(
        stream:FirebaseFirestore.instance.collection("lostandfound").snapshots(),
        builder:(context,snapshot){
          if (snapshot.hasData) {
            print(snapshot.data.docs);
            for(int i=0;i<snapshot.data.docs.length;i++){
              dataList.add(snapshot.data.docs[i].get('IMEI'));
            }

            return DataTable(
                headingRowColor:  MaterialStateProperty.all(Colors.amber),
                sortAscending: true,
                columnSpacing: 30,
                headingRowHeight: 40,
                dividerThickness: 2,

                // dataTextStyle: deco(Colors.black,MediaQuery.of(context).size.width*0.012),
                // headingTextStyle: deco(Colors.black,MediaQuery.of(context).size.width*0.012),
                columns: [
                  DataColumn(label:Center(child: Text("IMEI",style: HeadStyles(),))),
                  DataColumn(label:Center(child: Text("Status",style: HeadStyles(),))),
                  DataColumn(label:Center(child: Text("Details",style: HeadStyles(),))),
                ],rows: _createRows(snapshot.requireData));
          }
          else
            return DataTable(
              headingRowColor:  MaterialStateProperty.all(Colors.amber),
              sortAscending: true,
              columnSpacing: 30,
              headingRowHeight: 40,
              dividerThickness: 2,

              // dataTextStyle: deco(Colors.black,MediaQuery.of(context).size.width*0.012),
              // headingTextStyle: deco(Colors.black,MediaQuery.of(context).size.width*0.012),
              columns: [
                DataColumn(label:Text("IMEI",style: HeadStyles(),)),
                DataColumn(label:Text("Status",style: HeadStyles(),)),
                DataColumn(label:Text("Details",style: HeadStyles(),)),
              ],
              rows: [
                DataRow(

                    cells: [
                      DataCell(Text('loading..',style: DataStyles(Colors.black,12),)),
                      DataCell(Text('loading..',style: DataStyles(Colors.black,12),)),
                      DataCell(Text('loading..',style: DataStyles(Colors.black,12),)),
                    ]
                ),
              ],



            );

        }
    );
  }
  List<DataRow> _createRows(QuerySnapshot snapshot) {

    List<DataRow> newList = snapshot.docs.map((DocumentSnapshot documentSnapshot) {

      return new DataRow(

          cells: [
            DataCell(Center(child: Text(documentSnapshot.get('IMEI').toString().toLowerCase(),style: DataStyles(Colors.black,10)))),
            DataCell(Center(child: Text(documentSnapshot.get('status').toString().toLowerCase(),style: DataStyles(Colors.black,12)))),
            // DataCell(Text(documentSnapshot.get('').toString().toLowerCase(),style: DataStyles(Colors.black))),
            // DataCell(Text(documentSnapshot.get('password').toString().toLowerCase(),style: DataStyles(Colors.black))),
            DataCell(
                  InkWell(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
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
                                        Text("IMEI:",style:DataStyles(Colors.white,14)),
                                        Text("Status:",style:DataStyles(Colors.white,14)),
                                        Text("Area:",style:DataStyles(Colors.white,14)),
                                        Text("Mobile:",style:DataStyles(Colors.white,14)),
                                        Text("Model:",style:DataStyles(Colors.white,14)),
                                        Text("Condition:",style:DataStyles(Colors.white,14)),
                                        Text("Color:",style:DataStyles(Colors.white,14)),
                                        Text("Contact:",style:DataStyles(Colors.white,14)),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(documentSnapshot.get('IMEI').toString().toLowerCase(),style:DataStyles(Colors.blue,14),),
                                              Text(documentSnapshot.get('status').toString().toLowerCase(),style:DataStyles(Colors.blue,14)),
                                              Text(documentSnapshot.get('area').toString().toLowerCase(),style:DataStyles(Colors.blue,14)),
                                              Text(documentSnapshot.get('name').toString().toLowerCase(),style:DataStyles(Colors.blue,14)),
                                              Text(documentSnapshot.get('model').toString().toLowerCase(),style:DataStyles(Colors.blue,14)),
                                              Text("${documentSnapshot.get('condition').toString().toLowerCase()}/10",style:DataStyles(Colors.blue,14)),
                                              Text(documentSnapshot.get('color').toString().toLowerCase(),style:DataStyles(Colors.blue,14)),
                                              Text(documentSnapshot.get('contact').toString().toLowerCase(),style:DataStyles(Colors.blue,14)),
                                            ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: height*0.05,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RaisedButton(onPressed: (){
                                                 update(documentSnapshot.get('IMEI').toString().toLowerCase());
                                                 Navigator.pop(ctx);
                                          },color: Colors.amber,child: Text("Found",style:DataStyles(Colors.black,14)),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                        ),
                      );

                    },
                    child: Container(
                      width: width*0.22,
                      height: width*0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.deepOrange.shade400
                      ),
                      child: Center(
                        child: Text(
                          'More',style: DataStyles(Colors.white,12),
                        ),
                      ),
                    ),
                  )   
            ),
          ]
      );
    }).toList();
    return newList;
  }
  Widget dialoge(status){
    return AlertDialog(

        content: Container(
          height: height*0.5,
          decoration: BoxDecoration(
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
                    Text("Status",style:DataStyles(Colors.black,18))
                  ],),
                SizedBox(height: height*0.05,),
                Container(
                  child: TextFormField(

                    decoration: deco(status,"Found"),
                    validator: RequiredValidator(
                      errorText: 'Required'
                    ),
                  ),
                ),
                SizedBox(height: height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(onPressed: (){
                    },color: Colors.amber,child: Text("Update",style:DataStyles(Colors.black,14)),),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
  update(imei)async{
    await FirebaseFirestore.instance.collection("lostandfound").doc(imei).update(
        {
          'status': 'found',
        });
  }
}
