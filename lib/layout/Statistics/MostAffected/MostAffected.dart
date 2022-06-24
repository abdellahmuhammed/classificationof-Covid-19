import 'package:finalproject/layout/cubit/home%20cuibt/covid_home_layou_cubit.dart';
import 'package:flutter/material.dart';


class MostAffected extends StatelessWidget {

  final List countryData;
  const MostAffected({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Row(
          children:[
            Image.network(
              '${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['countryInfo']['flag']}',
              height: 30, width: 30,),
            const SizedBox(width: 10,),
             Text( '${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['country']}' ,
              style: const TextStyle(fontWeight: FontWeight.bold), ),
            const SizedBox(width: 10,),
             Text('${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['cases']}',
              style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(width: 10,),
            Text('${CovidHomeLayouCubit.get(context).getDataOfCountriesList[index]['deaths']}',
              style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        );
      },
      itemCount: 5,
    );
  }
}
