import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
       appBar: AppBar(title:Text("MYSTERIUM"),backgroundColor:Color.fromARGB(255, 37, 35, 35),centerTitle:true),
       backgroundColor:Color.fromARGB(255, 86, 83, 83),
        drawer: Drawer(
           child: Container(
    color: Color.fromARGB(255, 103, 102, 104),
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            
            UserAccountsDrawerHeader(
           decoration: BoxDecoration(
                color: Color.fromARGB(255, 109, 110, 110),
              ),
              accountEmail: Text("user@mail.com"),
              accountName: Text("Seu zé"),
              currentAccountPicture: CircleAvatar(
                child: Text("SZ"),
              ),
            ),
          ],
        ),
      ),
        ), 
        
        body: ListView(
  children: [Card(
  child: Column(
    children: [
      Image.network(  'https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg'),
      Text("faca"),
    ],
  ),
)],
),
      ),
    );
  }
}
