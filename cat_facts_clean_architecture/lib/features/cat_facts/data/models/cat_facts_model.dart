import 'package:cat_facts_clean_architecture/features/cat_facts/domain/entities/cat_facts.dart';

class CatFactsModel extends CatFacts {
  const CatFactsModel(super.fact);

  factory CatFactsModel.fromJson(Map<String, dynamic> json) {
    return CatFactsModel(json['data'][0]);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': [fact]
    };
  }
}
