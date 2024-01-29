// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'InputBox.dart';                     //  the separate, re-usable widget

//  This code is literally from the "flutter create" boilerplate,
//  but I removed the counter app (and kept the underlying structure).

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Callback Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //  This is where the magic happens...
  //  This parent widget has 3 children, each one
  //  is an InputBox widget.

  //  It takes the value entered into each, and updates the UI
  //  in real time to reveal the data as entered...

  List<String> vals = ['','',''];         //  an array of the stuff entered in the text fields
  final String nada = '<< nada >>';       //  display this when vals is empty
  String all_vals = '';                   //  display this in the UI (it is all entered stuff, comma separated)

  void generateUI( BuildContext context ) {
    //  show all of the stuff entered as a combined string
    String str = vals[0] + ', ' + vals[1] + ', ' + vals[2];
    //  if nothing entered, show "nada"
    if( str == ', , ') str = nada;
    setState(() {
      all_vals = str;
    });
  }

  @override
  void initState() {
    all_vals = nada;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text( widget.title ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputBox( 'Fruit', ( value ) { 
                  vals[0] = value; 
                  generateUI( context);
                } 
              ),
              InputBox( 'Animal', ( value ) { 
                  vals[1] = value; 
                  generateUI( context); 
                } 
              ),  
              InputBox( 'Color', ( value ) { 
                  vals[2] = value; 
                  generateUI( context); 
                } 
              ), 
              Padding(
                padding: const EdgeInsets.fromLTRB(0,12,0,0),
                child: Text('entered data:'),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text( all_vals,
                  style: TextStyle( fontSize: 24) ),
              ),              
            ]
          ),
        ),  
      ),
    );
  }
}

