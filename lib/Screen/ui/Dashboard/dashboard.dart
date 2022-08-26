import 'package:flutter/material.dart';
import 'package:login_sign_up/Screen/ui/login/Welcome.dart';
import 'package:login_sign_up/repo/auth_helper.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: InkWell(
              onTap: signOut,
              child: Text("LogOut",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                backgroundColor: Colors.black
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signOut() async {
   AuthenticationHelper().signOut().then((value){
     if(value==null){
       Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (context) => const Welcome()));
     }else{
       final snackBar = SnackBar(content: Text("Failed to signOut",style: TextStyle(fontSize: 16)));
       ScaffoldMessenger.of(context).showSnackBar(snackBar);
     }
   });
  }
}
