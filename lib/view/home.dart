import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/bloc/home/home_bloc.dart';
import 'package:news/bloc/home/home_event.dart';
import 'package:news/model/news.dart';
import '../bloc/home/home_state.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc? homeBloc;
  List<Articles>? articles;

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc?.add(FetchDataArticle());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("News"),
        ),
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is Message) {
              Scaffold.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text('Error Happen when get Data'),
                ),
              );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is Intial) {
                return buildLoading();
              } else if (state is Loading) {
                return buildLoading();
              } else if (state is Loaded) {
                return listing(state.myArticle);
              } else {
                return buildLoading();
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget buildLoading() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget listing(List<Articles> mydata) {
  return ListView.builder(
    itemCount: mydata.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Card(
            elevation: 2,
            child: ListTile(
              leading: Hero(
                tag: (mydata[index].urlToImage).toString(),
                child: Image.network((mydata[index].urlToImage).toString()),
              ),
              title: Text((mydata[index].title).toString()),
              subtitle: Text((mydata[index].author).toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Detail(
                      data: mydata[index],
                    );
                  }),
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
