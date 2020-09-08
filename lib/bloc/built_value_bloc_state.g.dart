// GENERATED CODE - DO NOT MODIFY BY HAND

part of built_value_bloc_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BuiltValueBlocState extends BuiltValueBlocState {
  @override
  final Future<BuiltList<Food>> items;
  @override
  final bool hasReachedEndofDocuments;
  @override
  final String exception;
  @override
  final bool isLoading;
  @override
  final bool isLoaded;
  @override
  final bool isSuccessful;

  factory _$BuiltValueBlocState(
          [void Function(BuiltValueBlocStateBuilder) updates]) =>
      (new BuiltValueBlocStateBuilder()..update(updates)).build();

  _$BuiltValueBlocState._(
      {this.items,
      this.hasReachedEndofDocuments,
      this.exception,
      this.isLoading,
      this.isLoaded,
      this.isSuccessful})
      : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('BuiltValueBlocState', 'items');
    }
    if (hasReachedEndofDocuments == null) {
      throw new BuiltValueNullFieldError(
          'BuiltValueBlocState', 'hasReachedEndofDocuments');
    }
  }

  @override
  BuiltValueBlocState rebuild(
          void Function(BuiltValueBlocStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltValueBlocStateBuilder toBuilder() =>
      new BuiltValueBlocStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltValueBlocState &&
        items == other.items &&
        hasReachedEndofDocuments == other.hasReachedEndofDocuments &&
        exception == other.exception &&
        isLoading == other.isLoading &&
        isLoaded == other.isLoaded &&
        isSuccessful == other.isSuccessful;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, items.hashCode),
                        hasReachedEndofDocuments.hashCode),
                    exception.hashCode),
                isLoading.hashCode),
            isLoaded.hashCode),
        isSuccessful.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuiltValueBlocState')
          ..add('items', items)
          ..add('hasReachedEndofDocuments', hasReachedEndofDocuments)
          ..add('exception', exception)
          ..add('isLoading', isLoading)
          ..add('isLoaded', isLoaded)
          ..add('isSuccessful', isSuccessful))
        .toString();
  }
}

class BuiltValueBlocStateBuilder
    implements Builder<BuiltValueBlocState, BuiltValueBlocStateBuilder> {
  _$BuiltValueBlocState _$v;

  Future<BuiltList<Food>> _items;
  Future<BuiltList<Food>> get items => _$this._items;
  set items(Future<BuiltList<Food>> items) => _$this._items = items;

  bool _hasReachedEndofDocuments;
  bool get hasReachedEndofDocuments => _$this._hasReachedEndofDocuments;
  set hasReachedEndofDocuments(bool hasReachedEndofDocuments) =>
      _$this._hasReachedEndofDocuments = hasReachedEndofDocuments;

  String _exception;
  String get exception => _$this._exception;
  set exception(String exception) => _$this._exception = exception;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _isLoaded;
  bool get isLoaded => _$this._isLoaded;
  set isLoaded(bool isLoaded) => _$this._isLoaded = isLoaded;

  bool _isSuccessful;
  bool get isSuccessful => _$this._isSuccessful;
  set isSuccessful(bool isSuccessful) => _$this._isSuccessful = isSuccessful;

  BuiltValueBlocStateBuilder();

  BuiltValueBlocStateBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items;
      _hasReachedEndofDocuments = _$v.hasReachedEndofDocuments;
      _exception = _$v.exception;
      _isLoading = _$v.isLoading;
      _isLoaded = _$v.isLoaded;
      _isSuccessful = _$v.isSuccessful;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltValueBlocState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuiltValueBlocState;
  }

  @override
  void update(void Function(BuiltValueBlocStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuiltValueBlocState build() {
    final _$result = _$v ??
        new _$BuiltValueBlocState._(
            items: items,
            hasReachedEndofDocuments: hasReachedEndofDocuments,
            exception: exception,
            isLoading: isLoading,
            isLoaded: isLoaded,
            isSuccessful: isSuccessful);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
