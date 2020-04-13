import 'package:camera_demo/blocs/manual_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:camera_demo/models/category_model.dart';

class ManualCategoryScreen extends StatefulWidget {
  @override
  _ManualCategoryScreenState createState() => _ManualCategoryScreenState();
}

class _ManualCategoryScreenState extends State<ManualCategoryScreen> {

  ManualCategoryBloc mcb = new ManualCategoryBloc();
  //Add: 
  //Add Category
  //Edit category
  //Delete Category
  //Validation layer to models

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('Manual Category Bloc'),
        ),
        body: SafeArea(
          child: Container(
            child: StreamBuilder(
              stream:mcb.categoryListStream,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    var categories = snapshot.data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          child: Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text('${categories.id}'),
                                 Text('${categories.amount}'),
                                 Text('${categories.category}')
                               ],
                             ),
                          ),
                        ),
                      ),
                    );
                  },
                );
                }
                else{
                  return Center(child: new CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            //Open add category alert dialog
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
