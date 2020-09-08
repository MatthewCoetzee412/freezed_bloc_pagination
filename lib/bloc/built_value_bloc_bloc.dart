import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:camera_demo/bloc/built_value_bloc_event.dart';
import 'package:camera_demo/bloc/built_value_bloc_state.dart';
import 'package:camera_demo/merger/future_merger.dart';
import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/pipe/bv_pipe.dart';
import 'package:camera_demo/repository/firebase_repository.dart';

class BuiltValueBlocBloc
    extends Bloc<BuiltValueBlocEvents, BuiltValueBlocState> {
  final BVPipe bvpipe;
  final FirebaseRepository repo;

  BuiltValueBlocBloc({this.bvpipe, this.repo});

  @override
  BuiltValueBlocState get initialState => BuiltValueBlocState.intial();

  @override
  Stream<BuiltValueBlocState> mapEventToState(
      BuiltValueBlocEvents event) async* {
    if (event is LoadBuiltValueBlocEvent) {
      yield* _mapToEventLoadBuiltValues(event);
    }
    if (event is AddFoodItemEvent) {
      yield* _mapToEventAddFoodItem(event);
    }
  }

  Stream<BuiltValueBlocState> _mapToEventLoadBuiltValues(
      LoadBuiltValueBlocEvent event) async* {
    if (event.documentSnapshot == null) {
      yield BuiltValueBlocState.loading();
    }
    try {
      Future<BuiltList<Food>> list =
          bvpipe.getMoreFomattedFood(event.documentSnapshot);

      yield BuiltValueBlocState.loaded(FutureMerger().merge(state.items, list));
    } on NoMorePageException catch (_) {
      yield state.rebuild((b) => b..hasReachedEndofDocuments = true);
    } catch (err) {
      yield BuiltValueBlocState.failed(err.toString());
    }
  }

  Stream<BuiltValueBlocState> _mapToEventAddFoodItem(
      AddFoodItemEvent event) async* {
    try {
      await repo.addFoodItem(event.food);
      yield BuiltValueBlocState.success(state.items);
      //Doesnt work
      // yield BuiltValueBlocState.success(FutureMerge().mergeWithItem(state.items, event.food));
    } catch (err) {
      yield BuiltValueBlocState.failed(err.toString());
    }
  }
}
