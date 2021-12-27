import 'package:flutter/material.dart';
import 'package:news/model/news.dart';
import 'package:intl/intl.dart';

class Detail extends StatelessWidget {
  final Articles? data;

  const Detail({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Container(
        margin: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: (data!.urlToImage).toString(),
                child: Image.network((data!.urlToImage).toString()),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                (data!.title.toString()),
                textAlign: TextAlign.justify,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                (data!.description.toString()),
                textAlign: TextAlign.justify,
                style:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
