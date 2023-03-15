import 'package:flutter/material.dart';

class Module3Model {
  final String title;
  final String address;
  final String image;
  final String dayOpen;
  final String timeOpen;
  final String cost;
  final String desc;
  final List<String> listImage;

  Module3Model({
    required this.title,
    required this.address,
    required this.image,
    required this.dayOpen,
    required this.timeOpen,
    required this.cost,
    required this.desc,
    required this.listImage,
  });
}

// Screen
class Module3 extends StatelessWidget {
  const Module3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Screen1();
  }
}

class _Screen1 extends StatelessWidget {
  const _Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Module3Model> models = [
      Module3Model(
        title: 'Surabaya Submarine Monument',
        address: 'Jl Surabaya',
        image: 'assets/module3/image1a.jpeg',
        dayOpen: 'Anytime',
        timeOpen: '09.00 - 18.00',
        cost: 'Rp. 10.000',
        desc: 'Monumen Kapal Selam, atau disingkat Monkasel, adalah sebuah museum kapal selam yang terdapat di Embong Kaliasin, Genteng, Surabaya. Terletak di pusat kota yaitu di Jalan Pemuda, tepat di sebelah Plaza Surabaya, dan terdapat pintu akses untuk mengakses mal dari dalam monumen',
        listImage: [
          'assets/module3/image1b.jpeg',
          'assets/module3/image1c.jpeg',
          'assets/module3/image1d.jpeg',
        ]
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Surabaya'),
      ),
      body: ListView.builder(
        itemCount: models.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 1),
                      pageBuilder: (_, __, ___) => _Screen2(model: models[index]),
                    ),
                  );
                },
                leading: Hero(
                  tag: "photo",
                  child: Image.asset(models[index].image),
                ),
                title: Text(models[index].title),
                subtitle: Text(models[index].address),
              )
            );
          }
      ),
    );
  }
}

class _Screen2 extends StatelessWidget {

  final Module3Model model;

  const _Screen2({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                  tag: "photo",
                  child: Image.asset(model.image)
              ),
              const SizedBox(height: 8),
              Text(
                model.title,
                style: const TextStyle(
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.bold,
                    fontSize: 28
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildIcon(model.dayOpen, Icons.calendar_today),
                  _buildIcon(model.timeOpen, Icons.timer),
                  _buildIcon(model.cost, Icons.monetization_on_rounded),
                ],
              ),
              const SizedBox(height: 8),
              Text(model.desc),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.listImage.length,
                    itemBuilder: (BuildContext context, int i) {
                      return _buildImagelItem(model.listImage[i]);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(String title, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        Text(title)
      ],
    );
  }

  Widget _buildImagelItem(String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
          child: Image.asset(asset)
      ),
    );
  }

}

