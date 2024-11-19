import 'package:rive/rive.dart';
import 'package:technest/blocks/rivemodel.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({
    required this.title,
    required this.rive,
  });
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(
    title: 'Notifications',
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
    ),
  ),
  NavItemModel(
    title: 'Search',
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
    ),
  ),
  NavItemModel(
    title: 'Home',
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "HOME",
      stateMachineName: "HOME_Interactivity",
    ),
  ),
  NavItemModel(
    title: 'Wishlist',
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "LIKE/STAR",
      stateMachineName: "LIKE/STAR_Interactivity",
    ),
  ),
  NavItemModel(
    title: 'Account',
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
    ),
  ),
];
