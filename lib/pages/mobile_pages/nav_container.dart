import 'package:belajar_pas_flutter_terbaru_2024/controllers/navigation_controller.dart';
import 'package:belajar_pas_flutter_terbaru_2024/pages/mobile_pages/menu_pages/favourites_page.dart';
import 'package:belajar_pas_flutter_terbaru_2024/pages/mobile_pages/menu_pages/home_page.dart';
import 'package:belajar_pas_flutter_terbaru_2024/pages/mobile_pages/menu_pages/my_account_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MobileNavContainer extends StatelessWidget {
  const MobileNavContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();
    final List<Widget> pages = [MobileHomePage(), MobileFavouritesPage(), MobileMyAccountPage()];

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.selectedIndex.value == 0 ? "Home" : controller.selectedIndex.value == 1 ? "Favourites" : "My Account"),
        ),
        body: pages[controller.selectedIndex.value],
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Drawer Header with placeholder text
              DrawerHeader(
                child: Text('Welcome, user!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              // ListTile 1
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  controller.changeMenu(0);
                  Navigator.pop(context);
                },
              ),
              // ListTile 2
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Favourites'),
                onTap: () {
                  controller.changeMenu(1);
                  Navigator.pop(context);
                },
              ),
              // ListTile 3
              ListTile(
                leading: Icon(Icons.person),
                title: Text('My Account'),
                onTap: () {
                  controller.changeMenu(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )

      );
    });
  }
}
