import 'package:camera_demo/bloc/built_value_bloc_export.dart';
import 'package:camera_demo/pipe/bv_pipe.dart';
import 'package:camera_demo/repository/firebase_repository.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

void initGetIt() {
  getit.registerLazySingleton<FirebaseRepository>(() => FirebaseRepository());

  getit.registerFactory(() => BVPipe(repo: getit()));
  getit.registerFactory(
      () => BuiltValueBlocBloc(bvpipe: getit(), repo: getit()));
}
