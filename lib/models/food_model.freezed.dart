// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'food_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FoodTearOff {
  const _$FoodTearOff();

// ignore: unused_element
  _Food call(
      {@required String type, @required @nullable DocumentSnapshot document}) {
    return _Food(
      type: type,
      document: document,
    );
  }
}

// ignore: unused_element
const $Food = _$FoodTearOff();

mixin _$Food {
  String get type;
  @nullable
  DocumentSnapshot get document;

  $FoodCopyWith<Food> get copyWith;
}

abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res>;
  $Res call({String type, @nullable DocumentSnapshot document});
}

class _$FoodCopyWithImpl<$Res> implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  final Food _value;
  // ignore: unused_field
  final $Res Function(Food) _then;

  @override
  $Res call({
    Object type = freezed,
    Object document = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as String,
      document:
          document == freezed ? _value.document : document as DocumentSnapshot,
    ));
  }
}

abstract class _$FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$FoodCopyWith(_Food value, $Res Function(_Food) then) =
      __$FoodCopyWithImpl<$Res>;
  @override
  $Res call({String type, @nullable DocumentSnapshot document});
}

class __$FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res>
    implements _$FoodCopyWith<$Res> {
  __$FoodCopyWithImpl(_Food _value, $Res Function(_Food) _then)
      : super(_value, (v) => _then(v as _Food));

  @override
  _Food get _value => super._value as _Food;

  @override
  $Res call({
    Object type = freezed,
    Object document = freezed,
  }) {
    return _then(_Food(
      type: type == freezed ? _value.type : type as String,
      document:
          document == freezed ? _value.document : document as DocumentSnapshot,
    ));
  }
}

class _$_Food extends _Food {
  const _$_Food({@required this.type, @required @nullable this.document})
      : assert(type != null),
        super._();

  @override
  final String type;
  @override
  @nullable
  final DocumentSnapshot document;

  @override
  String toString() {
    return 'Food(type: $type, document: $document)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Food &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.document, document) ||
                const DeepCollectionEquality()
                    .equals(other.document, document)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(document);

  @override
  _$FoodCopyWith<_Food> get copyWith =>
      __$FoodCopyWithImpl<_Food>(this, _$identity);
}

abstract class _Food extends Food {
  const _Food._() : super._();
  const factory _Food(
      {@required String type,
      @required @nullable DocumentSnapshot document}) = _$_Food;

  @override
  String get type;
  @override
  @nullable
  DocumentSnapshot get document;
  @override
  _$FoodCopyWith<_Food> get copyWith;
}
