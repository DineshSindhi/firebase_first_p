import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_first/model/notes_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  var titController=TextEditingController();
  var descController=TextEditingController();
  var dtFor=DateFormat.Hm();
  FirebaseFirestore fireStore =FirebaseFirestore.instance;
  late CollectionReference mNotes;
  @override
  Widget build(BuildContext context) {
    mNotes=fireStore.collection('notes').doc().collection('todos');
    return Scaffold(
      appBar: AppBar(title: Text('Notes'),centerTitle: true,backgroundColor: Colors.blueGrey,),
      body: StreamBuilder(
        stream: fireStore.collection('notes').doc().collection('todos').snapshots(),
        builder: (_, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.hasError){
            return Center(child:Text('${snapshot.error}'),);
          }else if(snapshot.hasData){
            return snapshot.data!.docs.isNotEmpty?ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, index) {
                var mData=snapshot.data!.docs[index].data();
                var eachData=NoteModel.fromDoc(mData);
              return ListTile(
                onTap: () async {
                  showModalBottomSheet(context: context, builder: (context) {
                    return mySheet(context: context,isUpdate: true,upIndex: snapshot.data!.docs[index].id,createAtu:dtFor.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachData.time.toString()))));
                  },);
                  // var upData=NoteModel(title: 'Hello', desc: 'My name ___', time:DateTime.now().millisecondsSinceEpoch.toString() );
                  // await mNotes.doc(snapshot.data!.docs[index].id).update(upData.toDoc());
                },
                title: Text('${eachData.title}'),
                subtitle: Text('${eachData.desc}'),
                trailing: Column(
                  children: [
                    Text('${dtFor.format(DateTime.fromMillisecondsSinceEpoch(int.parse(eachData.time.toString())))}'),
                    InkWell(
                      onTap: (){
                       mNotes.doc(snapshot.data!.docs[index].id).delete();

                      },
                        child: Icon(Icons.delete,color: Colors.orange,)),
                  ],
                ),
              );
            },):Center(child: Text('No Notes Yet'),);
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context) =>
            mySheet(context: context),);
        },
        child: Icon(Icons.add),
      ),
    );
  }
  Widget mySheet({bool isUpdate = false, String upIndex='', createAtu='', required BuildContext context}){
    return Container(
        height: 700,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              Text(isUpdate? 'Update Note' :'Note',style: TextStyle(fontSize: 30),),
              TextField(controller: titController,
                decoration: InputDecoration(
                    label: Text('Enter Title'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),),
              SizedBox(height: 10,),
              TextField(controller: descController,
                decoration: InputDecoration(
                    label: Text('Enter Subtitle'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () async {
                    if(isUpdate){
                      var upData=NoteModel(title:  titController.text, desc: descController.text, time:DateTime.now().millisecondsSinceEpoch.toString() );
                      await mNotes.doc(upIndex).update(upData.toDoc());
                    }else{
                      var data=NoteModel(title: titController.text, desc: descController.text, time: DateTime.now().millisecondsSinceEpoch.toString());
                      await mNotes.add(data.toDoc());
                    }
                    Navigator.pop(context);
                    titController.clear();
                    descController.clear();
                  }, child: Text(isUpdate? 'Update Note':'Add Note',style: TextStyle(fontSize: 25),)),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);

                  }, child: Text('Cancel',style: TextStyle(fontSize: 25),)),
                ],
              ),
            ])));

  }
}
