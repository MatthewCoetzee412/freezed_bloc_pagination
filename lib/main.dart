import 'package:camera_demo/blocs/manual_category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:camera_demo/models/category_model.dart';

void main(){
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ManualCategoryScreen(),
    );
  }
}


class ManualCategoryScreen extends StatefulWidget {
  @override
  _ManualCategoryScreenState createState() => _ManualCategoryScreenState();
}

class _ManualCategoryScreenState extends State<ManualCategoryScreen> {

  ManualCategoryBloc _mcb = new ManualCategoryBloc();
  //Add: 
  //Add Category
  //Edit category
  //Delete Category
  //Validation layer to models

  void dispose(){
    super.dispose();
    _mcb.dispose();
  }

  @override
  Widget build(BuildContext context) {   
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text('Manual Category Bloc'),
        ),
        body: SafeArea(
          child: Container(
            child: StreamBuilder(
              stream:_mcb.categoryListStream,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    Category categories = snapshot.data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          _mcb.getSelectedCategory(categories);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditCategoryScreen()));
                        },
                         child: Card(
                          child: Container(
                            width: double.infinity,
                            height: 150,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children:[ 
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text('${categories.amount}'),
                                     Text('${categories.category}')
                                   ],
                                 ),
                                 IconButton(
                                   icon: Icon(Icons.delete),
                                    onPressed: (){
                                      
                                    },
                                 )
                                 ]
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCategoryScreen()));
          },  
          child: Icon(Icons.add),
        ),
    );
  }
}

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {

  final _amountController = new TextEditingController();
  final _categoryController = new TextEditingController();
   ManualCategoryBloc _mcb = new ManualCategoryBloc();

    void dispose(){
      super.dispose();
      _mcb.dispose();
    }
    
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        title:Text('Add Category'),
      ),
      body: Container(
        child: Column(
      children: [
        TextFormField(
          controller: _amountController,
          decoration: InputDecoration(
             hintText: 'Amount'
          ),
        ),
        TextFormField(
          controller: _categoryController,
          decoration: InputDecoration(
            hintText:'Category',
          ),
        ),
        FlatButton(onPressed: (){
          Category _category = new Category(_amountController.text, _categoryController.text);
          _mcb.addCategory(_category);
          Navigator.pop(context);
        }, child: Text('Save'),color: Colors.blue,)
      ],
    ),
      ),
    );
  }
}

class EditCategoryScreen extends StatefulWidget {
  @override
  _EditCategoryScreenState createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {

  final _amountController = new TextEditingController();
  final _categoryController = new TextEditingController();
   ManualCategoryBloc _mcb = new ManualCategoryBloc();

   void dispose(){
     super.dispose();
     _mcb.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        title:Text('Edit Category'),
      ),
      body: Container(
        child: StreamBuilder(
            stream: _mcb.categorySelectedStream,
            builder: (context,snapshot){
              print(snapshot.data);
              return Column(
        children: [
          TextFormField(
            controller: _amountController,
            decoration: InputDecoration(
               hintText: 'Amount'
            ),
          ),
          TextFormField(
            controller: _categoryController,
            decoration: InputDecoration(
              hintText:'Category',
            ),
          ),
          FlatButton(onPressed: (){
            Category _category = new Category(_amountController.text, _categoryController.text);
            _mcb.editCategory({'docId':_category});//CHANGE
            Navigator.pop(context);
          }, child: Text('Save'),color: Colors.blue,)
      ],
    );
            },
        ),
      ),
    );
  }
}
