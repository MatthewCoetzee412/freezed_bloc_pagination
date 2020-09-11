import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_error_handler.freezed.dart';

@freezed
abstract class ItemFailure with _$ItemFailure {
  const factory ItemFailure.noMoreDocumentsException() =
      _NoMoreDocumentsException;
  const factory ItemFailure.unknownException() = _UnknownException;
  const factory ItemFailure.lengthException() = _LengthException;
  const factory ItemFailure.networkException() = _NetworkException;
}
