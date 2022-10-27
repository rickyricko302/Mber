import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbernews/page/cnn/cnn_cubit.dart';
import 'package:mbernews/page/webview.dart';
import 'package:mbernews/repository/repository.dart';

class CnnKategoriPage extends StatelessWidget {
  String title;
  CnnKategoriPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CnnCubit(Repository()),
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
    context.read<CnnCubit>().getDataKategori(title);
    return Scaffold(
      appBar: AppBar(
        title: Text("CNN " + title),
      ),
      body: BlocBuilder<CnnCubit, CnnState>(
        builder: (context, state) {
          if (state is CnnLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CnnSuccess) {
            return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => WebViewExample(
                                    url: state.data[index].link!,
                                  )));
                    },
                    dense: true,
                    trailing: Text(
                      (index + 1).toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: FadeInImage(
                        placeholder: AssetImage("assets/images/dummy.png"),
                        image: NetworkImage(state.data[index].image!.small!)),
                    title: Text(
                      state.data[index].title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(DateTime.parse(state.data[index].isoDate!)
                        .toString()
                        .replaceFirst(".000Z", "")),
                  );
                });
          } else if (state is CnnError) {
            return Text(state.msg);
          }
          return SizedBox();
        },
      ),
    );
  }
}
