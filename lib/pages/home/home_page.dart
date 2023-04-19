import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import './main_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  List pages = [
    MainHomePage(),
    Container(child: Center(child: Text("1"))),
    Container(child: Center(child: Text("2"))),
    Container(child: Center(child: Text("3"))),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[_selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //         selectedItemColor: AppColors.mainColor,
  //         unselectedItemColor: AppColors.paragraphColor,
  //         showSelectedLabels: false,
  //         selectedFontSize: 0.0,
  //         unselectedFontSize: 0.0,
  //         showUnselectedLabels: false,
  //         currentIndex: _selectedIndex,
  //         onTap: onTapNav,
  //         items: const [
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.home_outlined), label: "Home"),
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.archive), label: "History"),
  //           BottomNavigationBarItem(
  //               icon: Icon(Icons.shopping_cart), label: "Cart"),
  //           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
  //         ]),
  //   );
  // }

  List<Widget> _buildScreens() {
    return [
      MainHomePage(),
      Container(child: Center(child: Text("1"))),
      Container(child: Center(child: Text("2"))),
      Container(child: Center(child: Text("3"))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.systemBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.archive),
        title: ("History"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Me"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: AppColors.mainColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      margin: EdgeInsets.only(
          bottom: Dimensions.width10,
          left: Dimensions.height10,
          right: Dimensions.height10),
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
