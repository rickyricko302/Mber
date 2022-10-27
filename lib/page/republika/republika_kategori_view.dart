import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbernews/page/webview.dart';
import 'package:mbernews/repository/repository.dart';

import 'republika_cubit.dart';

class RepublikaKategoriPage extends StatelessWidget {
  String title;
  RepublikaKategoriPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepublikaCubit(Repository()),
      child: _Widget(title: title),
    );
  }
}

class _Widget extends StatelessWidget {
  const _Widget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    context.read<RepublikaCubit>().getRepublikaByKategori(title);
    return Scaffold(
      appBar: AppBar(
        title: Text("Republika " + title),
      ),
      body: BlocBuilder<RepublikaCubit, RepublikaState>(
        builder: (context, state) {
          if (state is RepublikaLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RepublikaSuccess) {
            return ListView.builder(
                itemCount: state.data.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => WebViewExample(
                                    url: state.data.data![index].link!,
                                  )));
                    },
                    tileColor: Colors.white,
                    dense: true,
                    trailing: Text(
                      (index + 1).toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: FadeInImage(
                        placeholder: AssetImage("assets/images/dummy.png"),
                        image: NetworkImage(
                            state.data.data![index].image!.small!)),
                    title: Text(
                      state.data.data![index].title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                        DateTime.parse(state.data.data![index].isoDate!)
                            .toString()
                            .replaceFirst(".000Z", "")),
                  );
                });
          } else if (state is RepublikaError) {
            return Text(state.msg);
          }
          return SizedBox();
        },
      ),
    );
  }
}
