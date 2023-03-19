part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  final int menuCurrentIndex;

  const AppState({
    this.menuCurrentIndex = 0,
  });

  @override
  List<Object> get props => [menuCurrentIndex];


}

class AppInitial extends AppState {}

class MenuCurrentIndexState extends AppState {
  const MenuCurrentIndexState({required int index}) : super(menuCurrentIndex: index);
}
