// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) {
  return _BookingModel.fromJson(json);
}

/// @nodoc
mixin _$BookingModel {
  String? get bookingId => throw _privateConstructorUsedError;
  String? get numberOfTable => throw _privateConstructorUsedError;
  String? get numberOfSeat => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get sellerUid => throw _privateConstructorUsedError;
  String? get sellername => throw _privateConstructorUsedError;
  String? get sellerLoc => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingModelCopyWith<BookingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingModelCopyWith<$Res> {
  factory $BookingModelCopyWith(
          BookingModel value, $Res Function(BookingModel) then) =
      _$BookingModelCopyWithImpl<$Res, BookingModel>;
  @useResult
  $Res call(
      {String? bookingId,
      String? numberOfTable,
      String? numberOfSeat,
      String? time,
      String? sellerUid,
      String? sellername,
      String? sellerLoc,
      UserModel? user,
      String? date,
      @TimestampConverter() Timestamp? timestamp});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$BookingModelCopyWithImpl<$Res, $Val extends BookingModel>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? numberOfTable = freezed,
    Object? numberOfSeat = freezed,
    Object? time = freezed,
    Object? sellerUid = freezed,
    Object? sellername = freezed,
    Object? sellerLoc = freezed,
    Object? user = freezed,
    Object? date = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfTable: freezed == numberOfTable
          ? _value.numberOfTable
          : numberOfTable // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfSeat: freezed == numberOfSeat
          ? _value.numberOfSeat
          : numberOfSeat // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerUid: freezed == sellerUid
          ? _value.sellerUid
          : sellerUid // ignore: cast_nullable_to_non_nullable
              as String?,
      sellername: freezed == sellername
          ? _value.sellername
          : sellername // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerLoc: freezed == sellerLoc
          ? _value.sellerLoc
          : sellerLoc // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingModelImplCopyWith<$Res>
    implements $BookingModelCopyWith<$Res> {
  factory _$$BookingModelImplCopyWith(
          _$BookingModelImpl value, $Res Function(_$BookingModelImpl) then) =
      __$$BookingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bookingId,
      String? numberOfTable,
      String? numberOfSeat,
      String? time,
      String? sellerUid,
      String? sellername,
      String? sellerLoc,
      UserModel? user,
      String? date,
      @TimestampConverter() Timestamp? timestamp});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$BookingModelImplCopyWithImpl<$Res>
    extends _$BookingModelCopyWithImpl<$Res, _$BookingModelImpl>
    implements _$$BookingModelImplCopyWith<$Res> {
  __$$BookingModelImplCopyWithImpl(
      _$BookingModelImpl _value, $Res Function(_$BookingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? numberOfTable = freezed,
    Object? numberOfSeat = freezed,
    Object? time = freezed,
    Object? sellerUid = freezed,
    Object? sellername = freezed,
    Object? sellerLoc = freezed,
    Object? user = freezed,
    Object? date = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$BookingModelImpl(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfTable: freezed == numberOfTable
          ? _value.numberOfTable
          : numberOfTable // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfSeat: freezed == numberOfSeat
          ? _value.numberOfSeat
          : numberOfSeat // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerUid: freezed == sellerUid
          ? _value.sellerUid
          : sellerUid // ignore: cast_nullable_to_non_nullable
              as String?,
      sellername: freezed == sellername
          ? _value.sellername
          : sellername // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerLoc: freezed == sellerLoc
          ? _value.sellerLoc
          : sellerLoc // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingModelImpl implements _BookingModel {
  _$BookingModelImpl(
      {this.bookingId,
      this.numberOfTable,
      this.numberOfSeat,
      this.time,
      this.sellerUid,
      this.sellername,
      this.sellerLoc,
      this.user,
      this.date,
      @TimestampConverter() required this.timestamp});

  factory _$BookingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingModelImplFromJson(json);

  @override
  final String? bookingId;
  @override
  final String? numberOfTable;
  @override
  final String? numberOfSeat;
  @override
  final String? time;
  @override
  final String? sellerUid;
  @override
  final String? sellername;
  @override
  final String? sellerLoc;
  @override
  final UserModel? user;
  @override
  final String? date;
  @override
  @TimestampConverter()
  final Timestamp? timestamp;

  @override
  String toString() {
    return 'BookingModel(bookingId: $bookingId, numberOfTable: $numberOfTable, numberOfSeat: $numberOfSeat, time: $time, sellerUid: $sellerUid, sellername: $sellername, sellerLoc: $sellerLoc, user: $user, date: $date, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingModelImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.numberOfTable, numberOfTable) ||
                other.numberOfTable == numberOfTable) &&
            (identical(other.numberOfSeat, numberOfSeat) ||
                other.numberOfSeat == numberOfSeat) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.sellerUid, sellerUid) ||
                other.sellerUid == sellerUid) &&
            (identical(other.sellername, sellername) ||
                other.sellername == sellername) &&
            (identical(other.sellerLoc, sellerLoc) ||
                other.sellerLoc == sellerLoc) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingId,
      numberOfTable,
      numberOfSeat,
      time,
      sellerUid,
      sellername,
      sellerLoc,
      user,
      date,
      timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      __$$BookingModelImplCopyWithImpl<_$BookingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingModelImplToJson(
      this,
    );
  }
}

abstract class _BookingModel implements BookingModel {
  factory _BookingModel(
          {final String? bookingId,
          final String? numberOfTable,
          final String? numberOfSeat,
          final String? time,
          final String? sellerUid,
          final String? sellername,
          final String? sellerLoc,
          final UserModel? user,
          final String? date,
          @TimestampConverter() required final Timestamp? timestamp}) =
      _$BookingModelImpl;

  factory _BookingModel.fromJson(Map<String, dynamic> json) =
      _$BookingModelImpl.fromJson;

  @override
  String? get bookingId;
  @override
  String? get numberOfTable;
  @override
  String? get numberOfSeat;
  @override
  String? get time;
  @override
  String? get sellerUid;
  @override
  String? get sellername;
  @override
  String? get sellerLoc;
  @override
  UserModel? get user;
  @override
  String? get date;
  @override
  @TimestampConverter()
  Timestamp? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$BookingModelImplCopyWith<_$BookingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
