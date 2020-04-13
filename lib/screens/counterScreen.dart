import 'package:camera_demo/blocs/manual_counter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen>{
    ManualCounterBloc counterBloc = new ManualCounterBloc();

    query(){
     var result = Firestore.instance.collection('users').document('user1').collection('categories').snapshots();
      result.listen((event) {
        for(int i=0;i<event.documents.length;i++){
          print(event.documents[i]['id']);
          print(event.documents[i]['amount']);
          print(event.documents[i]['category']);
        }
      });
    }

  @override
  Widget build(BuildContext context) {

    @override
    void dispose(){
      counterBloc.dispose();
      super.dispose();
    }

    return MaterialApp(
          home: StreamBuilder(
            stream: counterBloc.counterStream,
            builder: (context,snapshot){
              return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('Counter'),
        ),
        body: Container(
          child: Center(
            child: Text('${snapshot.data}')
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(onPressed: (){
              query();
              counterBloc.counterIncrement.add(snapshot.data);
            },child: Icon(Icons.add),backgroundColor: Colors.blue,)
            ,SizedBox(
              width: 10,
            )
            ,FloatingActionButton(onPressed: (){
              counterBloc.counterDecrement.add(snapshot.data);
            },child: Icon(Icons.minimize),)
          ],
        ),
      );
            },
          )
    );
  }
}