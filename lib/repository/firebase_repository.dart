//*Used in place for Firestore

import 'dart:async';

import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/models/food_model_serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepository {
  final _instance = Firestore.instance;

  Future<Stream<QuerySnapshot>> getMoreItems(DocumentSnapshot snapshot) async {
    Query query = _instance
        .collection('food')
        .orderBy('type', descending: false)
        .limit(20);

    return snapshot != null
        ? query.startAfterDocument(snapshot).snapshots()
        : query.snapshots();
  }

  Future<void> addFoodItem(Food food) async {
    return await _instance.collection('food').add(FoodSerializer.toJson(food));
  }
}

class NoMorePageException implements Exception {}
