import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Logo Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  // final inputBox = GlobalKey<_InputBoxState>();
  String label = 'apple';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InputBox( label, ( value ) { 
                  label = value; 
                  setState(() {
                    
                  });
                } 
              ),
              Text('list of fruits'),
              ElevatedButton(
                onPressed: () {
                  //InputBox.kkey[1]

                },
                child: Text( label ),
              ),
            ]
          ),
        ),  
      ),
    );
  }
}

class InputBox extends StatefulWidget {
  
  InputBox( String this.lbl, this.changedValue );
  String lbl;
  Function(String value) changedValue;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {

  final controller1 = TextEditingController();
  String new_val = '';

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller1,
        onChanged: (text) { 
          new_val = controller1.text; 
          widget.changedValue( new_val );
          print('>>> ${ controller1.text.toString() }'); 
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          //labelText: 'Password',
        ),
      ),
    );
  }
}
