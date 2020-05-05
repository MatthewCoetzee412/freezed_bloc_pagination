// import 'package:camera_demo/blocs/manual_category_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:camera_demo/models/category_model.dart';

// void main(){
//   runApp(
//     ManualCategoryScreen()
//   );
// }

// class ManualCategoryScreen extends StatefulWidget {
//   @override
//   _ManualCategoryScreenState createState() => _ManualCategoryScreenState();
// }

// class _ManualCategoryScreenState extends State<ManualCategoryScreen> {

//   ManualCategoryBloc mcb = new ManualCategoryBloc();
//   //Add: 
//   //Add Category
//   //Edit category
//   //Delete Category
//   //Validation layer to models

//   @override
//   Widget build(BuildContext context) {   
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.blue,
//           title: Text('Manual Category Bloc'),
//         ),
//         body: SafeArea(
//           child: Container(
//             child: StreamBuilder(
//               stream:mcb.categoryListStream,
//               builder: (context,snapshot){
//                 if(snapshot.hasData){
//                   return ListView.builder(
//                   itemCount: snapshot.data.length,
//                   itemBuilder: (context,index){
//                     var categories = snapshot.data[index];
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         child: Container(
//                           width: double.infinity,
//                           height: 150,
//                           child: Center(
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: [
//                                  Text('${categories.amount}'),
//                                  Text('${categories.category}')
//                                ],
//                              ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//                 }
//                 else{
//                   return Center(child: new CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed:(){
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCategoryScreen()));
//           },  
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

// class AddCategoryScreen extends StatefulWidget {
//   @override
//   _AddCategoryScreenState createState() => _AddCategoryScreenState();
// }

// class _AddCategoryScreenState extends State<AddCategoryScreen> {

//   TextEditingController _amountController,_categoryController = new TextEditingController();

//    ManualCategoryBloc _mcb = new ManualCategoryBloc();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor:Colors.blue,
//         title:Text('Add Category'),
//       ),
//       body: Container(
//         child: Column(
//       children: [
//         TextFormField(
//           controller: _amountController,
//           decoration: InputDecoration(
//              hintText: 'Amount'
//           ),
//         ),
//         TextFormField(
//           controller: _categoryController,
//           decoration: InputDecoration(
//             hintText:'Category',
//           ),
//         ),
//         FlatButton(onPressed: (){
//           Category _category = new Category(_amountController.text, _categoryController.text);
//           _mcb.addCategory(_category);
//           Navigator.pop(context);
//         }, child: Text('Save'),color: Colors.blue,)
//       ],
//     ),
//       ),
//     );
//   }
// }
