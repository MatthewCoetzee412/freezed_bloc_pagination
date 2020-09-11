// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'food_cud_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FoodCudEventTearOff {
  const _$FoodCudEventTearOff();

// ignore: unused_element
  _Add add(Food food) {
    return _Add(
      food,
    );
  }

// ignore: unused_element
  _Update update(Either<ItemFailure, Food> food, String docID) {
    return _Update(
      food,
      docID,
    );
  }

// ignore: unused_element
  _Delete delete(String docID) {
    return _Delete(
      docID,
    );
  }
}

// ignore: unused_element
const $FoodCudEvent = _$FoodCudEventTearOff();

mixin _$FoodCudEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(Food food),
    @required Result update(Either<ItemFailure, Food> food, String docID),
    @required Result delete(String docID),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(Food food),
    Result update(Either<ItemFailure, Food> food, String docID),
    Result delete(String docID),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(_Add value),
    @required Result update(_Update value),
    @required Result delete(_Delete value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(_Add value),
    Result update(_Update value),
    Result delete(_Delete value),
    @required Result orElse(),
  });
}

abstract class $FoodCudEventCopyWith<$Res> {
  factory $FoodCudEventCopyWith(
          FoodCudEvent value, $Res Function(FoodCudEvent) then) =
      _$FoodCudEventCopyWithImpl<$Res>;
}

class _$FoodCudEventCopyWithImpl<$Res> implements $FoodCudEventCopyWith<$Res> {
  _$FoodCudEventCopyWithImpl(this._value, this._then);

  final FoodCudEvent _value;
  // ignore: unused_field
  final $Res Function(FoodCudEvent) _then;
}

abstract class _$AddCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) then) =
      __$AddCopyWithImpl<$Res>;
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

class __$AddCopyWithImpl<$Res> extends _$FoodCudEventCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(_Add _value, $Res Function(_Add) _then)
      : super(_value, (v) => _then(v as _Add));

  @override
  _Add get _value => super._value as _Add;

  @override
  $Res call({
    Object food = freezed,
  }) {
    return _then(_Add(
      food == freezed ? _value.food : food as Food,
    ));
  }

  @override
  $FoodCopyWith<$Res> get food {
    if (_value.food == null) {
      return null;
    }
    return $FoodCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value));
    });
  }
}

class _$_Add implements _Add {
  const _$_Add(this.food) : assert(food != null);

  @override
  final Food food;

