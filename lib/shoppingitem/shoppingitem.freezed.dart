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

 int? get id; String get title; bool get isCompleted;
/// Create a copy of Shoppingitem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingitemCopyWith<Shoppingitem> get copyWith => _$ShoppingitemCopyWithImpl<Shoppingitem>(this as Shoppingitem, _$identity);

  /// Serializes this Shoppingitem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shoppingitem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted);

@override
String toString() {
  return 'Shoppingitem(id: $id, title: $title, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $ShoppingitemCopyWith<$Res>  {
  factory $ShoppingitemCopyWith(Shoppingitem value, $Res Function(Shoppingitem) _then) = _$ShoppingitemCopyWithImpl;
@useResult
$Res call({
 int? id, String title, bool isCompleted
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String title,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shoppingitem() when $default != null:
return $default(_that.id,_that.title,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String title,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _Shoppingitem():
return $default(_that.id,_that.title,_that.isCompleted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String title,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _Shoppingitem() when $default != null:
return $default(_that.id,_that.title,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Shoppingitem implements Shoppingitem {
  const _Shoppingitem({this.id, required this.title, this.isCompleted = false});
  factory _Shoppingitem.fromJson(Map<String, dynamic> json) => _$ShoppingitemFromJson(json);

@override final  int? id;
@override final  String title;
@override@JsonKey() final  bool isCompleted;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shoppingitem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted);

@override
String toString() {
  return 'Shoppingitem(id: $id, title: $title, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$ShoppingitemCopyWith<$Res> implements $ShoppingitemCopyWith<$Res> {
  factory _$ShoppingitemCopyWith(_Shoppingitem value, $Res Function(_Shoppingitem) _then) = __$ShoppingitemCopyWithImpl;
@override @useResult
$Res call({
 int? id, String title, bool isCompleted
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? isCompleted = null,}) {
  return _then(_Shoppingitem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
