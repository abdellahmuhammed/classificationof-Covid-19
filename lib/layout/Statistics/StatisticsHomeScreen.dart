import 'package:finalproject/layout/Statistics/statistics%20of%20Egypt%20Screen/statistics%20of%20Egypt.dart';
import 'package:finalproject/layout/Statistics/statistics%20of%20world%20Screen/statistics%20of%20world.dart';
import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:finalproject/layout/detilsScreen/detilsScreen.dart';
import 'package:finalproject/shared/Constant.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsHomeScreen extends StatelessWidget {
  const StatisticsHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CovidHomeLayouCubit, CovidHomeLayouState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.blueGrey[50]),
          title:  Text('Statistics ' , style: Theme.of(context).textTheme.bodyText1,),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .1,
                  color: Colors.orange.withOpacity(.2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      DataConstant.MyContainerString,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Statistics of World',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                      ),
                      InkWell(
                        onTap: (){
                          NavigateTo(context, const StatisticsOfEgypt());
                        },
                        child: Text(
                          'Statistics of Egypt',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                CovidHomeLayouCubit
                    .get(context)
                    .covidStaticsOfWorld == null
                    ? const Center(child: CircularProgressIndicator())
                    : const StatisticsOfWorld(),
                const SizedBox(height: 15,),
                const DetailsScreen()
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            CovidHomeLayouCubit.get(context).getStaticsOfWorld();
          },
        ),
      ),
    );
  },
);
  }
}
