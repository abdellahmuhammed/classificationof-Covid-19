import 'package:flutter/material.dart';


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _value ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildRadioButton(),
      ),
    );
  }


  Widget buildRadioButton() => Column(
    children: [
      RadioListTile(
        title: Text('value'),
          value: 1,
          groupValue: _value,
          onChanged: (index){
            setState(() {
              _value = index;
            });
          }
      ),
      Row(
        children: [
          const Text('Covid 19 '),
           SizedBox(
            width: MediaQuery.of(context).size.width*.03,
          ),
          Radio(
            value: 1,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ],
      ),
      Row(
        children: [
          const Text('UnInflicted '),

          Radio(
            value: 2,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ],
      ),
      Row(
        children: [
          const Text('pneumonia'),

          Radio(
            value: 3,
            groupValue: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ],
      ),

    ],
  );
}
