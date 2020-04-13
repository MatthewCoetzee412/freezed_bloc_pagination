import 'dart:async';
import 'package:camera_demo/blocs/manual_counter_bloc.dart';
import 'package:camera_demo/models/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ManualCategoryBloc{

  var categories = Firestore.instance.collection('users').document('user1').collection('categories').snapshots();

  final _categoryListController = new StreamController<List<Category>>();

  Stream<List<Category>> get getListStream => _categoryListController.stream;
  StreamSink<List<Category>> get categoryListSink => _categoryListController.sink;

  ManualCounterBloc(){
    
  }




}