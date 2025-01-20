import 'package:cat_image_clean_architecture/core/network/dio_client.dart';
import 'package:cat_image_clean_architecture/domain/entity/cat_image.dart';
import 'package:cat_image_clean_architecture/domain/usecase/get_cat_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repository/cat_image_repository.dart';

part 'cat_image_state.dart';

class CatImageCubit extends Cubit<CatImageState> {
  final CatImageRepository catImageRepository;

  CatImageCubit(this.catImageRepository) : super(CatImageInitial());

  Future<void> fetchCatImages() async {
    emit(CatImageLoading());
    final result = await catImageRepository.getCatImages();

    result.fold(
      (failure) => emit(CatImageError(DioClient())),
      (catImages) => emit(CatImageLoaded(catImages)),
    );
  }
}
