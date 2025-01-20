// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'cat.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

// Cat _$CatFromJson(Map<String, dynamic> json) {
//   return _Cat.fromJson(json);
// }

// /// @nodoc
// mixin _$Cat {
//   String get fact => throw _privateConstructorUsedError;

//   /// Serializes this Cat to a JSON map.
//   Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

//   /// Create a copy of Cat
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   $CatCopyWith<Cat> get copyWith => throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $CatCopyWith<$Res> {
//   factory $CatCopyWith(Cat value, $Res Function(Cat) then) =
//       _$CatCopyWithImpl<$Res, Cat>;
//   @useResult
//   $Res call({String fact});
// }

// /// @nodoc
// class _$CatCopyWithImpl<$Res, $Val extends Cat> implements $CatCopyWith<$Res> {
//   _$CatCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   /// Create a copy of Cat
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? fact = null,
//   }) {
//     return _then(_value.copyWith(
//       fact: null == fact
//           ? _value.fact
//           : fact // ignore: cast_nullable_to_non_nullable
//               as String,
//     ) as $Val);
//   }
// }

// /// @nodoc
// abstract class _$$CatImplCopyWith<$Res> implements $CatCopyWith<$Res> {
//   factory _$$CatImplCopyWith(_$CatImpl value, $Res Function(_$CatImpl) then) =
//       __$$CatImplCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call({String fact});
// }

// /// @nodoc
// class __$$CatImplCopyWithImpl<$Res> extends _$CatCopyWithImpl<$Res, _$CatImpl>
//     implements _$$CatImplCopyWith<$Res> {
//   __$$CatImplCopyWithImpl(_$CatImpl _value, $Res Function(_$CatImpl) _then)
//       : super(_value, _then);

//   /// Create a copy of Cat
//   /// with the given fields replaced by the non-null parameter values.
//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? fact = null,
//   }) {
//     return _then(_$CatImpl(
//       fact: null == fact
//           ? _value.fact
//           : fact // ignore: cast_nullable_to_non_nullable
//               as String,
//     ));
//   }
// }

// /// @nodoc
// @JsonSerializable()
// class _$CatImpl implements _Cat {
//   const _$CatImpl({required this.fact});

//   factory _$CatImpl.fromJson(Map<String, dynamic> json) =>
//       _$$CatImplFromJson(json);

//   @override
//   final String fact;

//   @override
//   String toString() {
//     return 'Cat(fact: $fact)';
//   }

//   @override
//   bool operator ==(Object other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$CatImpl &&
//             (identical(other.fact, fact) || other.fact == fact));
//   }

//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   int get hashCode => Object.hash(runtimeType, fact);

//   /// Create a copy of Cat
//   /// with the given fields replaced by the non-null parameter values.
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$CatImplCopyWith<_$CatImpl> get copyWith =>
//       __$$CatImplCopyWithImpl<_$CatImpl>(this, _$identity);

//   @override
//   Map<String, dynamic> toJson() {
//     return _$$CatImplToJson(
//       this,
//     );
//   }
// }

// abstract class _Cat implements Cat {
//   const factory _Cat({required final String fact}) = _$CatImpl;

//   factory _Cat.fromJson(Map<String, dynamic> json) = _$CatImpl.fromJson;

//   @override
//   String get fact;

//   /// Create a copy of Cat
//   /// with the given fields replaced by the non-null parameter values.
//   @override
//   @JsonKey(includeFromJson: false, includeToJson: false)
//   _$$CatImplCopyWith<_$CatImpl> get copyWith =>
//       throw _privateConstructorUsedError;
// }
