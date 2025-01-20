import 'package:test_thing/domain/entity/cat_fact.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'cat.freezed.dart';
// part 'cat.g.dart';

// @freezed
// class Cat with _$Cat {
//   const factory Cat({
//     required String fact,
//   }) = _Cat;

//   factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);
// }

class Cat {
  final String fact;
  const Cat({required this.fact});

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(fact: json['data'][0] ?? '');
  }

  CatFact toCatFact() {
    return CatFact(fact);
  }
}
