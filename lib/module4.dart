import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Module4Model {
  final String title;
  final String address;
  final String image;
  final String dayOpen;
  final String timeOpen;
  final String cost;
  final String desc;
  final List<String> listImage;

  Module4Model({
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

class Module4 extends StatelessWidget {
  Module4({Key? key}) : super(key: key);

  List<Module4Model> models = [
    Module4Model(
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
    Module4Model(
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
    Module4Model(
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
    Module4Model(
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
    Module4Model(
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
    Module4Model(
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

  @override
  Widget build(BuildContext context) {
    return _Screen1Provider(models: models);
  }
}

class _Screen1 extends StatefulWidget {

  final List<Module4Model> models;

  const _Screen1({Key? key, required this.models}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State(models);
}

class _Screen1State extends State<_Screen1> {

  final List<Module4Model> models;
  final List<Module4Model> modelsSelected = [];

  _Screen1State(this.models);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mall'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 1),
                    pageBuilder: (_, __, ___) => _Screen2(models: modelsSelected),
                  ),
                );
              },
              icon: const Icon(Icons.check, color: Colors.white)
          )
        ],
      ),
      body: ListView.builder(
          itemCount: models.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      if (modelsSelected.contains(models[index])) {
                        modelsSelected.remove(models[index]);
                      } else {
                        modelsSelected.add(models[index]);
                      }
                    });
                  },
                  leading: Hero(
                    tag: "photo",
                    child: Image.asset(models[index].image),
                  ),
                  title: Text(models[index].title),
                  subtitle: Text(models[index].address),
                  trailing: modelsSelected.contains(models[index]) ? Icon(Icons.check_circle ): null,
                )
            );
          }
      ),
    );
  }
}

class _Screen2 extends StatelessWidget {
  final List<Module4Model> models;
  const _Screen2({Key? key, required this.models}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Surabaya'),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: ListView.builder(
          itemCount: models.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.grey.withOpacity(.7),
                child: ListTile(
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

/////////////////////////////////////////////
/// {{}}////////////////////////////////////
////////////////////////////////////////////

class Module4Provider extends ChangeNotifier {
  final List<Module4Model> _modelsSelected = [];
  List<Module4Model> get modelsSelected => _modelsSelected;

  void change(Module4Model model) {
    if (_modelsSelected.contains(model)) {
      _modelsSelected.remove(model);
    } else {
      _modelsSelected.add(model);
    }
    notifyListeners();
  }
}

class _Screen1Provider extends StatelessWidget {
  final List<Module4Model> models;
  const _Screen1Provider({Key? key, required this.models}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mall'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 1),
                    pageBuilder: (_, __, ___) => _Screen2Provider(),
                  ),
                );
              },
              icon: const Icon(Icons.check, color: Colors.white)
          )
        ],
      ),
      body: ListView.builder(
          itemCount: models.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                  onTap: () {
                    context.read<Module4Provider>().change(models[index]);
                  },
                  leading: Hero(
                    tag: "photo",
                    child: Image.asset(models[index].image),
                  ),
                  title: Text(models[index].title),
                  subtitle: Text(models[index].address),
                  trailing: Provider.of<Module4Provider>(context).modelsSelected.contains(models[index]) ? Icon(Icons.check_circle ): null,
                )
            );
          }
      ),
    );
  }
}

class _Screen2Provider extends StatelessWidget {
  const _Screen2Provider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Module4Model> models = Provider.of<Module4Provider>(context, listen: false).modelsSelected;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Surabaya'),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)
        ),
      ),
      body: ListView.builder(
          itemCount: models.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: Colors.grey.withOpacity(.7),
                child: ListTile(
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



