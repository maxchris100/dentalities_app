import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/data/models/banner_model.dart';
import 'package:dentalities/data/models/brand_model.dart';
import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/data/models/country_model.dart';
import 'package:dentalities/data/models/testimony_model.dart';
import 'package:dentalities/data/models/user_model.dart';
import 'package:dentalities/domain/repositories/home_repository.dart';
import 'package:dentalities/domain/repositories/profile_repository.dart';
import 'package:dio/src/response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../widgets/product_model.dart';

class HomeData {
  final List<Category> featureCategories;
  final List<dynamic> topDoctors;
  final List<Banner> banners;
  final List<Testimony> testimonies;
  final List<Product> recommendedProducts;
  final List<Country> countries;
  final List<Brand> brands;
  final List<Category> categories;

  HomeData(
      {required this.featureCategories,
      required this.topDoctors,
      required this.banners,
      required this.testimonies,
      required this.recommendedProducts,
      required this.countries,
      required this.brands,
      required this.categories});

  HomeData copyWith({
    List<Category>? featureCategories,
    List<Banner>? banners,
    List<Testimony>? testimonies,
    List<dynamic>? topDoctors,
    List<Product>? recommendedProducts,
    List<Brand>? brands,
    List<Country>? countries,
    List<Category>? categories,
  }) {
    return HomeData(
        featureCategories: featureCategories ?? this.featureCategories,
        banners: banners ?? this.banners,
        testimonies: testimonies ?? this.testimonies,
        topDoctors: topDoctors ?? this.topDoctors,
        recommendedProducts: recommendedProducts ?? this.recommendedProducts,
        brands: brands ?? this.brands,
        countries: countries ?? this.countries,
        categories: categories ?? this.categories);
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
      testimonies: [],
      recommendedProducts: [],
      topDoctors: [],
      categories: [],
      brands: [],
      countries: []);
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

  Future<void> fetchMenuList() async {
    try {
      final datas = await HomeRepository.getListMenu();
      List<Brand> brands = Brand.fromList(datas.data["data"]["brands"]);
      List<Category> categories =
          Category.fromList(datas.data["data"]["categories"]);
      List<Country> countries = Country.fromList(datas.data["data"]["origins"]);
      data = data.copyWith(
          brands: brands, categories: categories, countries: countries);
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError('Failed to load banners: $e'));
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

  Future<void> fetchTestimonial() async {
    try {
      final datas = await HomeRepository.getTestimonial();
      List<Testimony> list = Testimony.fromList(datas.data["data"]);
      data = data.copyWith(testimonies: list);
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

  Future<void> fetchProfile() async {
    try {
      final datas = await ProfileRepository.getProfile();
      UserModel data = UserModel.fromMap(datas.data["data"]);

      Constant.userLocalDataSource.saveUser(data);
      // emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError('Failed to load profile: $e'));
    }
  }

  init() {
    fetchFeatureCategories();
    fetchMenuList();
    fetchBanners();
    fetchTestimonial();
    fetchProfile();
  }
}
