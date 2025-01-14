import 'package:country_clean_structure/core/network/interceptors/logger_interceptor.dart';
import 'package:country_clean_structure/data/data_source/country_api_service.dart';
import 'package:country_clean_structure/domain/repository/country_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/network/dio_client.dart';
import '../../domain/entity/country.dart';
import '../../injection.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryRepository repository;
  final DioClient dioClient;

  final int pageSize = 5; // Số dữ liệu mỗi trang
  int currentPage = 0; // Trang hiện tại (bắt đầu từ 0)
  List<Country> allCountries = []; // Tất cả dữ liệu đã tải
  List<Country> displayedCountries = []; // Dữ liệu hiện được hiển thị
  bool hasMore = true; // Kiểm tra nếu còn dữ liệu để tải thêm

  CountryCubit(this.repository, this.dioClient) : super(CountryInitial()) {
    fetchAllCountries();
  }

  Future<void> fetchAllCountries() async {
    emit(CountryLoading());

    final result = await repository.getCountries();

    result.fold(
      (failure) {
        final errorMessage = dioClient.errorMessage ?? "Lỗi đã xảy ra";
        emit(CountryError(dioClient, errorMessage));
      },
      (countries) {
        allCountries = countries; // Lưu toàn bộ dữ liệu từ API
        _loadPage(); // Hiển thị trang đầu tiên
      },
    );
  }

  void loadMore() {
    if (hasMore) {
      _loadPage();
    }
  }

  void _loadPage() {
    // Tính toán phạm vi dữ liệu cho trang tiếp theo
    final startIndex = currentPage * pageSize;
    final endIndex = startIndex + pageSize;

    // Lấy dữ liệu từ danh sách đã tải
    if (startIndex < allCountries.length) {
      final newCountries = allCountries.sublist(
        startIndex,
        endIndex > allCountries.length ? allCountries.length : endIndex,
      );

      displayedCountries.addAll(newCountries);
      currentPage++;

      if (endIndex >= allCountries.length) {
        hasMore = false; // Không còn dữ liệu để tải thêm
      }

      emit(CountryLoaded(displayedCountries));
    } else {
      hasMore = false;
    }
  }
}
