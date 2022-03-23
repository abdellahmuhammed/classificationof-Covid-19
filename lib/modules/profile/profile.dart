import 'package:finalproject/modules/updateProfile/UpdateProfile.dart';
import 'package:finalproject/shared/component.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  var Usercontroller = TextEditingController();
   ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 50),
              child: Container(
                height: MediaQuery.of(context).size.height * .145,
                child: Column(
                  children: const [
                    Center(
                      child: Image(
                        image: AssetImage('assets/images/R.png'),
                        height: 80,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 15.0),
              child: Row(
                children: [
                  Text('Personal Information'),
                  Spacer(),
                  MaterialButton(onPressed: (){
                    NavigateTo(context, UpdateProfileScreen());
                  },
                  child: Text('Edit' , style: Theme.of(context).textTheme.bodyText1,),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsetsDirectional.only(start: 15.0),
                child: defultProfileRow(
                  context,
                  onPressed: () {
                    defultTextFormFiled(
                        context,
                        controller: Usercontroller,
                        type: TextInputType.text,
                        label: '',
                        prefixIcon: Icons.edit,
                        validate: (){

                        },
                    );
                  },
                  text1: 'UserName',
                  text2: 'Abdellah Muhammed',
                  width: 75,
                )),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 15.0),
              child: defultProfileRow(
                context,
                onPressed: () {},
                text1: 'phone number',
                text2: '01126017421',
              ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.only(start: 15.0),
                child: defultProfileRow(context,
                    onPressed: () {},
                    text1: 'Email',
                    text2: 'abdo@gmail.com',
                    width: 112)),
            Padding(
                padding: const EdgeInsetsDirectional.only(start: 15.0),
                child: defultProfileRow(context,
                    onPressed: () {},
                    text1: 'National Id',
                    text2: '12345678912345',
                    width: 75)),
            Padding(
                padding: const EdgeInsetsDirectional.only(start: 15.0),
                child: defultProfileRow(context,
                    onPressed: () {},
                    text1: 'Address',
                    text2: 'October',
                    width: 95)),
          ],
        ),
      ),
    );
  }
}
