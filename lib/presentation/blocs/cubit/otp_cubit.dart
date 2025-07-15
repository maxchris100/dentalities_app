import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

enum OtpState { initial, loading, normal }

class OtpCubit extends Cubit<int> {
  static const int _startTime = 60;
  Timer? _timer;

  OtpCubit() : super(_startTime);

  void startTimer() {
    emit(_startTime);
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state > 0) {
        emit(state - 1);
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    emit(_startTime);
    startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
