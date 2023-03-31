import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      home: const MyHomePage(),
    );
    
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey, Colors.black])),
      child:  Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text(
          "Tic Tac Toe\n",
           style: TextStyle(fontWeight: FontWeight.w700, color: Color.fromARGB(255, 255, 255, 255), fontSize:50.0),
          ),
          
          new SizedBox(
            width: 180.0,
            height: 60.0,
            child: ElevatedButton(
            onPressed: () async {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => HomeScreen()));
              
            },
            child: Text("Play ▶"),
            style: ElevatedButton.styleFrom(primary: Color.fromARGB(184, 255, 41, 41)),
            )
          )
          ],
        )
      ),
    ),
    );
  }
}