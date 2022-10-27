import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbernews/main_cubit.dart';
import 'package:mbernews/page/republika/republika_cubit.dart';
import 'package:mbernews/page/republika/republika_kategori_view.dart';
import 'package:mbernews/page/webview.dart';
import 'package:mbernews/repository/repository.dart';

class RepublikaPage extends StatelessWidget {
  const RepublikaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listType = [
      "news",
      "nusantara",
      "khazanah",
      "islam-digest",
      "internasional",
      "ekonomi",
      "sepakbola",
      "leisure"
    ];
    context.read<MainCubit>().emit(1);
    return BlocProvider(
      create: (context) => RepublikaCubit(Repository()),
      child: _Widget(listType: listType),
    );
  }
}

class _Widget extends StatelessWidget {
  const _Widget({
    Key? key,
    required this.listType,
  }) : super(key: key);

  final List<String> listType;

  @override
  Widget build(BuildContext context) {
    context.read<RepublikaCubit>().getRepublika();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Daftar Kategori",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: listType.length,
                padding: EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2 / 1),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => RepublikaKategoriPage(
                                    title: listType[index])));
                      },
                      child: Text(
                        listType[index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ));
                }),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
            child: Text(
              "Berita Terbaru ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          BlocBuilder<RepublikaCubit, RepublikaState>(
              builder: (context, state) {
            if (state is RepublikaLoading) {
              return Container(
                margin: EdgeInsets.only(top: 60),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is RepublikaSuccess) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.data.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => WebViewExample(
                                      url: state.data.data![index].link!,
                                    )));
                      },
                      child: Container(
                          margin: EdgeInsets.all(20),
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FadeInImage(
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder:
                                      AssetImage("assets/images/dummy.png"),
                                  image: NetworkImage(
                                    state.data.data![index].image!.small!,
                                  )),
                            ),
                            Positioned(
                              bottom: 0,
                              child: BlurryContainer(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.data.data![index].title!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            DateTime.parse(state
                                                    .data.data![index].isoDate!)
                                                .toString()
                                                .replaceFirst(".000Z", ""),
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 250, 247, 247)),
                                          ),
                                          Text(
                                            "By " +
                                                state
                                                    .data.data![index].creator!,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          )
                                        ],
                                      )
                                    ]),
                                blur: 5,
                                elevation: 0,
                                width: MediaQuery.of(context).size.width - 40,
                                padding: EdgeInsets.only(
                                    left: 10, bottom: 10, top: 10, right: 10),
                                color: Color.fromARGB(71, 0, 0, 0),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                            ),
                          ])),
                    );
                  });
            } else if (state is RepublikaError) {
              return Text("Failed " + state.msg);
            }
            return SizedBox();
          }),
        ],
      ),
    );
  }
}
