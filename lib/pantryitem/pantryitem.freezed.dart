// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pantryitem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PantryItem {

 int? get id; String get title; int get quantity; DateTime? get expirationDate;
/// Create a copy of PantryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PantryItemCopyWith<PantryItem> get copyWith => _$PantryItemCopyWithImpl<PantryItem>(this as PantryItem, _$identity);

  /// Serializes this PantryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PantryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,quantity,expirationDate);

@override
String toString() {
  return 'PantryItem(id: $id, title: $title, quantity: $quantity, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $PantryItemCopyWith<$Res>  {
  factory $PantryItemCopyWith(PantryItem value, $Res Function(PantryItem) _then) = _$PantryItemCopyWithImpl;
@useResult
$Res call({
 int? id, String title, int quantity, DateTime? expirationDate
});




}
/// @nodoc
class _$PantryItemCopyWithImpl<$Res>
    implements $PantryItemCopyWith<$Res> {
  _$PantryItemCopyWithImpl(this._self, this._then);

  final PantryItem _self;
  final $Res Function(PantryItem) _then;

/// Create a copy of PantryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? quantity = null,Object? expirationDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PantryItem].
extension PantryItemPatterns on PantryItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PantryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PantryItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PantryItem value)  $default,){
final _that = this;
switch (_that) {
case _PantryItem():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PantryItem value)?  $default,){
final _that = this;
switch (_that) {
case _PantryItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String title,  int quantity,  DateTime? expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PantryItem() when $default != null:
return $default(_that.id,_that.title,_that.quantity,_that.expirationDate);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String title,  int quantity,  DateTime? expirationDate)  $default,) {final _that = this;
switch (_that) {
case _PantryItem():
return $default(_that.id,_that.title,_that.quantity,_that.expirationDate);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String title,  int quantity,  DateTime? expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _PantryItem() when $default != null:
return $default(_that.id,_that.title,_that.quantity,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PantryItem implements PantryItem {
  const _PantryItem({this.id, required this.title, required this.quantity, this.expirationDate});
  factory _PantryItem.fromJson(Map<String, dynamic> json) => _$PantryItemFromJson(json);

@override final  int? id;
@override final  String title;
@override final  int quantity;
@override final  DateTime? expirationDate;

/// Create a copy of PantryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PantryItemCopyWith<_PantryItem> get copyWith => __$PantryItemCopyWithImpl<_PantryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PantryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PantryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,quantity,expirationDate);

@override
String toString() {
  return 'PantryItem(id: $id, title: $title, quantity: $quantity, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$PantryItemCopyWith<$Res> implements $PantryItemCopyWith<$Res> {
  factory _$PantryItemCopyWith(_PantryItem value, $Res Function(_PantryItem) _then) = __$PantryItemCopyWithImpl;
@override @useResult
$Res call({
 int? id, String title, int quantity, DateTime? expirationDate
});




}
/// @nodoc
class __$PantryItemCopyWithImpl<$Res>
    implements _$PantryItemCopyWith<$Res> {
  __$PantryItemCopyWithImpl(this._self, this._then);

  final _PantryItem _self;
  final $Res Function(_PantryItem) _then;

/// Create a copy of PantryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? quantity = null,Object? expirationDate = freezed,}) {
  return _then(_PantryItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,expirationDate: freezed == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
