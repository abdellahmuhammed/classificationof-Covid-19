// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../shared/component.dart';

class NewsScreen extends StatelessWidget {
   const NewsScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index)=> MyDivider(),
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.2,
                width: MediaQuery.of(context).size.width*.5,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/2.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'title',
                      style: Theme.of(context).textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      maxLines: 3,
                    ),
                    // Text(
                    //   '${article['description']}',
                    //   style: Theme.of(context).textTheme.bodyText2,
                    //   textDirection: TextDirection.rtl,
                    // ),
                    Text(
                      'publishedAt',
                      style: Theme.of(context).textTheme.bodyText2,
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        itemCount: 10,

      )

    );
  }
}
