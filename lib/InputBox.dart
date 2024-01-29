// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

//  this is a re-usable TextField that:
//    1.  allows a custom label
//    2.  passes back the string value it receives to the parent
//        (as a call back funciton with the value, as it changes )

class InputBox extends StatefulWidget {
  
  InputBox( String this.lbl, this.changedValue ); 
  String lbl;                                     //  the textfield label
  Function(String value) changedValue;            //  the callback function 

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {

  final controller_1 = TextEditingController();
  String new_val = '';

  @override
  void dispose() {
    controller_1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller_1,
        onChanged: (text) { 
          new_val = controller_1.text; 
          widget.changedValue( new_val );
          print('>>> ${ controller_1.text.toString() }'); 
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.lbl,
            //  hintText: widget.lbl,
        ),
      ),
    );
  }
}
