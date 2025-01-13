import 'package:cat_image_clean_architecture/domain/entity/cat_image.dart';

class CatImageModel {
  final String id;
  final String url;

  const CatImageModel({
    required this.id,
    required this.url,
  });

  // Factory để tạo đối tượng từ JSON
  factory CatImageModel.fromJson(Map<String, dynamic> json) {
    return CatImageModel(
      id: json['id'] ?? '',
      url: json['url'] ?? '',
    );
  }

  // Getter trả về dữ liệu dưới dạng Map<String, dynamic>
  Map<String, dynamic> get data {
    return {
      'id': id,
      'url': url,
    };
  }

  // Ánh xạ từ Model sang Entity
  CatImage toEntity() {
    return CatImage(url);
  }
}
