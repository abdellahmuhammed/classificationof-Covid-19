
import 'package:finalproject/modules/LoginScreen/Login_Screen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/styles/colors.dart';

class BoardingModel
{
  final String title;
  final String image;

  BoardingModel({@required this.title, @required this.image});
}

class OnBoardingScreen extends StatefulWidget
{
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var OnBoardingCotroller = PageController();

  List<BoardingModel> BoardingList = [
    BoardingModel(
      title:
      'تأكـد مـن اتباعـك أنـت والمحيطيـن بـك ممارسـات النظافـة الجيـدة و تنفـس هـواء النقـي',
      image: 'assets/images/1.png',
    ),
    BoardingModel(
      title:
      'تتمثــل أعــراض الاكثـر شــيوعًا لمــرض كوفيــد-19 فــي الحمــى ',
      image: 'assets/images/2.png',
    ),
    BoardingModel(
        title:
        'اســتخدام الكمامــات الواقيــة اثنــاء الجلــوس مـع اكثـر مـن اثنيـن او عنـد الخـروج مـن المنـزل',
        image: 'assets/images/3.png'),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defultTextButton( context,
            function: () {
              NavigateAndRemove( context,  HomeLoginScreen());
            },
            text: 'skip',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: OnBoardingCotroller,
                onPageChanged: (int index) {
                  if (index == BoardingList.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    ItemBilder(BoardingList[index]),
                itemCount: BoardingList.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator
                  (
                  controller: OnBoardingCotroller,
                  count: BoardingList.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: deepOrange,
                    expansionFactor: 4,
                    spacing: 6,
                    dotWidth: 10,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast == true) {
                      NavigateAndRemove(context,  HomeLoginScreen());
                    } else {
                      OnBoardingCotroller.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ItemBilder(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(
        image: AssetImage(model.image),
        height: 450,
      ),
      const SizedBox(
        height: 20.0,
      ),
      Text(
        model.title,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.bodyText2,
      ),
      const SizedBox(
        height: 20.0,
      ),
    ],
  );
}
