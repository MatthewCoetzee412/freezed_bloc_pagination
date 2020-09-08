import 'package:async/async.dart';
import 'package:built_collection/built_collection.dart';

class FutureMerger<T> {
  Future<BuiltList<T>> merge<T>(Future<BuiltList<T>> firstFuture,
      Future<BuiltList<T>> secondFuture) async {
    BuiltList<T> combinedList = BuiltList<T>();

    for (T firstItem in await firstFuture) {
      combinedList = combinedList.rebuild((b) => b..add(firstItem));
    }

    for (T secondItem in await secondFuture) {
      combinedList = combinedList.rebuild((b) => b..add(secondItem));
    }

    return combinedList;
  }

  @deprecated
  Future<BuiltList<T>> mergeWithItem<T>(
      Future<BuiltList<T>> future, T item) async {
    BuiltList<T> combinedList = BuiltList<T>();

    for (T currentItem in await future) {
      combinedList = combinedList.rebuild((b) => b..add(currentItem));
    }

    combinedList = combinedList.rebuild((b) => b
      ..add(item)
      ..sort());

    return combinedList;
  }
}
