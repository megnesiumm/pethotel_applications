import 'package:flutter/material.dart';
import 'package:petshop_applications/modules/about_page/pages/about_page.dart';
import 'package:petshop_applications/modules/gallery_review_page/pages/gallery_page.dart';
import 'package:petshop_applications/modules/login/pages/login_page.dart';
import 'package:petshop_applications/modules/room_page/pages/room_page.dart';
import 'package:petshop_applications/modules/services_page/pages/services_page.dart';
import 'package:petshop_applications/modules/tabmenupage/pages/tabemenu_page.dart'; // เพิ่ม path ที่ถูกต้อง

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/':
            (context) => TabMenuPage(
              username: 'guest',
              avatarUrl: 'https://i.pravatar.cc/300',
            ),
        '/login': (context) => LoginPage(),
        '/room': (context) => const RoomPage(),
        '/services': (context) => const ServicesPage(),
        '/gallery': (context) => const GalleryPage(),
        '/about': (context) => const AboutPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Noto Sans'),
      ),
    );
  }
}
