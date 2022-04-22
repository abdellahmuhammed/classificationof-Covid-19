// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:finalproject/layout/cubit/DoctorCubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/HomelayoutScreen.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagnosisScreen extends StatelessWidget {
   DiagnosisScreen({Key key}) : super(key: key);
  var userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => DoctorCubit(),
  child: BlocConsumer<DoctorCubit, DoctorState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Image.network(
                  'https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg',
                  height: MediaQuery.of(context).size.height * .5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'user name',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .6,
                        height: MediaQuery.of(context).size.height * .046,
                        child: defultTextFormFiled(
                          context,
                          controller: userNameController,
                          prefixIcon: Icons.person,
                          enabled: false,
                          validate: null,
                          type: null,
                          label: 'user name',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                      ' Select diagnosis',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                      const SizedBox(width: 40,),
                      DropdownButton2(
                        hint: Text('Select here',
                            style: Theme.of(context).textTheme.bodyText2),
                        items: DoctorCubit.get(context)
                            .items
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        value: DoctorCubit.get(context).selectedValue,
                        onChanged: (index) {
                          DoctorCubit.get(context).changeRadioIndex(index);
                        },
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Center(
                  child: defultMaterialButton(
                      function: (){
                        defaultFlutterToast(msg: 'Diagnosis done successfully', background: Colors.grey);
                        NavigateAndRemove(context, const DoctorHomeScreen());
                      },// هنا هيروح فين بالظبط
                      text: 'Send' ,
                    background: Colors.grey.withOpacity(.4),
                    width: MediaQuery.of(context).size.width*.4
                  ),
                ),
              ],
            ),
          ),
        );
  },
),
);
  }
}
