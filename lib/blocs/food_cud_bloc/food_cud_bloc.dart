import 'package:camera_demo/blocs/food_cud_bloc/food_cud_export.dart';
import 'package:camera_demo/repository/firebase_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCudBloc extends Bloc<FoodCudEvent, FoodCudState> {
  final FirebaseRepository _repository;

  FoodCudBloc(this._repository);

  @override
  FoodCudState get initialState => FoodCudState.intial();

  @override
  Stream<FoodCudState> mapEventToState(FoodCudEvent event) async* {
    yield* event.map(
      add: (add) async* {
        yield FoodCudState.loading();
        yield await _repository
            .addFoodItem(add.food)
            .catchError((err) => FoodCudState.error(err))
            .then((_) => FoodCudState.success());
      },
      update: (_) async* {},
      delete: (_) async* {},
    );
  }
}
