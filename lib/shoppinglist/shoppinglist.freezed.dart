// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shoppinglist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Shoppinglist {

 int? get id; String get title; bool get isCompleted;
/// Create a copy of Shoppinglist
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppinglistCopyWith<Shoppinglist> get copyWith => _$ShoppinglistCopyWithImpl<Shoppinglist>(this as Shoppinglist, _$identity);

  /// Serializes this Shoppinglist to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shoppinglist&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted);

@override
String toString() {
  return 'Shoppinglist(id: $id, title: $title, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $ShoppinglistCopyWith<$Res>  {
  factory $ShoppinglistCopyWith(Shoppinglist value, $Res Function(Shoppinglist) _then) = _$ShoppinglistCopyWithImpl;
@useResult
$Res call({
 int? id, String title, bool isCompleted
});




}
/// @nodoc
class _$ShoppinglistCopyWithImpl<$Res>
    implements $ShoppinglistCopyWith<$Res> {
  _$ShoppinglistCopyWithImpl(this._self, this._then);

  final Shoppinglist _self;
  final $Res Function(Shoppinglist) _then;

/// Create a copy of Shoppinglist
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


/// Adds pattern-matching-related methods to [Shoppinglist].
extension ShoppinglistPatterns on Shoppinglist {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shoppinglist value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shoppinglist() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shoppinglist value)  $default,){
final _that = this;
switch (_that) {
case _Shoppinglist():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shoppinglist value)?  $default,){
final _that = this;
switch (_that) {
case _Shoppinglist() when $default != null:
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
case _Shoppinglist() when $default != null:
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
case _Shoppinglist():
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
case _Shoppinglist() when $default != null:
return $default(_that.id,_that.title,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Shoppinglist implements Shoppinglist {
  const _Shoppinglist({this.id, required this.title, this.isCompleted = false});
  factory _Shoppinglist.fromJson(Map<String, dynamic> json) => _$ShoppinglistFromJson(json);

@override final  int? id;
@override final  String title;
@override@JsonKey() final  bool isCompleted;

/// Create a copy of Shoppinglist
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppinglistCopyWith<_Shoppinglist> get copyWith => __$ShoppinglistCopyWithImpl<_Shoppinglist>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShoppinglistToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shoppinglist&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted);

@override
String toString() {
  return 'Shoppinglist(id: $id, title: $title, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$ShoppinglistCopyWith<$Res> implements $ShoppinglistCopyWith<$Res> {
  factory _$ShoppinglistCopyWith(_Shoppinglist value, $Res Function(_Shoppinglist) _then) = __$ShoppinglistCopyWithImpl;
@override @useResult
$Res call({
 int? id, String title, bool isCompleted
});




}
/// @nodoc
class __$ShoppinglistCopyWithImpl<$Res>
    implements _$ShoppinglistCopyWith<$Res> {
  __$ShoppinglistCopyWithImpl(this._self, this._then);

  final _Shoppinglist _self;
  final $Res Function(_Shoppinglist) _then;

/// Create a copy of Shoppinglist
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? isCompleted = null,}) {
  return _then(_Shoppinglist(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
