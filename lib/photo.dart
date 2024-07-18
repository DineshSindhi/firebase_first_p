
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  FirebaseFirestore fireStore =FirebaseFirestore.instance;
  FirebaseAuth firebase= FirebaseAuth.instance;
  late CollectionReference mImage;
  @override
  Widget build(BuildContext context) {
    mImage=fireStore.collection('users').doc(firebase.currentUser!.uid).collection('image');
    return Scaffold(
      appBar: AppBar(title: Text('Notes'),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: Column(children: [
        InkWell(
          child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.orange,
            // image: DecorationImage(
            //   image: NetworkImage('${}'),
            // )
          ),
                ),
        ),
          ElevatedButton(onPressed: (){

          }, child: Text('Upload')),
          Expanded(
            child: StreamBuilder(
              stream: fireStore.collection('users').doc().collection('image').snapshots(),
              builder: (_, snapshot){
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasError){
                  return Center(child:Text('${snapshot.error}'),);
                }else if(snapshot.hasData){
                  return snapshot.data!.docs.isNotEmpty?
                      GridView.builder(
                        itemCount:snapshot.data!.size,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3
                      ), itemBuilder: (context, index) {
                        var mData=snapshot.data!.docs[index].data();

                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            // image: DecorationImage(
                            //   image: NetworkImage('${}'),
                            // )
                          ),
                        );
                      },)
                      :Center(child: CircularProgressIndicator(),);
                }
                return Container();
              },
            ),
          ),
        ],
      ),
  );}}