import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  int pageIndex = 0;
  bool isDark = false;
  bool isConnectionRestored = false;
  late StreamSubscription _subscription;
  AppCubit() : super(AppInitial());
  void changeBottomBarIndex(int index) {
    pageIndex = index;
    emit(ChangeIndex());
  }

  void toggleTheme() {
    isDark = !isDark;
    emit(ChangeTheme());
  }

  void checkConnectivity() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (!(result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile)) {
        emit(NotConnectedState());
      } else if (isConnectionRestored) {
        emit(ConnectedRestoredState());
      } else {
        isConnectionRestored = true;
        emit(ConnectedState());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
