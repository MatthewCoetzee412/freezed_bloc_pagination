import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/custom_error_handler/custom_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_cud_event.freezed.dart';

@freezed
abstract class FoodCudEvent with _$FoodCudEvent {
  const factory FoodCudEvent.add(Food food) = _Add;
  const factory FoodCudEvent.update(
      Either<ItemFailure, Food> food, String docID) = _Update;
  const factory FoodCudEvent.delete(String docID) = _Delete;
}
