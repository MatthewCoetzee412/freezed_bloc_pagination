//*Used in place for Firestore

import 'dart:async';

import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/models/food_model_serializer.dart';
import 'package:camera_demo/custom_error_handler/custom_error_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

class FirebaseRepository {
  final _instance = Firestore.instance;

  Stream<Either<ItemFailure, List<Food>>> getMoreItems(
      List<Food> items, DocumentSnapshot snapshot) async* {
    Query query = _instance
        .collection('food')
        .orderBy('type', descending: false)
        .limit(20);

    Stream<QuerySnapshot> itemStream = snapshot != null
        ? query.startAfterDocument(snapshot).snapshots()
        : query.snapshots();

    yield* itemStream
        .map((qSnap) => right<ItemFailure, List<Food>>(qSnap.documents
            .map((dSnap) => FoodSerializer.fromFirestore(dSnap))
            .toList()
              ..addAll(items)
              ..sort((old, next) =>
                  old.type.toLowerCase().compareTo(next.type.toLowerCase()))))
        .onErrorReturnWith((err) {
      if (err.toString().contains(NoMorePageException.message)) {
        return left(ItemFailure.unknownException());
      } else {
        return left(ItemFailure.unknownException());
      }
    });
  }

  Future<Either<ItemFailure, Unit>> addFoodItem(Food food) async {
    try {
      await _instance
          .collection('food')
          .add(FoodSerializer.toJson(food))
          .catchError((err) => NetworkException());
      return right(unit);
    } on NetworkException catch (_) {
      return left(ItemFailure.networkException());
    } catch (_) {
      return left(ItemFailure.unknownException());
    }
  }
}

class NetworkException implements Exception {
  final String message = 'NETWORK_EXCEPTION';
}

class LengthException implements Exception {}

class NoMorePageException implements Exception {
  static final String message = 'NO_MORE_PAGE_EXCEPTION';
}
