import 'package:flutter/material.dart';
import 'package:thimar_amit_g4/core/design/app_image.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/favorites/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/home/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/my_account/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/my_orders/view.dart';
import 'package:thimar_amit_g4/views/main/home_nav/pages/notifications/view.dart';

class HomeNavView extends StatefulWidget {
  const HomeNavView({Key? key}) : super(key: key);

  @override
  State<HomeNavView> createState() => _HomeNavViewState();
}

class _HomeNavViewState extends State<HomeNavView> {

  final pages = [
    HomePage(),
    MyOrdersPage(),
    NotificationsPage(),
    FavoritesPage(),
    MyAccountPage(),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPage,
        onTap: (value) {
          currentPage =value;
          setState(() {

          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xffAED489),
        items: [
          BottomNavigationBarItem(icon: AppImage("home.svg",color: currentPage==0?Colors.white:Color(0xffAED489),), label: "الرئيسية"),
          BottomNavigationBarItem(icon: AppImage("my_orders.svg",color: currentPage==1?Colors.white:Color(0xffAED489)), label: "طلباتي"),
          BottomNavigationBarItem(icon: AppImage("notifications.svg",color: currentPage==2?Colors.white:Color(0xffAED489)), label: "الإشعارات"),
          BottomNavigationBarItem(icon: AppImage("favs.svg",color: currentPage==3?Colors.white:Color(0xffAED489)), label: "المفضلة"),
          BottomNavigationBarItem(icon: AppImage("my_account.svg",color: currentPage==4?Colors.white:Color(0xffAED489)), label: "حسابي"),
        ],
      ),
    );
  }
}
