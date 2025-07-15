import 'package:bloc/bloc.dart';
import 'package:foriyana_app/data/data_sources/user_local_data_source.dart';
import 'package:foriyana_app/domain/repositories/profile_repository.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoaded<T> extends NotificationState {
  final List<NotificationResponseModel> notifications;

  NotificationLoaded(this.notifications);
}

class NotificationResponseModel {}

class NotificationError extends NotificationState {
  final String message;

  NotificationError(this.message);
}

class NotificationRefresh extends NotificationState {
  final List<NotificationResponseModel> refreshedNotifications;

  NotificationRefresh(this.refreshedNotifications);
}

class NotificationCubit<T> extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  // Method to fetch notifications (simulated for this example)
  Future<void> fetchNotifications() async {
    try {
      emit(NotificationInitial()); // Set initial state before fetching data
      String channel = UserLocalDataSource.userData?.channel ?? "";
      var response = await ProfileRepository.getDownline(channel);
      if (response.statusCode == 200) {
        List<NotificationResponseModel> res = [];
        // response.data
        //     .forEach((item) => res.add(NotificationResponseModel.fromJson(item)));

        emit(
          NotificationLoaded<T>(res),
        ); // Emit the loaded state with notifications
      } else {
        emit(
          NotificationError('Failed to load notifications:'),
        ); // Emit error state if the API fails
      }
    } catch (e) {
      emit(
        NotificationError('Failed to load notifications: $e'),
      ); // Emit error state if the API fails
    }
  }
}
