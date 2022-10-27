import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbernews/main_cubit.dart';
import 'package:mbernews/page/republika/republika_view.dart';
import 'package:mbernews/page/okezone/okezone_view.dart';
import 'package:mbernews/page/splash/splash.dart';
import 'package:mbernews/page/widgets/layout_bottom_sheet.dart';
import 'page/cnn/cnn_view.dart';

void main() {
  runApp(const Mber());
}

class Mber extends StatelessWidget {
  const Mber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, int>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: state == 0
                    ? Colors.red
                    : state == 1
                        ? Colors.blueGrey
                        : Colors.blue),
            home: SplashPage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mobile Berita"),
          bottom: TabBar(tabs: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "Cnn",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Republika", style: TextStyle(fontSize: 18))),
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text("Okezone", style: TextStyle(fontSize: 18))),
          ]),
          actions: [
            Container(
                margin: EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return LayoutBottomSheet();
                          });
                    },
                    icon: Icon(Icons.help_outline)))
          ],
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [CnnPage(), RepublikaPage(), OkezonePage()]),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
