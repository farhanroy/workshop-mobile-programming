import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

class Module5Model2 {
  Module5Model2({
    required this.id,
    required this.name,
    required this.description,
    required this.day,
    required this.time,
    required this.cost,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String description;
  String day;
  String time;
  String cost;
  String image1;
  String image2;
  String image3;
  String image4;
  DateTime createdAt;
  DateTime updatedAt;

  factory Module5Model2.fromJson(Map<String, dynamic> json) => Module5Model2(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        day: json["day"],
        time: json["time"],
        cost: json["cost"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        image4: json["image4"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "day": day,
        "time": time,
        "cost": cost,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "image4": image4,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Module5Service1 {
  Future<List<Module5Model1>> getAllNews() async {
    List<Module5Model1> list = [];
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a441d239d9c1498497b7393e41d4db38"));

    final data = jsonDecode(response.body);
    for (var element in (data['articles'] as List)) {
      if (element['urlToImage'] != null &&
          element['content'] != null &&
          element['author'] != null &&
          element['description'] != null) {
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
    return const _Latihan();
  }
}

///
/// Percobaan
///

class _Percobaan extends StatelessWidget {
  const _Percobaan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Module5Service1();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan'),
      ),
      body: FutureBuilder<List<Module5Model1>>(
        future: service.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Hero(
                            tag: snapshot.data![index].urlToImage!,
                            child: Image.network(
                                snapshot.data![index].urlToImage!)),
                        title: Text(snapshot.data![index].title),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => _PercobaanDetail(
                                    model: snapshot.data![index])),
                          );
                        },
                      ),
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

class _PercobaanDetail extends StatelessWidget {
  final Module5Model1 model;
  const _PercobaanDetail({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: model.urlToImage!,
                child: Image.network(model.urlToImage!)),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.description!, style: theme.textTheme.bodyMedium),
                  const Divider(color: Colors.grey),
                  Text(model.title, style: theme.textTheme.bodySmall),
                  const Divider(color: Colors.grey),
                  Text("Date: ${model.publishedAt}",
                      style: theme.textTheme.titleMedium),
                  const SizedBox(height: 10),
                  Text("Author: ${model.author}",
                      style: theme.textTheme.titleMedium),
                  const Divider(color: Colors.grey),
                  Text(model.content ?? '', style: theme.textTheme.bodySmall),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  _PercobaanWebView(url: model.url)),
                        );
                      },
                      child: const Text('Read More'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PercobaanWebView extends StatefulWidget {
  final String url;
  const _PercobaanWebView({Key? key, required this.url}) : super(key: key);

  @override
  State<_PercobaanWebView> createState() => _PercobaanWebViewState();
}

class _PercobaanWebViewState extends State<_PercobaanWebView> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Web'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

///
/// LATIHAN
///

class Module5Service2 {
  static const String baseUrl =
      'https://041b-103-24-56-38.ap.ngrok.io/api/v1/wisata';

  Future<List<Module5Model2>> getAllWisata() async {
    List<Module5Model2> list = [];
    final response = await http.get(Uri.parse("$baseUrl/"));

    final data = jsonDecode(response.body);
    for (var element in (data['data'] as List)) {
      list.add(Module5Model2.fromJson(element));
    }
    return list;
  }

  Future<http.StreamedResponse> createWisata(Module5Model2 model) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse("$baseUrl/"));
      request.fields['name'] = model.name;
      request.fields['description'] = model.description;
      request.fields['cost'] = model.cost;
      request.fields['time'] = model.time;
      request.fields['day'] = model.day;
      request.files
          .add(await http.MultipartFile.fromPath("image1", model.image1));
      request.files
          .add(await http.MultipartFile.fromPath("image2", model.image2));
      request.files
          .add(await http.MultipartFile.fromPath("image3", model.image3));
      request.files
          .add(await http.MultipartFile.fromPath("image4", model.image4));

      final response = await request.send();
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}

class _Latihan extends StatelessWidget {
  const _Latihan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Module5Service2();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Surabaya'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _LatihanCreate()),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder<List<Module5Model2>>(
        future: service.getAllWisata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Hero(
                          tag: snapshot.data![index].image1,
                          child: Image.network(
                              "${Module5Service2.baseUrl}/image/${snapshot.data![index].image1}")),
                      title: Text(snapshot.data![index].name),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  _LatihanDetail(model: snapshot.data![index])),
                        );
                      },
                    ),
                  );
                });
          } else {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
        },
      ),
    );
  }
}

