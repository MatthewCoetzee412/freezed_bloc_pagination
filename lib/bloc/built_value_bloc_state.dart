library built_value_bloc_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:camera_demo/models/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'built_value_bloc_state.g.dart';

abstract class BuiltValueBlocState
    implements Built<BuiltValueBlocState, BuiltValueBlocStateBuilder> {
  Future<BuiltList<Food>> get items;
  bool get hasReachedEndofDocuments;
  @nullable
  String get exception;
  @nullable
  bool get isLoading;
  @nullable
  bool get isLoaded;
  @nullable
  bool get isSuccessful;

  BuiltValueBlocState._();

  factory BuiltValueBlocState([updates(BuiltValueBlocStateBuilder b)]) =
      _$BuiltValueBlocState;

  factory BuiltValueBlocState.intial() {
    return BuiltValueBlocState((b) => b
      ..items = Future<BuiltList<Food>>.value(BuiltList<Food>())
      ..hasReachedEndofDocuments = false);
  }

  factory BuiltValueBlocState.loading() {
    return BuiltValueBlocState((b) => b
      ..items = Future<BuiltList<Food>>.value(BuiltList<Food>())
      ..isLoading = true
      ..hasReachedEndofDocuments = false);
  }

  factory BuiltValueBlocState.loaded(Future<BuiltList<Food>> items) {
    return BuiltValueBlocState((b) => b
      ..items = items
      ..isLoaded = true
      ..hasReachedEndofDocuments = false);
  }

  factory BuiltValueBlocState.success(Future<BuiltList<Food>> items) {
    return BuiltValueBlocState((b) => b
      ..items = items
      ..hasReachedEndofDocuments = false
      ..isSuccessful = true);
  }

  factory BuiltValueBlocState.failed(String exception) {
    return BuiltValueBlocState((b) => b
      ..exception = exception
      ..items = Future<BuiltList<Food>>.value(BuiltList<Food>())
      ..hasReachedEndofDocuments = false);
  }
}
