import 'dart:async';
import 'package:camera_demo/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManualCategoryBloc{

  final _categoryListController = new StreamController<List<Category>>();
  final _categoryAddController = new StreamController<Category>();
  final _categoryEditController = new StreamController<Map<String,Category>>();
  final _categorySelectedCategory = new StreamController<Category>();

  Stream<List<Category>> get categoryListStream => _categoryListController.stream;
  Stream<Category>get categorySelectedStream => _categorySelectedCategory.stream;
  StreamSink<Category> get _categorySelectedSink => _categorySelectedCategory.sink;
  StreamSink<List<Category>> get _categoryListSink => _categoryListController.sink;
  StreamSink<Category>get categoryAddSink => _categoryAddController.sink;
  StreamSink<Map<String,Category>>get categoryEditSink => _categoryEditController.sink;
  

  ManualCategoryBloc(){
    getAllCategories();
    _categoryAddController.stream.listen(addCategory);
    _categoryEditController.stream.listen(editCategory);
  }


  getSelectedCategory(Category category){
    _categorySelectedSink.add(category);
  }

  getAllCategories(){
    Stream<QuerySnapshot> categoryStream = Firestore.instance.collection('users').document('user1').collection('categories').snapshots();
    categoryStream.map((qSnap) => qSnap.documents.map((dSnap) => Category.fromFirebase(dSnap)).toList()).listen((list) {
      _categoryListSink.add(list);
     });
  }

  addCategory(Category category)async{
    await Firestore.instance.collection('users').document('user1').collection('categories').add(category.toJson());
    getAllCategories(); //ADD EFFICIENCY HERE
    //Using more streams and sinks to update instead of calling all categories each time
  }

  editCategory(Map<String,Category>categoryMap)async{
    String documentId;
    Category category;
    categoryMap.map((key, value) {
      documentId = key;
      category = value;
      return null;
    });
    await Firestore.instance.collection('users').document('user1').collection('categories').document(documentId).updateData(category.toJson());
    getAllCategories(); //ADD EFFICIENCY HERE
  }

  deleteCategory(String docId)async{
    await Firestore.instance.collection('users').document('user1').collection('categories').document(docId).delete();
    getAllCategories(); //ADD EFFICIENCY HERE
  }


  void dispose(){ 
     _categoryListController.close();
     _categoryAddController.close();
     _categoryEditController.close();
     _categorySelectedCategory.close();
  }



}