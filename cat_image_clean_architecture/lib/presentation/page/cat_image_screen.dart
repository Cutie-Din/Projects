import 'package:cat_image_clean_architecture/core/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:cat_image_clean_architecture/presentation/cubit/cat_image_cubit.dart';

class CatImageScreen extends StatelessWidget {
  const CatImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách ảnh mèo'),
        actions: [
          BlocBuilder<CatImageCubit, CatImageState>(
            builder: (context, state) {
              // Chỉ hiển thị nút Refresh nếu trạng thái là CatImageLoaded
              if (state is CatImageLoaded) {
                return IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () =>
                      context.read<CatImageCubit>().fetchCatImages(), // Gọi lại API để lấy ảnh mới
                );
              }
              return SizedBox(); // Nếu không phải trạng thái Loaded thì không hiển thị gì
            },
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CatImageCubit, CatImageState>(
          builder: (context, state) {
            if (state is CatImageInitial) {
              return ElevatedButton(
                onPressed: () => context.read<CatImageCubit>().fetchCatImages(),
                child: Text('Lấy ảnh'),
              );
            } else if (state is CatImageLoading) {
              return Lottie.asset(AppImage.loading);
            } else if (state is CatImageLoaded) {
              return ListView.builder(
                itemCount: state.catImages.length,
                itemBuilder: (context, index) {
                  final catImage = state.catImages[index];
                  return Column(
                    children: [
                      Image.network(
                        catImage.url,
                      ),
                      SizedBox(height: 16), // Giãn cách giữa các ảnh
                    ],
                  );
                },
              );
            } else if (state is CatImageError) {
              return Text(state.message);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