class _LatihanDetail extends StatelessWidget {
  final Module5Model2 model;
  const _LatihanDetail({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Wisata'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("${Module5Service2.baseUrl}/image/${model.image1}"),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(model.name,
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  Text(model.description, style: theme.textTheme.bodyMedium)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LatihanCreate extends StatefulWidget {
  const _LatihanCreate({Key? key}) : super(key: key);

  @override
  _LatihanCreateState createState() => _LatihanCreateState();
}

class _LatihanCreateState extends State<_LatihanCreate> {
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _dayController;
  late TextEditingController _timeController;
  late TextEditingController _costController;
  late TextEditingController _image1Controller;
  late TextEditingController _image2Controller;
  late TextEditingController _image3Controller;
  late TextEditingController _image4Controller;

  @override
  void initState() {
    _nameController = TextEditingController();
    _descController = TextEditingController();
    _dayController = TextEditingController();
    _timeController = TextEditingController();
    _costController = TextEditingController();
    _image1Controller = TextEditingController();
    _image2Controller = TextEditingController();
    _image3Controller = TextEditingController();
    _image4Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future pickImage(int type) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      setState(() {
        if (type == 1) {
          _image1Controller.text = image.path;
        } else if (type == 2) {
          _image2Controller.text = image.path;
        } else if (type == 3) {
          _image3Controller.text = image.path;
        } else {
          _image4Controller.text = image.path;
        }
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final service = Module5Service2();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Wisata'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descController,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _dayController,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _timeController,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _costController,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _image1Controller,
                  )),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () => pickImage(1),
                    child: const Text('Pilih Gambar'),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _image2Controller,
                  )),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () => pickImage(2),
                    child: const Text('Pilih Gambar'),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _image3Controller,
                  )),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () => pickImage(3),
                    child: const Text('Pilih Gambar'),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _image4Controller,
                  )),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () => pickImage(4),
                    child: const Text('Pilih Gambar'),
                  ))
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    final model = Module5Model2(
                        id: 0,
                        name: _nameController.text,
                        description: _descController.text,
                        day: _dayController.text,
                        time: _timeController.text,
                        cost: _costController.text,
                        image1: _image1Controller.text,
                        image2: _image2Controller.text,
                        image3: _image3Controller.text,
                        image4: _image4Controller.text,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now());

                    service.createWisata(model).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(value.statusCode.toString())));
                    }).catchError((e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e)));
                    });
                  },
                  child: const Text('Tambahkan'))
            ],
          ),
        ),
      ),
    );
  }
}

class _LatihanUpdate extends StatefulWidget {
  final Module5Model2 model;
  const _LatihanUpdate({Key? key, required this.model}) : super(key: key);

  @override
  _LatihanUpdateState createState() => _LatihanUpdateState();
}

class _LatihanUpdateState extends State<_LatihanUpdate> {
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _dayController;
  late TextEditingController _timeController;
  late TextEditingController _costController;
  late TextEditingController _image1Controller;
  late TextEditingController _image2Controller;
  late TextEditingController _image3Controller;
  late TextEditingController _image4Controller;

  @override
  void initState() {
    _nameController = TextEditingController();
    _descController = TextEditingController();
    _dayController = TextEditingController();
    _timeController = TextEditingController();
    _costController = TextEditingController();
    _image1Controller = TextEditingController();
    _image2Controller = TextEditingController();
    _image3Controller = TextEditingController();
    _image4Controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future pickImage(int type) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      setState(() {
        if (type == 1) {
          _image1Controller.text = image.path;
        } else if (type == 2) {
          _image2Controller.text = image.path;
        } else if (type == 3) {
          _image3Controller.text = image.path;
        } else {
          _image4Controller.text = image.path;
        }
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final service = Module5Service2();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Wisata'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descController,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _dayController,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _timeController,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _costController,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _image1Controller,
                      )),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () => pickImage(1),
                        child: const Text('Pilih Gambar'),
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _image2Controller,
                      )),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () => pickImage(2),
                        child: const Text('Pilih Gambar'),
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _image3Controller,
                      )),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () => pickImage(3),
                        child: const Text('Pilih Gambar'),
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: _image4Controller,
                      )),
                  Expanded(
                      child: ElevatedButton(
                        onPressed: () => pickImage(4),
                        child: const Text('Pilih Gambar'),
                      ))
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    final model = Module5Model2(
                        id: 0,
                        name: _nameController.text,
                        description: _descController.text,
                        day: _dayController.text,
                        time: _timeController.text,
                        cost: _costController.text,
                        image1: _image1Controller.text,
                        image2: _image2Controller.text,
                        image3: _image3Controller.text,
                        image4: _image4Controller.text,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now());

                    service.createWisata(model).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(value.statusCode.toString())));
                    }).catchError((e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e)));
                    });
                  },
                  child: const Text('Tambahkan'))
            ],
          ),
        ),
      ),
    );
  }
}

