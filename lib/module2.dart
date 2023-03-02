import 'package:flutter/material.dart';

class Module2 extends StatelessWidget {
  const Module2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Tugas();
  }
}

class _Percobaan1 extends StatefulWidget {
  const _Percobaan1({Key? key}) : super(key: key);

  @override
  _Percobaan1State createState() => _Percobaan1State();
}

class _Percobaan1State extends State<_Percobaan1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    if (_counter > 10) {
      _counter = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Percobaan2 extends StatefulWidget {
  const _Percobaan2({Key? key}) : super(key: key);

  @override
  _Percobaan2State createState() => _Percobaan2State();
}

class _Percobaan2State extends State<_Percobaan2> {
  int _counter = 0;
  String _text = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    if (_counter % 2 == 0) {
      _text = "Genap";
    } else  {
      _text = "Ganjil";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_text',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Percobaan3 extends StatefulWidget {
  const _Percobaan3({Key? key}) : super(key: key);

  @override
  _Percobaan3State createState() => _Percobaan3State();
}

class _Percobaan3State extends State<_Percobaan3> {
  int _counter = 0;
  String _text = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    _text = "Ganjil";

    for (int i = 0; i <= _counter; i+1) {
      _text += "$i, ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_text',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Latihan extends StatefulWidget {
  const _Latihan({Key? key}) : super(key: key);

  @override
  _LatihanState createState() => _LatihanState();
}

class _LatihanState extends State<_Latihan> {
  int _counter = 0;
  String _text = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    _text = "Ganjil";

    for (int i = 0; i <= _counter; i+1) {
      if (i % 3 == 0) {
        _text += "$i, ";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_text',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Tugas extends StatefulWidget {
  const _Tugas({Key? key}) : super(key: key);

  @override
  _TugasState createState() => _TugasState();
}

class _TugasState extends State<_Tugas> {
  int _counter = 0;
  String _text = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    _text = "Prima";

    int bil;

    for(int i=1;i<=_counter;i++){
      bil=0;
      for(int j=1;j<=i;j++){
        if(i%j==0){
          bil=bil+1;
        }
      }
      if (bil==2) {
        _text += "$i, ";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '$_text',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }


}
