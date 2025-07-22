import 'package:dentalities/data/models/banner_model.dart';
import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/domain/repositories/home_repository.dart';
import 'package:dio/src/response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../widgets/product_model.dart';

class HomeData {
  final List<Category> featureCategories;
  final List<dynamic> topDoctors;
  final List<Banner> banners;
  final List<Product> recommendedProducts;

  HomeData({
    required this.featureCategories,
    required this.topDoctors,
    required this.banners,
    required this.recommendedProducts,
  });

  HomeData copyWith({
    List<Category>? featureCategories,
    List<Banner>? banners,
    List<dynamic>? topDoctors,
    List<Product>? recommendedProducts,
  }) {
    return HomeData(
      featureCategories: featureCategories ?? this.featureCategories,
      banners: banners ?? this.banners,
      topDoctors: topDoctors ?? this.topDoctors,
      recommendedProducts: recommendedProducts ?? this.recommendedProducts,
    );
  }
}

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeData data;
  HomeLoaded(this.data);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

class HomeCubit extends Cubit<HomeState> {
  HomeData data = HomeData(
      featureCategories: [],
      banners: [],
      recommendedProducts: [],
      topDoctors: []);
  HomeCubit() : super(HomeInitial());

  Future<void> fetchFeatureCategories() async {
    try {
      final categories = await HomeRepository.getFeatureCategories();
      List<Category> list =
          Category.fromList(categories.data["data"]["categories"]);
      data = data.copyWith(featureCategories: list);
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError('Failed to load categories: $e'));
    }
  }

  Future<void> fetchBanners() async {
    try {
      final banners = await HomeRepository.getBanners();
      List<Banner> list = Banner.fromList(banners.data["data"]);
      data = data.copyWith(banners: list);
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError('Failed to load banners: $e'));
    }
  }

  Future<void> fetchTopDoctors() async {
    try {
      // final doctors = await HomeRepository.getTopDoctors();
      // data = data.copyWith(topDoctors: doctors);
      // emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError('Failed to load doctors: $e'));
    }
  }

  Future<void> fetchRecommendedProducts() async {
    try {
      // final products = await HomeRepository.getRecommendedProducts();
      // data = data.copyWith(recommendedProducts: products);
      // emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError('Failed to load products: $e'));
    }
  }

  init() {
    fetchFeatureCategories();
    fetchBanners();
  }
}
