import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_cud_state.freezed.dart';

@freezed
abstract class FoodCudState with _$FoodCudState {
  const factory FoodCudState.intial() = _Intial;
  const factory FoodCudState.loading() = _Loading;
  const factory FoodCudState.success() = _Success;
  const factory FoodCudState.error(String exception) = _Error;
}
