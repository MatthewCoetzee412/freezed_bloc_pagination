import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/custom_error_handler/custom_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_load_state.freezed.dart';

@freezed
abstract class FoodLoadState with _$FoodLoadState {
  const factory FoodLoadState.intial() = _Intial;
  const factory FoodLoadState.loading() = _Loading;
  const factory FoodLoadState.success(List<Food> items) = _Success;
  const factory FoodLoadState.error(ItemFailure failure) = _Error;
}
