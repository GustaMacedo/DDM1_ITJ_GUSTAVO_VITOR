import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List dados;
  dynamic jsonResult = Null;
  int posicaoAtual = 0;

  loadJson() async {
    String data = await rootBundle.loadString('assets/loadjson/historia.json');
    setState(() {
      jsonResult = json.decode(data);
      print(jsonResult[posicaoAtual]);
    });
    print('loadJson: $jsonResult');
    print(jsonResult);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    var texto = jsonResult == Null ? '-' : jsonResult[posicaoAtual]['text'];
    var imagem = jsonResult == Null ? '-' : jsonResult[posicaoAtual]['imagem'];
    var texe = jsonResult == Null ? '-' : jsonResult[posicaoAtual]['texa'];
    var texd = jsonResult == Null ? '-' : jsonResult[posicaoAtual]['texp'];
    print('build... $texto');
    //var texto = 'Teste...';

    /*DefaultAssetBundle.of(context)
      .loadString('assets/loadjson/historia.json').then((value) {
        raw_details = value;
        new_dados = json.decode(raw_details.toString());
        setState(() {
          texto = new_dados['text'];  
        });
        
        print('$raw_details ${new_dados[0]}');
      });*/

    //var newDados =

    return Scaffold(
      appBar: AppBar(
        title: Text('  '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(imagem),
            ),
            Text(
              //'Texto no Meio',
              texto,
              //jsonResult['text'],
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Lógica do botão esquerdo
                    setState(() {
                      print(jsonResult[posicaoAtual]);
                      posicaoAtual = jsonResult[posicaoAtual]['anterior'];
                    });
                  },
                  child: Text(texe),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica do botão direito
                    setState(() {
                      print(jsonResult[posicaoAtual]);
                      print(jsonResult[posicaoAtual]['text']);
                      print(jsonResult[posicaoAtual]['proxima']);
                      posicaoAtual = jsonResult[posicaoAtual]['proxima'];
                    });
                  },
                  child: Text(texd),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
