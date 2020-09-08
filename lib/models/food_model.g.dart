// GENERATED CODE - DO NOT MODIFY BY HAND

part of food_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Food extends Food {
  @override
  final String type;
  @override
  final DocumentSnapshot document;

  factory _$Food([void Function(FoodBuilder) updates]) =>
      (new FoodBuilder()..update(updates)).build();

  _$Food._({this.type, this.document}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('Food', 'type');
    }
  }

  @override
  Food rebuild(void Function(FoodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodBuilder toBuilder() => new FoodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Food && type == other.type && document == other.document;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), document.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Food')
          ..add('type', type)
          ..add('document', document))
        .toString();
  }
}

class FoodBuilder implements Builder<Food, FoodBuilder> {
  _$Food _$v;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  DocumentSnapshot _document;
  DocumentSnapshot get document => _$this._document;
  set document(DocumentSnapshot document) => _$this._document = document;

  FoodBuilder();

  FoodBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _document = _$v.document;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Food other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Food;
  }

  @override
  void update(void Function(FoodBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Food build() {
    final _$result = _$v ?? new _$Food._(type: type, document: document);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
