
// ignore_for_file: file_names

import 'package:finalproject/shared/Constant.dart';
import 'package:flutter/material.dart';

class FAQSScreen extends StatelessWidget {
  const FAQSScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>  ExpansionTile(
          title: Text(DataConstant.questionAnswers[index]['question']),
          children: [
            Text(DataConstant.questionAnswers[index]['answer'])
          ],
        ),
        itemCount: DataConstant.questionAnswers.length,
      ),
    );
  }



}
