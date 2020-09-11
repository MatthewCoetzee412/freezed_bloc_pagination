import 'package:camera_demo/blocs/food_cud_bloc/food_cud_bloc.dart';
import 'package:camera_demo/blocs/food_load_bloc/food_load_bloc.dart';
import 'package:camera_demo/repository/firebase_repository.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void initGetIt() {
  getit.registerLazySingleton<FirebaseRepository>(() => FirebaseRepository());

  getit.registerFactory(() => FoodCudBloc(getit()));
  getit.registerFactory(() => FoodLoadBloc(getit()));
}
