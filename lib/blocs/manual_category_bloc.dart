import 'dart:async';
import 'package:camera_demo/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManualCategoryBloc{

  final _categoryListController = new StreamController<List<Category>>();

  Stream<List<Category>> get categoryListStream => _categoryListController.stream;
  StreamSink<List<Category>> get categoryListSink => _categoryListController.sink;

  ManualCategoryBloc(){
    getAllCategories();
  }


  getAllCategories(){
    Stream<QuerySnapshot> categoryStream = Firestore.instance.collection('users').document('user1').collection('categories').snapshots();
    categoryStream.map((qSnap) => qSnap.documents.map((dSnap) => Category.fromFirebase(dSnap)).toList()).listen((list) {
      categoryListSink.add(list);
     });
  }

  addCategory(Category category)async{
    await Firestore.instance.collection('users').document('user1').collection('categories').add(category.toJson());
    getAllCategories();
  }

  editCategory(String docId,Category category)async{
    await Firestore.instance.collection('users').document('user1').collection('categories').document(docId).updateData(category.toJson());
    getAllCategories();
  }

  deleteCategory(String docId)async{
    await Firestore.instance.collection('users').document('user1').collection('categories').document(docId).delete();
    getAllCategories();
  }


  void dispose(){ 
     _categoryListController.close();
  }



}