import 'package:country_clean_structure/presentation/cubit/country_cubit.dart';
import 'package:country_clean_structure/presentation/page/widgets/card_country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Tải thêm dữ liệu khi cuộn đến cuối danh sách
      context.read<CountryCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách các quốc gia'),
      ),
      body: Center(
        child: BlocBuilder<CountryCubit, CountryState>(
          builder: (context, state) {
            if (state is CountryInitial || state is CountryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CountryLoaded) {
              return RefreshIndicator(
                displacement: 10,
                onRefresh: () async {
                  // Làm mới danh sách
                  context.read<CountryCubit>().fetchAllCountries();
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.countries.length + 1, // Thêm 1 để hiển thị loading khi load more
                  itemBuilder: (context, index) {
                    if (index < state.countries.length) {
                      final country = state.countries[index];
                      return Column(
                        children: [
                          CardWidget(country: country),
                          const SizedBox(height: 16),
                        ],
                      );
                    } else {
                      // Hiển thị loading indicator khi đang tải thêm
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
              );
            } else if (state is CountryError) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const Center(
                child: Text('Không có dữ liệu'),
              );
            }
          },
        ),
      ),
    );
  }
}