  @override
  String toString() {
    return 'FoodCudEvent.add(food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Add &&
            (identical(other.food, food) ||
                const DeepCollectionEquality().equals(other.food, food)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(food);

  @override
  _$AddCopyWith<_Add> get copyWith =>
      __$AddCopyWithImpl<_Add>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(Food food),
    @required Result update(Either<ItemFailure, Food> food, String docID),
    @required Result delete(String docID),
  }) {
    assert(add != null);
    assert(update != null);
    assert(delete != null);
    return add(food);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(Food food),
    Result update(Either<ItemFailure, Food> food, String docID),
    Result delete(String docID),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(_Add value),
    @required Result update(_Update value),
    @required Result delete(_Delete value),
  }) {
    assert(add != null);
    assert(update != null);
    assert(delete != null);
    return add(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(_Add value),
    Result update(_Update value),
    Result delete(_Delete value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements FoodCudEvent {
  const factory _Add(Food food) = _$_Add;

  Food get food;
  _$AddCopyWith<_Add> get copyWith;
}

abstract class _$UpdateCopyWith<$Res> {
  factory _$UpdateCopyWith(_Update value, $Res Function(_Update) then) =
      __$UpdateCopyWithImpl<$Res>;
  $Res call({Either<ItemFailure, Food> food, String docID});
}

class __$UpdateCopyWithImpl<$Res> extends _$FoodCudEventCopyWithImpl<$Res>
    implements _$UpdateCopyWith<$Res> {
  __$UpdateCopyWithImpl(_Update _value, $Res Function(_Update) _then)
      : super(_value, (v) => _then(v as _Update));

  @override
  _Update get _value => super._value as _Update;

  @override
  $Res call({
    Object food = freezed,
    Object docID = freezed,
  }) {
    return _then(_Update(
      food == freezed ? _value.food : food as Either<ItemFailure, Food>,
      docID == freezed ? _value.docID : docID as String,
    ));
  }
}

class _$_Update implements _Update {
  const _$_Update(this.food, this.docID)
      : assert(food != null),
        assert(docID != null);

  @override
  final Either<ItemFailure, Food> food;
  @override
  final String docID;

  @override
  String toString() {
    return 'FoodCudEvent.update(food: $food, docID: $docID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Update &&
            (identical(other.food, food) ||
                const DeepCollectionEquality().equals(other.food, food)) &&
            (identical(other.docID, docID) ||
                const DeepCollectionEquality().equals(other.docID, docID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(food) ^
      const DeepCollectionEquality().hash(docID);

  @override
  _$UpdateCopyWith<_Update> get copyWith =>
      __$UpdateCopyWithImpl<_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(Food food),
    @required Result update(Either<ItemFailure, Food> food, String docID),
    @required Result delete(String docID),
  }) {
    assert(add != null);
    assert(update != null);
    assert(delete != null);
    return update(food, docID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(Food food),
    Result update(Either<ItemFailure, Food> food, String docID),
    Result delete(String docID),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(food, docID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(_Add value),
    @required Result update(_Update value),
    @required Result delete(_Delete value),
  }) {
    assert(add != null);
    assert(update != null);
    assert(delete != null);
    return update(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(_Add value),
    Result update(_Update value),
    Result delete(_Delete value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements FoodCudEvent {
  const factory _Update(Either<ItemFailure, Food> food, String docID) =
      _$_Update;

  Either<ItemFailure, Food> get food;
  String get docID;
  _$UpdateCopyWith<_Update> get copyWith;
}

abstract class _$DeleteCopyWith<$Res> {
  factory _$DeleteCopyWith(_Delete value, $Res Function(_Delete) then) =
      __$DeleteCopyWithImpl<$Res>;
  $Res call({String docID});
}

class __$DeleteCopyWithImpl<$Res> extends _$FoodCudEventCopyWithImpl<$Res>
    implements _$DeleteCopyWith<$Res> {
  __$DeleteCopyWithImpl(_Delete _value, $Res Function(_Delete) _then)
      : super(_value, (v) => _then(v as _Delete));

  @override
  _Delete get _value => super._value as _Delete;

  @override
  $Res call({
    Object docID = freezed,
  }) {
    return _then(_Delete(
      docID == freezed ? _value.docID : docID as String,
    ));
  }
}

class _$_Delete implements _Delete {
  const _$_Delete(this.docID) : assert(docID != null);

  @override
  final String docID;

  @override
  String toString() {
    return 'FoodCudEvent.delete(docID: $docID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Delete &&
            (identical(other.docID, docID) ||
                const DeepCollectionEquality().equals(other.docID, docID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(docID);

  @override
  _$DeleteCopyWith<_Delete> get copyWith =>
      __$DeleteCopyWithImpl<_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result add(Food food),
    @required Result update(Either<ItemFailure, Food> food, String docID),
    @required Result delete(String docID),
  }) {
    assert(add != null);
    assert(update != null);
    assert(delete != null);
    return delete(docID);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result add(Food food),
    Result update(Either<ItemFailure, Food> food, String docID),
    Result delete(String docID),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(docID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result add(_Add value),
    @required Result update(_Update value),
    @required Result delete(_Delete value),
  }) {
    assert(add != null);
    assert(update != null);
    assert(delete != null);
    return delete(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result add(_Add value),
    Result update(_Update value),
    Result delete(_Delete value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements FoodCudEvent {
  const factory _Delete(String docID) = _$_Delete;

  String get docID;
  _$DeleteCopyWith<_Delete> get copyWith;
}
