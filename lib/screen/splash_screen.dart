import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamed(context, '/calculate2');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal.withOpacity(0.2),title:const Text('Calculate'),centerTitle: true,),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'images/imgBackGround.jpg',
              alignment: Alignment.center,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Text(
                'Nassem Ahmed Mubarak',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Dancing',
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
