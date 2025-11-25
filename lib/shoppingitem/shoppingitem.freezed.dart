// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shoppingitem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Shoppingitem {

 int? get id; int? get listId; String get title; int? get quantity; bool get isPurchased;
/// Create a copy of Shoppingitem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingitemCopyWith<Shoppingitem> get copyWith => _$ShoppingitemCopyWithImpl<Shoppingitem>(this as Shoppingitem, _$identity);

  /// Serializes this Shoppingitem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shoppingitem&&(identical(other.id, id) || other.id == id)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.title, title) || other.title == title)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isPurchased, isPurchased) || other.isPurchased == isPurchased));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listId,title,quantity,isPurchased);

@override
String toString() {
  return 'Shoppingitem(id: $id, listId: $listId, title: $title, quantity: $quantity, isPurchased: $isPurchased)';
}


}

/// @nodoc
abstract mixin class $ShoppingitemCopyWith<$Res>  {
  factory $ShoppingitemCopyWith(Shoppingitem value, $Res Function(Shoppingitem) _then) = _$ShoppingitemCopyWithImpl;
@useResult
$Res call({
 int? id, int? listId, String title, int? quantity, bool isPurchased
});




}
/// @nodoc
class _$ShoppingitemCopyWithImpl<$Res>
    implements $ShoppingitemCopyWith<$Res> {
  _$ShoppingitemCopyWithImpl(this._self, this._then);

  final Shoppingitem _self;
  final $Res Function(Shoppingitem) _then;

/// Create a copy of Shoppingitem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? listId = freezed,Object? title = null,Object? quantity = freezed,Object? isPurchased = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,listId: freezed == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,isPurchased: null == isPurchased ? _self.isPurchased : isPurchased // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Shoppingitem].
extension ShoppingitemPatterns on Shoppingitem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shoppingitem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shoppingitem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shoppingitem value)  $default,){
final _that = this;
switch (_that) {
case _Shoppingitem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shoppingitem value)?  $default,){
final _that = this;
switch (_that) {
case _Shoppingitem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? listId,  String title,  int? quantity,  bool isPurchased)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shoppingitem() when $default != null:
return $default(_that.id,_that.listId,_that.title,_that.quantity,_that.isPurchased);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? listId,  String title,  int? quantity,  bool isPurchased)  $default,) {final _that = this;
switch (_that) {
case _Shoppingitem():
return $default(_that.id,_that.listId,_that.title,_that.quantity,_that.isPurchased);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? listId,  String title,  int? quantity,  bool isPurchased)?  $default,) {final _that = this;
switch (_that) {
case _Shoppingitem() when $default != null:
return $default(_that.id,_that.listId,_that.title,_that.quantity,_that.isPurchased);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Shoppingitem implements Shoppingitem {
  const _Shoppingitem({this.id, this.listId, required this.title, this.quantity, this.isPurchased = false});
  factory _Shoppingitem.fromJson(Map<String, dynamic> json) => _$ShoppingitemFromJson(json);

@override final  int? id;
@override final  int? listId;
@override final  String title;
@override final  int? quantity;
@override@JsonKey() final  bool isPurchased;

/// Create a copy of Shoppingitem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingitemCopyWith<_Shoppingitem> get copyWith => __$ShoppingitemCopyWithImpl<_Shoppingitem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppingitemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shoppingitem&&(identical(other.id, id) || other.id == id)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.title, title) || other.title == title)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.isPurchased, isPurchased) || other.isPurchased == isPurchased));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listId,title,quantity,isPurchased);

@override
String toString() {
  return 'Shoppingitem(id: $id, listId: $listId, title: $title, quantity: $quantity, isPurchased: $isPurchased)';
}


}

/// @nodoc
abstract mixin class _$ShoppingitemCopyWith<$Res> implements $ShoppingitemCopyWith<$Res> {
  factory _$ShoppingitemCopyWith(_Shoppingitem value, $Res Function(_Shoppingitem) _then) = __$ShoppingitemCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? listId, String title, int? quantity, bool isPurchased
});




}
/// @nodoc
class __$ShoppingitemCopyWithImpl<$Res>
    implements _$ShoppingitemCopyWith<$Res> {
  __$ShoppingitemCopyWithImpl(this._self, this._then);

  final _Shoppingitem _self;
  final $Res Function(_Shoppingitem) _then;

/// Create a copy of Shoppingitem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? listId = freezed,Object? title = null,Object? quantity = freezed,Object? isPurchased = null,}) {
  return _then(_Shoppingitem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,listId: freezed == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,isPurchased: null == isPurchased ? _self.isPurchased : isPurchased // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
