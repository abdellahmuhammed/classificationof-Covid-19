import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject/layout/cubit/Covid_19App/covid_19_app_cubit.dart';
import 'package:flutter/material.dart';

import '../../shared/Constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child:DropdownButton2(
              hint: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme
                      .of(context)
                      .hintColor,
                ),
              ),
            items: items
                .map((item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            buttonHeight: 40,
            buttonWidth: 140,
            itemHeight: 40,
          ),
        ),
      ),
    );


  }
}



//DropdownButton<int>(
//           items: integer.map((int e) {
//
//             return DropdownMenuItem<int>(
//               value: e,
//               child: Text(e.toString()),
//             );
//           }),
//           onChanged:(int index){
//            setState(() {
//              index=selected;
//            });
//           } ,
//           value: selected,
//         ),