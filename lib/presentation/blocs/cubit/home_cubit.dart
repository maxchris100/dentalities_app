import 'package:dentalities/core/constant/constant.dart';
import 'package:dentalities/data/models/banner_model.dart';
import 'package:dentalities/data/models/brand_model.dart';
import 'package:dentalities/data/models/category_model.dart';
import 'package:dentalities/data/models/country_model.dart';
import 'package:dentalities/data/models/product_model.dart';
import 'package:dentalities/data/models/testimony_model.dart';
import 'package:dentalities/data/models/user_address_model.dart';
import 'package:dentalities/data/models/user_model.dart';
import 'package:dentalities/domain/repositories/home_repository.dart';
import 'package:dentalities/domain/repositories/product_repository.dart';
import 'package:dentalities/domain/repositories/profile_repository.dart';
import 'package:dio/src/response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class HomeData {
  int selectedIndex;
  final List<Category> featureCategories;
  final List<dynamic> topDoctors;
  final List<Banner> banners;
  final List<Category> carouselFeatureCategories;

  final List<Testimony> testimonies;
  final List<Product> recommendedProducts;
  final List<Product> newArrival;
  final List<Country> countries;
  final List<Brand> brands;
  final List<Category> categories;
  final List<Category> specializations;

  HomeData(
      {this.selectedIndex = 0,
      required this.featureCategories,
      required this.topDoctors,
      required this.banners,
      required this.carouselFeatureCategories,
      required this.testimonies,
      required this.recommendedProducts,
      required this.newArrival,
      required this.countries,
      required this.brands,
      required this.categories,
      required this.specializations});

  HomeData copyWith({
    int? selectedIndex,
    List<Category>? featureCategories,
    List<Banner>? banners,
    List<Category>? carouselFeatureCategories,
    List<Testimony>? testimonies,
    List<dynamic>? topDoctors,
    List<Product>? recommendedProducts,
    List<Product>? newArrival,
    List<Brand>? brands,
    List<Country>? countries,
    List<Category>? categories,
    List<Category>? specializations,
  }) {
    return HomeData(
        selectedIndex: selectedIndex ?? 0,
        featureCategories: featureCategories ?? this.featureCategories,
        banners: banners ?? this.banners,
        carouselFeatureCategories:
            carouselFeatureCategories ?? this.carouselFeatureCategories,
        testimonies: testimonies ?? this.testimonies,
        topDoctors: topDoctors ?? this.topDoctors,
        recommendedProducts: recommendedProducts ?? this.recommendedProducts,
        newArrival: newArrival ?? this.newArrival,
        brands: brands ?? this.brands,
        countries: countries ?? this.countries,
        categories: categories ?? this.categories,
        specializations: specializations ?? this.specializations);
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
      carouselFeatureCategories: [],
      testimonies: [],
      recommendedProducts: [],
      newArrival: [],
      topDoctors: [],
      categories: [],
      specializations: [],
      brands: [],
      countries: []);
  HomeCubit() : super(HomeInitial());
  void setIndex(int index) {
    data = data.copyWith(selectedIndex: index);
    emit(HomeLoaded(data));
  }

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
      List<Category> specialization =
          Category.fromList(datas.data["data"]["specializations"]);
      data = data.copyWith(
          // brands: brands,
          categories: categories,
          countries: countries,
          specializations: specialization);
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

  Future<void> fetchCarouselFeatureCategories() async {
    try {
      final banners = await HomeRepository.getCarouselFeaturedCategories();
      List<Category> list =
          Category.fromList(banners.data["data"]['categories']);
      data = data.copyWith(carouselFeatureCategories: list);
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError('Failed to load carouselFeatureCategories: $e'));
    }
  }

  Future<void> fetchNewArrival() async {
    try {
      final res = await ProductRepository.searchProducts(newArrival: 1);
      List<Product> list = Product.fromList(res.data["data"]["products"]);
      data = data.copyWith(newArrival: list);
      emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError('Failed to load new arrival: $e'));
    }
  }

  Future<void> fetchBrands() async {
    try {
      final brands = await HomeRepository.getBrands();
      List<Brand> list = Brand.fromList(brands.data["data"]);
      data = data.copyWith(brands: list);
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

      // Constant.userLocalDataSource.saveUser(data);

      // final defaultAddress = await ProfileRepository.getDefaultAddress();
      // UserAddress userAddress =
      //     UserAddress.fromJson(defaultAddress.data["data"]);
      // Constant.userLocalDataSource.setDefaultAddress(userAddress);
      final addressResponse = await ProfileRepository.getUserAddress();

// parse default address
      UserAddress defaultAddress = UserAddress.fromJson(
        addressResponse.data["data"]["default_user_address"],
      );

// parse user addresses list
      List<UserAddress> userAddresses = UserAddress.fromList(
        addressResponse.data["data"]["user_addresses"],
      );

// filter duplikat (buang yang sama id dengan default)
      List<UserAddress> filteredAddresses =
          userAddresses.where((addr) => addr.id != defaultAddress.id).toList();

// gabung: defaultAddress di index 0
      List<UserAddress> mergedAddresses = [
        defaultAddress,
        ...filteredAddresses
      ];

// simpan ke local / state
      data.userAddresses = mergedAddresses;
      Constant.userLocalDataSource.setDefaultAddress(defaultAddress);
      Constant.userLocalDataSource.saveUser(data);
      // emit(HomeLoaded(data));
    } catch (e) {
      emit(HomeError('Failed to load profile: $e'));
    }
  }

  init() {
    // fetchFeatureCategories();
    fetchCarouselFeatureCategories();
    fetchMenuList();
    fetchBanners();
    fetchBrands();
    fetchTestimonial();
    fetchProfile();
    fetchNewArrival();
  }
}
