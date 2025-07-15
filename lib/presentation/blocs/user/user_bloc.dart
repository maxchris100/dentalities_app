// import 'dart:async';
// import 'dart:convert';
// import 'package:jwt_decoder/jwt_decoder.dart';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:foriyana_app/data/data_sources/local/user_local_data_source.dart';
// import 'package:foriyana_app/data/models/user/agent_contribution_model.dart';
// import 'package:foriyana_app/domain/entities/user/agent_contribution.dart';
// import 'package:foriyana_app/domain/usecases/user/get_user_data_usecase.dart';
// import 'package:foriyana_app/domain/usecases/user/get_user_token.dart';
// import 'package:foriyana_app/domain/usecases/user/sign_out_usecase.dart';
// import 'package:foriyana_app/domain/usecases/user/sign_up_usecase.dart';
// import 'package:flutter/cupertino.dart';

// import '../../../core/error/failures.dart';
// import '../../../core/usecases/usecase.dart';
// import '../../../domain/entities/user/user.dart';
// import '../../../domain/usecases/user/get_cached_user_usecase.dart';
// import '../../../domain/usecases/user/sign_in_usecase.dart';

// part 'user_event.dart';
// part 'user_state.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   final GetCachedUserUseCase _getCachedUserUseCase;
//   final SignInUseCase _signInUseCase;
//   final SignUpUseCase _signUpUseCase;
//   final SignOutUseCase _signOutUseCase;
//   final GetUserToken _getUserToken;
//   final GetUserData _getUserData;
//   final AgentContributionUseCase _agentContributionUseCase;
//   // late final UserLocalDataSource _userLocalDataSource;

//   UserBloc(
//     this._signInUseCase,
//     this._getCachedUserUseCase,
//     this._signOutUseCase,
//     this._signUpUseCase,
//     this._getUserToken,
//     this._getUserData,
//     this._agentContributionUseCase,
//     // this._userLocalDataSource,
//   ) : super(UserInitial()) {
//     on<SignInUser>(_onSignIn);
//     on<SignUpUser>(_onSignUp);
//     on<CheckUser>(_onCheckUser);
//     on<SignOutUser>(_onSignOut);
//     on<UserToken>(_onUserToken);
//     on<UserData>(_onUserData);
//     on<LoadHomeReward>((event, emit) {
//       emit(HomeRewardState(totalContribution: 0, expectedCommission: 0)
//           as UserState);
//     });
//     on<GetAgentContribution>(_getUserContributionData);
//   }

//   void _getUserContributionData(
//       GetAgentContribution event, Emitter<UserState> emit) async {
//     try {
//       emit(UserLoading());

//       // ✅ Fetch token from local storage
//       // final token = await _userLocalDataSource.getToken();
//       // print("Token retrieved: $token");

//       // // ✅ Pass token to use case
//       // final result = await _agentContributionUseCase(token);
//       // print("result retrieved: $result");
//       // final Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

//       // Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
//       // print("decodedToken: $decodedToken");
//       // final user = AgentContributonModel.fromJson(decodedToken);
//       // emit(AgentContributionState(agentContribution: user));
//       // result.fold(
//       //   (failure) => emit(UserLoggedFail(failure)),
//       //   (contribution) => emit(AgentContributionState(agentContribution: user)),
//       // );
//     } catch (e, stacktrace) {
//       print("Error fetching contribution data: $e\n$stacktrace");
//       emit(UserLoggedFail(ExceptionFailure()));
//     }
//   }

//   void _onUserData(UserData event, Emitter<UserState> emit) async {
//     try {
//       emit(UserLoading());
//       final result = await _getUserData(NoParams());

//       result.fold(
//         (failure) => emit(UserLoggedFail(failure)),
//         (user) => emit(UserDataLoaded(user: user)),
//       );
//     } catch (e) {
//       emit(UserLoggedFail(ExceptionFailure()));
//     }
//   }

//   void _onSignIn(SignInUser event, Emitter<UserState> emit) async {
//     try {
//       emit(UserLoading());
//       final result = await _signInUseCase(event.params);
//       result.fold(
//         (failure) => emit(UserLoggedFail(failure)),
//         (user) => emit(UserLogged(user)),
//       );
//     } catch (e) {
//       emit(UserLoggedFail(ExceptionFailure()));
//     }
//   }

//   void _onCheckUser(CheckUser event, Emitter<UserState> emit) async {
//     try {
//       emit(UserLoading());
//       final result = await _getCachedUserUseCase(NoParams());

//       result.fold(
//         (failure) => emit(UserLoggedFail(failure)),
//         (user) => emit(UserLogged(user)),
//       );
//     } catch (e) {
//       emit(UserLoggedFail(ExceptionFailure()));
//     }
//   }

//   void _onUserToken(UserToken event, Emitter<UserState> emit) async {
//     try {
//       emit(UserLoading());
//       final result = await _getUserToken(NoParams());
//       result.fold(
//         (failure) => emit(UserLoggedFail(failure)),
//         (user) => emit(UserLogged(user)),
//       );
//     } catch (e) {
//       emit(UserLoggedFail(ExceptionFailure()));
//     }
//   }

//   FutureOr<void> _onSignUp(SignUpUser event, Emitter<UserState> emit) async {
//     try {
//       emit(UserLoading());
//       final result = await _signUpUseCase(event.params);
//       result.fold(
//         (failure) => emit(UserLoggedFail(failure)),
//         (user) => emit(UserLogged(user)),
//       );
//     } catch (e) {
//       emit(UserLoggedFail(ExceptionFailure()));
//     }
//   }

//   void _onSignOut(SignOutUser event, Emitter<UserState> emit) async {
//     try {
//       emit(UserLoading());
//       await _signOutUseCase(NoParams());
//       emit(UserLoggedOut());
//     } catch (e) {
//       emit(UserLoggedFail(ExceptionFailure()));
//     }
//   }
// }
