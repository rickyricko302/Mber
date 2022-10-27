import 'package:flutter/material.dart';
import 'package:mbernews/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double opacity = 0.0;
  bool isUpdate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacity = 1;
        isUpdate = true;
      });
    });

    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 2),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 101,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/splashed.png"),
                  radius: 100,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                AnimatedPositioned(
                    left: isUpdate ? null : 0,
                    child: Text(
                      "Baca berita terbaru biar lo ga ketinggalan\n- Mber",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    duration: Duration(seconds: 3)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
