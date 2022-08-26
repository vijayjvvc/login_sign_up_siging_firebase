import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_sign_up/Screen/ui/login/login_page.dart';
import 'package:login_sign_up/Screen/ui/login/signup_page.dart';
import 'package:login_sign_up/misc/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final widthOfScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundScreen,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  // child: AspectRatio(
                  // aspectRatio: 16 / 9,
                  // aspectRatio: 1,
                  child: Container(
                    width: widthOfScreen < 500
                        ? widthOfScreen
                        : (widthOfScreen / 2),
                    height: widthOfScreen < 500
                        ? widthOfScreen
                        : (widthOfScreen / 3),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      image: DecorationImage(
                          image: AssetImage("assets/images/lolo.jpg"),
                          fit: BoxFit.cover),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                  ),
                  // ),
                ),
                Text(
                  "Discover your\nDream job Here",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Explore all the most exiting jobs roles based on your interest And study major",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    width: widthOfScreen < 500
                        ? widthOfScreen
                        : (widthOfScreen / 2),
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: moveToSignIn,
                          child: Text("Sign in"),
                        ),
                        InkWell(onTap: moveToSignUp,child: Text("Sign Up"))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void moveToSignIn() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void moveToSignUp() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignUp()));
  }
}