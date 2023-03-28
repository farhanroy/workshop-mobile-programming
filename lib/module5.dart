import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Module5Model1 {
  Module5Model1({
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  factory Module5Model1.fromJson(Map<String, dynamic> json) => Module5Model1(
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Module5Model2 {}

class Module5Service1 {
  Future<List<Module5Model1>> getAllNews() async {
    List<Module5Model1> list = [];
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a441d239d9c1498497b7393e41d4db38"));

    final data = jsonDecode(response.body);
    for (var element in (data['articles'] as List)) {

      if (element['urlToImage'] != null) {
        list.add(Module5Model1.fromJson(element));
      }
    }
    return list;
  }
}

class Module5 extends StatelessWidget {
  const Module5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Percobaan();
  }
}

class Percobaan extends StatelessWidget {
  const Percobaan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _service = Module5Service1();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan'),
      ),
      body: FutureBuilder<List<Module5Model1>>(
        future: _service.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                   return ListTile(
                     title: Text(snapshot.data![index].title),
                   );
                  });
            }
          } else {
            return Text('data tidak ada: ${snapshot.error}');
          }
        },
      ),
    );
  }
}

class PercobaanDetail extends StatelessWidget {
  const PercobaanDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Latihan extends StatelessWidget {
  const Latihan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LatihanDetail extends StatelessWidget {
  const LatihanDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

