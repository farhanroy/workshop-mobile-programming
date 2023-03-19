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

    List<Module3Model> models2 = [
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

    List<Module3Model> models = [
      Module3Model(
          title: 'Pakuwon Mall Surabaya',
          address: 'Jl. Raya Laguna KJW Putih Tambak No.2',
          image: 'assets/module3/pakuwon1.webp',
          dayOpen: 'Anytime',
          timeOpen: '09.00 - 18.00',
          cost: 'Rp. 10.000',
          desc: 'Pakuwon Mall memiliki banyak brand terkenal baik lokal maupun internasional. Beberapa brand yang berada di mall ini antara lain, SOGO Department Store, Zara, H&M, Lottemart, Watsons, dan lainnya.',
          listImage: [
            'assets/module3/pakuwon2.jpeg',
            'assets/module3/pakuwon3.jpeg',
            'assets/module3/pakuwon4.jpeg'
          ]
      ),
      Module3Model(
          title: 'Tunjungan Plaza',
          address: 'Jl. Basuki Rahmat No.8-12, Kedungdoro',
          image: 'assets/module3/tunjungan1.jpeg',
          dayOpen: 'Anytime',
          timeOpen: '09.00 - 22.00',
          cost: 'Rp. 10.000',
          desc: 'Mall terbesar kedua Surabaya adalah Tunjungan Plaza. Luasnya mencapai 170.000 meter persegi dan terdiri dari 6 pusat perbelanjaan dari Tunjungan Plaza I sampai Tunjungan Plaza 6. Terbayang kan besarnya mall ini.',
          listImage: [
            'assets/module3/tunjungan2.jpeg',
            'assets/module3/tunjungan3.jpeg',
            'assets/module3/tunjungan4.jpeg',
          ]
      ),
      Module3Model(
          title: 'Ciputra World',
          address: 'Jl. Mayjen Sungkono No.89, Gn. Sari',
          image: 'assets/module3/ciputra1.jpeg',
          dayOpen: 'Senin - Sabtu',
          timeOpen: '09.00 - 18.00',
          cost: 'Rp. 10.000',
          desc: 'Ciputra World Surabaya berlokasi di CBD Mayjen Sungkono Surabaya, dibangun dengan konsep Superblock yang berdiri diatas lahan seluas 9 Hektar akan menjadi salah satu superblock terbesar di Indonesia.Superblock yang terdiri dari Mall Ciputra World, Ciputra World Hotel, Skyloft-SOHO, dan The Voila',
          listImage: [
            'assets/module3/ciputra2.jpeg',
            'assets/module3/ciputra3.jpeg',
            'assets/module3/ciputra4.jpeg',
          ]
      ),
      Module3Model(
          title: 'Grand City Surabaya',
          address: 'Jl. Walikota Mustajab No.1, Ketabang, Kec. Genten',
          image: 'assets/module3/gc1.jpeg',
          dayOpen: 'Anytime',
          timeOpen: '09.00 - 21.00',
          cost: 'Rp. 10.000',
          desc: 'Grand City Surabaya adalah salah satu mall di Surabaya yang didirikan pada tahun 2009. Grand City Surabaya terletak di daerah strategis, yaitu kawasan Gubeng. Tidak terlalu jauh dari Stasiun Gubeng.',
          listImage: [
            'assets/module3/gc2.jpeg',
            'assets/module3/gc3.jpeg',
            'assets/module3/gc4.jpeg',
          ]
      ),
      Module3Model(
          title: 'City Of Tomorrow (Cito)',
          address: 'Jl. Ahmad Yani No.288, Dukuh Menanggal, Kec. Gayungan',
          image: 'assets/module3/cito1.jpeg',
          dayOpen: 'Anytime',
          timeOpen: '09.00 - 22.00',
          cost: 'Rp. 10.000',
          desc: 'CITO merupakan salah satu superblok yang terlengkap di Surabaya Selatan. Superblok yang memiliki luas 170 ribu meter persegi ini berdiri di area seluas 2,6 hektar.',
          listImage: [
            'assets/module3/cito2.jpeg',
            'assets/module3/cito3.jpeg',
            'assets/module3/cito4.jpeg',
          ]
      ),
      Module3Model(
          title: 'Galaxy Mall',
          address: 'Jl. Dharmahusada Indah Timur 35-37, Mulyorejo',
          image: 'assets/module3/galaxy1.jpeg',
          dayOpen: 'Anytime',
          timeOpen: '09.00 - 23.00',
          cost: 'Rp. 10.000',
          desc: 'Galaxy Mall adalah salah satu pusat perbelanjaan terbesar di Surabaya. Mal ini didirikan pada tahun 1996. Mal ini terdiri dari 5 lantai dengan tenant yang sudah terkenal seperti Centro, Sogo, Uniqlo, Sushi Tei, Cinema XXI, Erafone, dan masih banyak lagi.',
          listImage: [
            'assets/module3/galaxy2.jpeg',
            'assets/module3/galaxy3.jpeg',
            'assets/module3/galaxy4.jpeg',
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
                  //_buildIcon(model.cost, Icons.monetization_on_rounded),
                ],
              ),
              const SizedBox(height: 8),
              Text(model.desc, textAlign: TextAlign.center),
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

