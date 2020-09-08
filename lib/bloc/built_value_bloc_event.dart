import 'package:camera_demo/models/food_model.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class BuiltValueBlocEvents extends Equatable {}

class LoadBuiltValueBlocEvent extends BuiltValueBlocEvents {
  final DocumentSnapshot documentSnapshot;

  LoadBuiltValueBlocEvent({@required this.documentSnapshot});

  @override
  List<Object> get props => [documentSnapshot];
}

class AddFoodItemEvent extends BuiltValueBlocEvents {
  final Food food;

  AddFoodItemEvent({@required this.food}) : assert(food != null);

  @override
  List<Object> get props => [food];
}
