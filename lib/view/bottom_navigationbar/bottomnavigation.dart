import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newsapp/view/bookmark_screen/bookmark_Screen.dart';
import 'package:newsapp/view/discover_screen/discover_screen.dart';
import 'package:newsapp/view/home_screen/home_screen.dart';
import 'package:newsapp/view/user_profile_Screen/userprofileScreen.dart';

class BottomnavigationScreens extends StatefulWidget {
  const BottomnavigationScreens({super.key});

  @override
  State<BottomnavigationScreens> createState() =>
      _BottomnavigationScreensState();
}

class _BottomnavigationScreensState extends State<BottomnavigationScreens> {
  List screens = [
    HomeScreen(),
    DiscoverScreen(),
    BookmarkScreen(),
    UserProfileScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: GNav(
          rippleColor: Colors.grey[300]!,
          hoverColor: Colors.grey[100]!,
          gap: 8,
          activeColor: Colors.black,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.grey[100]!,
          color: Colors.black,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.search,
              text: 'Discover',
            ),
            GButton(
              icon: Icons.bookmark,
              text: 'Bookmarks',
            ),
            GButton(
              icon: Icons.verified_user_sharp,
              text: 'User',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: screens[_selectedIndex],
    );
  }
}
