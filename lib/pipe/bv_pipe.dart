import 'package:built_collection/built_collection.dart';
import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/models/food_model_serializer.dart';
import 'package:camera_demo/repository/firebase_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class BVPipe {
  final FirebaseRepository repo;

  BVPipe({@required this.repo});

  Future<BuiltList<Food>> getMoreFomattedFood(DocumentSnapshot snapshot) async {
    Stream<QuerySnapshot> itemStream = await repo.getMoreItems(snapshot);

    BuiltList<Food> list = BuiltList<Food>();

    await for (QuerySnapshot qSnap in itemStream) {
      //Error checking would go here
      if (qSnap != null) {
        for (DocumentSnapshot dSnap in qSnap.documents) {
          list =
              list.rebuild((b) => b..add(FoodSerializer.fromFirestore(dSnap)));
        }
        break;
      } else {
        throw NullException();
      }
    }

    print(list);

    return list;
  }
}

class NullException implements Exception {}
