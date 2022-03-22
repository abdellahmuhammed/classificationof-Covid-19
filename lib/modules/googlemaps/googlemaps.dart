import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../shared/component.dart';

class GoogleMapsScreen extends StatelessWidget {
  const GoogleMapsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter your location',
              style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 20,),

              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height*.7,
                  width: double.infinity,
                  child: const GoogleMap(
                      initialCameraPosition: CameraPosition(
                    target: LatLng(31.233334, 30.033333),
                    zoom: 15,
                  )),
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: defultMaterialButton(function: (){}, text: 'Insert' ,
                background: countainerColor,),
              ),
            ],
          ),
        ));
  }
}
