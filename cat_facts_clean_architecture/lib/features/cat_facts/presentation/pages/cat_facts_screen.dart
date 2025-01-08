import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/image_constants.dart';
import '../cubit/cat_facts_cubit.dart';

class CatFactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: BlocBuilder<CatFactsCubit, CatFactsState>(
              builder: (context, state) {
                if (state is CatFactsLoading) {
                  return Center(
                    child: LottieBuilder.asset(AppImage.loading),
                  );
                } else if (state is CatFactsLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.facts.fact,
                        textAlign: TextAlign.center,
                      ),
                      LottieBuilder.asset(AppImage.loaded),
                    ],
                  );
                } else if (state is CatFactsError) {
                  return Text(state.message);
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
                onPressed: () => context.read<CatFactsCubit>().fetchCatFacts(),
                child: Icon(Icons.refresh),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
