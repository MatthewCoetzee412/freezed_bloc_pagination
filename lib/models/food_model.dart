import 'package:camera_demo/models/food_model_serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.freezed.dart';

@freezed
abstract class Food implements _$Food {
  const Food._();

  const factory Food(
      {@required String type,
      @required @nullable DocumentSnapshot document}) = _Food;
}

// library food_model;

// import 'dart:convert';

// import 'package:built_collection/built_collection.dart';
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// part 'food_model.g.dart';

// abstract class Food implements Built<Food, FoodBuilder> {
//   String get type;
//   @nullable
//   DocumentSnapshot get document;

//   Food._();

//   factory Food([updates(FoodBuilder b)]) = _$Food;
// }
