// ignore_for_file: camel_case_types

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/modules/DoctorScreens/DoctorHomelayoutScreen.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_cubit.dart';
import 'package:finalproject/modules/DoctorScreens/cubit/doctor_state.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class detileScreen extends StatelessWidget {
  const detileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! DoctorLoadingState,
              builder: (BuildContext context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildHomeScreen(context: context, index: index,),
                separatorBuilder: (context, index) => MyDivider(),
                itemCount: DoctorCubit.get(context).getInfectedUser.data.length,
              ),
              fallback: (BuildContext context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                DoctorCubit.get(context).addVoting();
                defaultFlutterToast(
                  msg: 'Success',
                  background: Colors.red,
                );
                NavigateAndRemove(context, DoctorHomeLayoutScreen());
              },
              child: Text(
                'Send', style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }

  Widget buildHomeScreen({context, index}) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DoctorCubit.get(context).getInfectedUser.data[index].patient,
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            RadioListTile(
                title: const Text('covid19'),
                value: 1,
                groupValue: DoctorCubit.get(context).value,
                onChanged: (value) {
                  DoctorCubit.get(context).changeRado(value);
                },
                ),
            RadioListTile(
                title: const Text('Uninfected'),
                value: 2,
                groupValue: DoctorCubit.get(context).value,
                onChanged: (v) {
                  DoctorCubit.get(context).changeRadoBotton(v);
                }),
            RadioListTile(
                title: const Text('Pneumonia'),
                value: 3,
                groupValue: DoctorCubit.get(context).value,
                onChanged: (gg) {
                  DoctorCubit.get(context).changeRadoIndex(gg);
                }),
          ],
        ),
      );
}
