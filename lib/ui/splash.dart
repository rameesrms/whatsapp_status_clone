import 'package:flutter/material.dart';
import 'package:whatsappstatus/ui/home.dart';

import '../logic/status_manager.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var statusManager = StatusManager();



  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  void _navigateHome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});


    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>
    StatusScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:
              18,),
            ],
          ),
        ),
      ),
    );
  }
}
