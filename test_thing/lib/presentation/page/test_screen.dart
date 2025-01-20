import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:test_thing/core/utils/image_constants.dart';
import 'package:test_thing/presentation/cubit/test_cubit.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: BlocBuilder<TestCubit, TestState>(
              builder: (context, state) {
                if (state is TestLoading) {
                  return Center(
                    child: LottieBuilder.asset(AppImage.loading),
                  );
                } else if (state is TestLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.fact.fact,
                        textAlign: TextAlign.center,
                      ),
                      LottieBuilder.asset(AppImage.loaded),
                    ],
                  );
                } else if (state is TestError) {
                  return Text(state.errorMessage);
                }
                return Text("Nhấn nút để biết thêm!");
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16), // Khoảng cách từ đáy màn hình
              child: FloatingActionButton(
                onPressed: () => context.read<TestCubit>().fetchCatFact(),
                child: Icon(Icons.refresh),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
