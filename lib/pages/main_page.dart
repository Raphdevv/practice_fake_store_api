import 'package:fake_store/constance.dart';
import 'package:fake_store/pages/cart_page.dart';
import 'package:fake_store/pages/home_page.dart';
import 'package:fake_store/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../models/user_model.dart';
import '../services/api_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Future<UserResponseModel> userFuture;
  static int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    userFuture = APIService().getUser();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: userFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Mainpage(snapshot.data!.id);
        }
        return Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/ic_fake_store.png',
                width: 300,
                fit: BoxFit.cover,
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
            ],
          )),
        );
      },
    );
  }

  Scaffold Mainpage(int? userid) {
    final List<Widget> _page = [
      const HomePage(),
      CartPage(userId: userid),
      const ProfilePage(),
    ];
    return Scaffold(
      backgroundColor: primaryColor,
      body: _page.elementAt(index),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: GNav(
          backgroundColor: primaryColor,
          color: Colors.white,
          activeColor: Colors.white,
          gap: 8,
          onTabChange: (value) => setState(() {
            index = value;
          }),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
