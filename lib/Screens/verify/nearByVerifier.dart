import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/Screens/verify/verification.dart';
class NearByVerifier extends StatefulWidget {
  const NearByVerifier({Key key}) : super(key: key);

  @override
  _NearByVerifierState createState() => _NearByVerifierState();
}

class _NearByVerifierState extends State<NearByVerifier> {
  double height=0;
  double width=0;
  var title;
  var description;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfffffeea),
      appBar: AppBar(
        title: Text('Verification'),
        centerTitle: true,
      ),
      body:   StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("nearByVerifier").snapshots(),
        builder: (_,snap){
          if(snap.hasError){
            return Text("");
          }
          if(snap.hasData){
            return  ListView.builder(
                  itemCount: snap.data.docs.length,
                  itemBuilder: (_, i) {
                    DocumentSnapshot snaps = snap.data.docs[i];
                    title=snaps.get('name');
                     description=snaps.get('description');
                    return verifierTile(title,description);
                  },
            );
          }
          return Center(child:CircularProgressIndicator());
        },

      ),
    );
  }
  Widget verifierTile(name,des){
    return ListTile(

      leading: CircleAvatar(
        radius: 30,
        child: Icon(Icons.person),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,softWrap: true,),
          Text(des,softWrap: true,),
          Row(children: [
            Icon(Icons.star,color: Colors.amber,),
            Icon(Icons.star,color: Colors.amber,),
            Icon(Icons.star,color: Colors.amber,),
            Icon(Icons.star,color: Colors.amber,),
            Icon(Icons.star,color: Colors.amber,),
          ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Verification(verifier:title ,address: description,)));
              }, child: Text('Book Appointment'))
            ],
          )
        ],
      ),
    );
  }
}
