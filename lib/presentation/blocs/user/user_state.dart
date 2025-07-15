// part of 'user_bloc.dart';

// @immutable
// abstract class UserState extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// class UserInitial extends UserState {}

// class UserLoading extends UserState {}

// class UserLogged extends UserState {
//   final User user;
//   UserLogged(this.user);

//   @override
//   List<Object> get props => [user];
// }

// class UserLoggedFail extends UserState {
//   final Failure failure;
//   UserLoggedFail(this.failure);

//   @override
//   List<Object> get props => [failure];
// }

// class UserLoggedOut extends UserState {}

// class UserDataLoaded extends UserState {
//   final User user;
//   final String? name;

//   UserDataLoaded({required this.user, this.name});
//   // : name = user.name!.isNotEmpty ? user.name : "Guest";

//   @override
//   List<Object> get props => [user];
// }

// class HomeRewardState extends UserState {
//   final int totalContribution;
//   final int expectedCommission;
//   HomeRewardState({
//     this.totalContribution = 0,
//     this.expectedCommission = 0,
//   });
// }

// class AgentContributionState extends UserState {
//   final AgentContribution agentContribution;

//   AgentContributionState({
//     required this.agentContribution,
//   });

//   @override
//   List<Object> get props => [agentContribution];
// }
