import 'package:flutter/material.dart';
import 'package:mk_drop_down_menu/mk_drop_down_menu.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MKDropDownMenu'),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: MKDropDownMenu(
              headerBuilder: (bool menuIsShowing) {
                return Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: BorderSide(
                        color: Color(0xFFEEF0F2),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Header',
                        style: TextStyle(
                          color: menuIsShowing ? Colors.blue : Colors.black,
                        ),
                      ),
                      Icon(
                        menuIsShowing ? Icons.expand_less : Icons.expand_more,
                        color: menuIsShowing ? Colors.blue : Colors.black,
                      ),
                    ],
                  ),
                );
              },
              menuBuilder: () {
                return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: const Text(

                  'asssssssssssfgggggggggggggggggggggggggggggggsssssss',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}