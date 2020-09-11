import 'dart:async';

import 'package:camera_demo/blocs/food_load_bloc/food_load_export.dart';
import 'package:camera_demo/models/food_model.dart';
import 'package:camera_demo/repository/firebase_repository.dart';
import 'package:camera_demo/custom_error_handler/custom_error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class FoodLoadBloc extends Bloc<FoodLoadEvent, FoodLoadState> {
  final FirebaseRepository _repository;

  FoodLoadBloc(this._repository);

  StreamSubscription<Either<ItemFailure, List<Food>>> _streamSubscription;

  @override
  FoodLoadState get initialState => FoodLoadState.intial();

  @override
  Stream<FoodLoadState> mapEventToState(FoodLoadEvent event) async* {
    yield* event.map(load: (_) async* {
      await _streamSubscription?.cancel();
      _streamSubscription = _repository
          .getMoreItems(_.items, _.documentSnapshot)
          .listen((foodItems) => add(FoodLoadEvent.itemRecieved(foodItems)));
    }, itemRecieved: (event) async* {
      yield event.items
          .fold((l) => FoodLoadState.error(l), (r) => FoodLoadState.success(r));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
