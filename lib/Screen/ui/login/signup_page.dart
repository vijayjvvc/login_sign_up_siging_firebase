import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_sign_up/Screen/ui/Dashboard/dashboard.dart';
import 'package:login_sign_up/Screen/ui/login/login_page.dart';
import 'package:login_sign_up/misc/colors.dart';

import '../../../repo/auth_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email = "";
  late String password = "";
  var sizeMargin20 = 20.0;
  var sizeMargin10 = 10.0;
  var mainTitle = 'Hello!';
  var mainDes = 'You are Welcome to join us!';
  var font40 = 40.0;
  var var15 = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScreen,
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                mainTitle,
                style: GoogleFonts.bebasNeue(
                  fontSize: font40,
                ),
              ),
              SizedBox(height: sizeMargin20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      mainDes,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: sizeMargin20),
////////////////////////////// email box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 4,
                        blurRadius: 4,
                        color: Colors.black12,
                      )
                    ],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                        maxLines: 1,
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                          counterText: '',
                          labelText: "Email",
                          hintText: 'Enter an Email',
                        )),
                  ),
                ),
              ),
              SizedBox(height: sizeMargin10),
////////////////////////////// password box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 4,
                        blurRadius: 4,
                        color: Colors.black12,
                      )
                    ],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        maxLines: 1,
                        maxLength: 16,
                        obscureText: true,
                        textAlign: TextAlign.left,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                          labelText: "Password",
                          prefixIcon: Icon(Icons.key_off_outlined),
                          hintText: 'Create an Password',
                        )),
                  ),
                ),
              ),
              const SizedBox(height: 30),
//////////////////////////// sign up btn
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(var15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 5,
                          color: AppColors.backgroundBtn),
                    ],
                    color: AppColors.backgroundBtn,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: signInWithEmailAndPassword,
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: sizeMargin20),
              InkWell(
                onTap: navigatorSignup,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      'Already have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
            ],
          ),
        ),
      )),
    );
  }

  void navigatorSignup() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void signInWithEmailAndPassword() {
    if (validtaor()) {
      AuthenticationHelper()
          .signUp(email: email, password: password)
          .then((result) {
        if (result == null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const DashBoard()));
        } else {
          snackToShow(result);
        }
      });
    }
  }

  void snackToShow(String key) {
    final snackBar =
        SnackBar(content: Text(key, style: TextStyle(fontSize: 16)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool validtaor() {
    if (email.isEmpty || email.length <= 0) {
      snackToShow("Email can\'t be empty");
      return false;
    } else if (password.length < 8 || password.length > 15) {
      snackToShow("Password must contain 8 to 15 Character");
      return false;
    }
    return true;
  }
}
