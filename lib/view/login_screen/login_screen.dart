import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/utils/constants/color_constants.dart';

import 'package:newsapp/view/Global_Widgets/AppbarWidget.dart';
import 'package:newsapp/view/bottom_navigationbar/bottomnavigation.dart';
import 'package:newsapp/view/discover_screen/discover_screen.dart';
import 'package:newsapp/view/home_screen/home_screen.dart';
import 'package:newsapp/view/publisher_screen/publisher_screen.dart';
import 'package:newsapp/view/registration_screen/registration_screen.dart';
import 'package:newsapp/view/user_profile_Screen/userprofileScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Appbar Widget
              AppbarWidget(
                title: "Sign In n",
                subtitle:
                    "Stay informed effortlessly. Sign in and explore a world of news",
              ),
              const SizedBox(height: 20),
              // Email TextField
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail),
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password TextField
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Forgot Password Button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password logic
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfileScreen(),
                        ));
                  },
                  child: const Text("Forgot Password?"),
                ),
              ),
              const SizedBox(height: 20),
              // Sign In Button
              SizedBox(
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomnavigationScreens(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.mainBlack,
                    foregroundColor: ColorConstants.mainWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Sign In"),
                ),
              ),
              const SizedBox(height: 20),
              // Social Sign In Buttons
              SizedBox(
                width: screenWidth,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PublisherScreen(
                          publisherName: "Forbes News",
                          aboutPublisher:
                              "Forbes is a global media company, focusing on business, investing, technology, and lifestyle.",
                          logoUrl:
                              "https://upload.wikimedia.org/wikipedia/commons/7/79/Forbes_logo.svg", // Replace with your logo URL
                          isVerified: true,
                          totalNews: 1200,
                          followers: 25000,
                          following: 50,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: const Icon(Icons.g_mobiledata_rounded,
                      color: Colors.white),
                  label: const Text(
                    "Sign In with Google",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: screenWidth,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiscoverScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  label: const Text(
                    "Sign In with Facebook",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
              // Sign Up Navigation
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ));
                      },
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
