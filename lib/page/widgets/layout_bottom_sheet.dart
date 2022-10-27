import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LayoutBottomSheet extends StatelessWidget {
  const LayoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Center(
              child: Icon(
            Icons.engineering,
            color: Colors.grey,
            size: 35,
          )),
        ),
        Container(
          child: Center(
              child: Text(
            "Coded by Ricky V 💻",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[700]),
          )),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Center(
              child: Text(
            "Hai, ini adalah aplikasi MBer yang merupakan singkatan dari Mobile Berita. Aplikasi ini menyajikan berita-berita terbaru lhoo dari 3 portal penyedia berita.\nOh iyaa mari berteman dan mengobrol dengan saya :)",
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          )),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  _openUrl(Uri.parse("https://instagram.com/rickyverdiyanto"));
                },
                leading: Image(
                  image: AssetImage("assets/images/instagram.png"),
                  width: 36,
                  height: 36,
                ),
                title: Text("@rickyverdiyanto"),
              ),
              ListTile(
                onTap: () {
                  _openUrl(Uri.parse("https://github.com/rickyricko302"));
                },
                leading: Image(
                  image: AssetImage("assets/images/github.png"),
                  width: 36,
                  height: 36,
                ),
                title: Text("rickyricko302"),
              ),
              ListTile(
                onTap: () {
                  _openUrl(Uri.parse(
                      "mailto:verdiyantorky123@gmail.com?subject=Hallo%20Dev&body=Salam kenal"));
                },
                leading: Image(
                  image: AssetImage("assets/images/email.png"),
                  width: 36,
                  height: 36,
                ),
                title: Text("verdiyantorky123@gmail.com"),
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _openUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
}
