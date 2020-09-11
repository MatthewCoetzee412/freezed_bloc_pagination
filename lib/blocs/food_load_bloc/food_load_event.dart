import 'package:camera_demo/blocs/food_load_bloc/food_load_state.dart';
import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/custom_error_handler/custom_error_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_load_event.freezed.dart';

@freezed
abstract class FoodLoadEvent with _$FoodLoadEvent {
  const factory FoodLoadEvent.load(
      List<Food> items, @nullable DocumentSnapshot documentSnapshot) = _Load;
  const factory FoodLoadEvent.itemRecieved(
      Either<ItemFailure, List<Food>> items) = _ItemRecieved;
}
