// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get_it/get_it.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:foriyana_app/data/data_sources/local/user_local_data_source.dart';
// import 'package:foriyana_app/data/models/user/profile_response_model.dart';
// import 'package:foriyana_app/domain/entities/user/user.dart';
// import 'package:foriyana_app/domain/repositories/profile_repository.dart';
// import 'package:foriyana_app/presentation/blocs/user/user_bloc.dart';

// // Base class for all states
// @immutable
// abstract class DataState {}

// // Initial state (when nothing has been loaded yet)
// class DataInitial extends DataState {}

// // Data loaded state (when data is successfully fetched)
// class DataLoaded<T> extends DataState {
//   final T data;

//   DataLoaded(this.data);
// }

// // Data error state (when an error occurs during data fetching)
// class DataError extends DataState {
//   final String message;

//   DataError(this.message);
// }

// class HomeCubit<T> extends Cubit<DataState> {
//   HomeCubit() : super(DataInitial()); // Initial state is DataInitial

//   // Fetch data method (simulated)
//   Future<void> fetchData() async {
//     try {
//       emit(DataInitial()); // Emit initial state before data loading
//       var data =
//           await getProfile(); // Fetch data (replace with actual API call)
//       emit(DataLoaded<T>(data)); // Emit loaded data state on success
//     } catch (e) {
//       emit(
//           DataError('Failed to fetch data: $e')); // Emit error state on failure
//     }
//   }

//   Future<T?> getProfile() async {
//     try {
//       String channel = UserLocalDataSource.userData?.channel ?? "";
//       var response = await ProfileRepository.getProfile(channel);

//       if (response.statusCode == 200) {
//         var res = ProfileResponseModel.fromJson(response.data);
//         return res;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       return null;
//     }
//   }
// }

// // class HomeCubit extends Cubit<HomeState> {
// //   HomeCubit() : super(HomeState.loading);

// //   Future<void> getProfile() async {
// //     try {
// //       String channel = UserLocalDataSource.userData?.channel ?? "";
// //       var response = await ProfileRepository.getProfile(channel);

// //       if (response.statusCode == 200) {
// //         ProfileResponseModel res = ProfileResponseModel.fromJson(response.data);
// //       } else {
// //         emit(HomeState.normal);
// //       }
// //     } catch (e) {
// //       emit(HomeState.normal);
// //     }
// //   }
// // }
