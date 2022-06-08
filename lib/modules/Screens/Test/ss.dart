import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ff extends StatelessWidget {
  const ff({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ExpansionWidget(
        initiallyExpanded: true,
        titleBuilder: (double animationValue, _, bool isExpaned, toogleFunction) {
          return InkWell(
              onTap: () => toogleFunction(animated: true),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: Text(' 1')),
                    Transform.rotate(
                      angle: math.pi * animationValue / 2, // السهم بيلف يدررجة كام
                      child: const Icon(Icons.arrow_right, size: 40),
                      alignment: Alignment.center,
                    )
                  ],
                ),
              ));
        },
        content: Container(
          width: double.infinity,
          color: Colors.grey.shade100,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              const Text('lkflglfk Content'),
              SizedBox(width: 30,),
              const Text('lkflglfk Content'),
            ],
          ),
        )),
    );
  }
}
