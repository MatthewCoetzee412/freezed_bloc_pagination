// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'food_load_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FoodLoadEventTearOff {
  const _$FoodLoadEventTearOff();

// ignore: unused_element
  _Load load(List<Food> items, @nullable DocumentSnapshot documentSnapshot) {
    return _Load(
      items,
      documentSnapshot,
    );
  }

// ignore: unused_element
  _ItemRecieved itemRecieved(Either<ItemFailure, List<Food>> items) {
    return _ItemRecieved(
      items,
    );
  }
}

// ignore: unused_element
const $FoodLoadEvent = _$FoodLoadEventTearOff();

mixin _$FoodLoadEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result load(
            List<Food> items, @nullable DocumentSnapshot documentSnapshot),
    @required Result itemRecieved(Either<ItemFailure, List<Food>> items),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(List<Food> items, @nullable DocumentSnapshot documentSnapshot),
    Result itemRecieved(Either<ItemFailure, List<Food>> items),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(_Load value),
    @required Result itemRecieved(_ItemRecieved value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(_Load value),
    Result itemRecieved(_ItemRecieved value),
    @required Result orElse(),
  });
}

abstract class $FoodLoadEventCopyWith<$Res> {
  factory $FoodLoadEventCopyWith(
          FoodLoadEvent value, $Res Function(FoodLoadEvent) then) =
      _$FoodLoadEventCopyWithImpl<$Res>;
}

class _$FoodLoadEventCopyWithImpl<$Res>
    implements $FoodLoadEventCopyWith<$Res> {
  _$FoodLoadEventCopyWithImpl(this._value, this._then);

  final FoodLoadEvent _value;
  // ignore: unused_field
  final $Res Function(FoodLoadEvent) _then;
}

abstract class _$LoadCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) then) =
      __$LoadCopyWithImpl<$Res>;
  $Res call({List<Food> items, @nullable DocumentSnapshot documentSnapshot});
}

class __$LoadCopyWithImpl<$Res> extends _$FoodLoadEventCopyWithImpl<$Res>
    implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(_Load _value, $Res Function(_Load) _then)
      : super(_value, (v) => _then(v as _Load));

  @override
  _Load get _value => super._value as _Load;

  @override
  $Res call({
    Object items = freezed,
    Object documentSnapshot = freezed,
  }) {
    return _then(_Load(
      items == freezed ? _value.items : items as List<Food>,
      documentSnapshot == freezed
          ? _value.documentSnapshot
          : documentSnapshot as DocumentSnapshot,
    ));
  }
}

class _$_Load implements _Load {
  const _$_Load(this.items, @nullable this.documentSnapshot)
      : assert(items != null);

  @override
  final List<Food> items;
  @override
  @nullable
  final DocumentSnapshot documentSnapshot;

  @override
  String toString() {
    return 'FoodLoadEvent.load(items: $items, documentSnapshot: $documentSnapshot)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Load &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.documentSnapshot, documentSnapshot) ||
                const DeepCollectionEquality()
                    .equals(other.documentSnapshot, documentSnapshot)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(documentSnapshot);

  @override
  _$LoadCopyWith<_Load> get copyWith =>
      __$LoadCopyWithImpl<_Load>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result load(
            List<Food> items, @nullable DocumentSnapshot documentSnapshot),
    @required Result itemRecieved(Either<ItemFailure, List<Food>> items),
  }) {
    assert(load != null);
    assert(itemRecieved != null);
    return load(items, documentSnapshot);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(List<Food> items, @nullable DocumentSnapshot documentSnapshot),
    Result itemRecieved(Either<ItemFailure, List<Food>> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load(items, documentSnapshot);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(_Load value),
    @required Result itemRecieved(_ItemRecieved value),
  }) {
    assert(load != null);
    assert(itemRecieved != null);
    return load(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(_Load value),
    Result itemRecieved(_ItemRecieved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements FoodLoadEvent {
  const factory _Load(
      List<Food> items, @nullable DocumentSnapshot documentSnapshot) = _$_Load;

  List<Food> get items;
  @nullable
  DocumentSnapshot get documentSnapshot;
  _$LoadCopyWith<_Load> get copyWith;
}

abstract class _$ItemRecievedCopyWith<$Res> {
  factory _$ItemRecievedCopyWith(
          _ItemRecieved value, $Res Function(_ItemRecieved) then) =
      __$ItemRecievedCopyWithImpl<$Res>;
  $Res call({Either<ItemFailure, List<Food>> items});
}

class __$ItemRecievedCopyWithImpl<$Res>
    extends _$FoodLoadEventCopyWithImpl<$Res>
    implements _$ItemRecievedCopyWith<$Res> {
  __$ItemRecievedCopyWithImpl(
      _ItemRecieved _value, $Res Function(_ItemRecieved) _then)
      : super(_value, (v) => _then(v as _ItemRecieved));

  @override
  _ItemRecieved get _value => super._value as _ItemRecieved;

  @override
  $Res call({
    Object items = freezed,
  }) {
    return _then(_ItemRecieved(
      items == freezed
          ? _value.items
          : items as Either<ItemFailure, List<Food>>,
    ));
  }
}

class _$_ItemRecieved implements _ItemRecieved {
  const _$_ItemRecieved(this.items) : assert(items != null);

  @override
  final Either<ItemFailure, List<Food>> items;

  @override
  String toString() {
    return 'FoodLoadEvent.itemRecieved(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemRecieved &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(items);

  @override
  _$ItemRecievedCopyWith<_ItemRecieved> get copyWith =>
      __$ItemRecievedCopyWithImpl<_ItemRecieved>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result load(
            List<Food> items, @nullable DocumentSnapshot documentSnapshot),
    @required Result itemRecieved(Either<ItemFailure, List<Food>> items),
  }) {
    assert(load != null);
    assert(itemRecieved != null);
    return itemRecieved(items);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result load(List<Food> items, @nullable DocumentSnapshot documentSnapshot),
    Result itemRecieved(Either<ItemFailure, List<Food>> items),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (itemRecieved != null) {
      return itemRecieved(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result load(_Load value),
    @required Result itemRecieved(_ItemRecieved value),
  }) {
    assert(load != null);
    assert(itemRecieved != null);
    return itemRecieved(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result load(_Load value),
    Result itemRecieved(_ItemRecieved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (itemRecieved != null) {
      return itemRecieved(this);
    }
    return orElse();
  }
}

abstract class _ItemRecieved implements FoodLoadEvent {
  const factory _ItemRecieved(Either<ItemFailure, List<Food>> items) =
      _$_ItemRecieved;

  Either<ItemFailure, List<Food>> get items;
  _$ItemRecievedCopyWith<_ItemRecieved> get copyWith;
}
