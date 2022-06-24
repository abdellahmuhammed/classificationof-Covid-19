import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsOfCountries extends StatelessWidget {
  const StatisticsOfCountries({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CovidHomeLayouCubit , CovidHomeLayouState>(
      listener: (context, state) {},
      builder: (context , state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Countries Status'),
          ),
          body: ConditionalBuilder(
            condition: CovidHomeLayouCubit.get(context).getDataOfCountriesList != null,
            builder: (BuildContext context) => buildStatisticsOfCountries(context),
            fallback: (BuildContext context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  Widget buildStatisticsOfCountries( context) => ListView.builder(
      physics: const BouncingScrollPhysics(),
      // itemCount: countriesData == null ? 0 : countriesData.length,
      itemCount: CovidHomeLayouCubit.get(context).getDataOfCountriesList.length,
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            height: 130,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey[100],
                  offset: const Offset(0, 10),
                  blurRadius: 10)
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        '${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['countryInfo']['flag']}' ,
                        // countriesData[index]['countryInfo']['flag'],
                        height: 50,
                        width: 60,
                      ),
                      Text(
                        '${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['country']}' ,
                        // countriesData[index]['country'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                       Text(
                        'CONFIRMED:${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['cases']}',
                        //countriesData[index]['cases'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                       Text(
                        'ACTIVE:${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['active']}',
                        //countriesData[index]['active'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                       Text(
                        'RECOVERED: ${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['recovered']}',
                        //countriesData[index]['recovered'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      Text(
                        'DEATHS: ${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['deaths']}',
                        // +countriesData[index]['deaths'].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
  );
}
