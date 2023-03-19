import 'package:equatable/equatable.dart';
import 'package:personal_web_site/res.dart';

class MenuModel extends Equatable {
  final String iconPath;
  final String text;

  const MenuModel({
    required this.iconPath,
    required this.text,
  });

  @override
  List<Object> get props => [
        iconPath,
        text,
      ];
}

List<MenuModel> menuList = [
  const MenuModel(
    iconPath: Res.Home_icon,
    text: 'Home',
  ),
  const MenuModel(
    iconPath: Res.menu_icon,
    text: 'Menu',
  ),
  const MenuModel(
    iconPath: Res.hart_icon,
    text: 'Favorites',
  ),
  const MenuModel(
    iconPath: Res.settings_icon,
    text: 'Settings',
  ),
];
