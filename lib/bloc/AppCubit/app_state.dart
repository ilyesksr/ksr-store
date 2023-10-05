part of 'app_cubit.dart';

class AppState {}

final class AppInitial extends AppState {
  final int pageIndex = 0;
}

final class ChangeIndex extends AppState {}

final class ChangeTheme extends AppState {}

final class ConnectedState extends AppState {}

final class ConnectedRestoredState extends AppState {}

final class NotConnectedState extends AppState {}
