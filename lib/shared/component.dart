// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:conditional_builder/conditional_builder.dart';
import 'package:finalproject/layout/cubit/DarkMode/dark_mode_cubit.dart';
import 'package:finalproject/modules/PatientScreens/cubit/Patient_cubit.dart';
import 'package:finalproject/modules/Screens/LoginScreen/Login_Screen.dart';
import 'package:finalproject/shared/local/catchhelper.dart';
import 'package:finalproject/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';


Widget BuilderItem(article, context) => InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15.0)),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${article['title']}',
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
                    '${article['publishedAt']}',
                    style: Theme.of(context).textTheme.bodyText2,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget defultContainer(
  context, {
  Color color = grey,
  @required String text1,
  @required String text2,
  double radius = 15,
  double height,
  double width,
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceEvenly,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            text2,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );

Widget ArticleItemBuilder(list, {isSearch}) => ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (BuildContext context) => ListView.separated(
        itemBuilder: (BuildContext context, int index) =>
            BuilderItem(list[index], context),
        separatorBuilder: (BuildContext context, int index) => MyDivider(),
        itemCount: list.length,
      ),
      fallback: (BuildContext context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(
              color: Colors.brown,
            )),
    );

Widget MyDivider() => Container(
      color: Colors.grey,
      width: double.infinity,
      height: 2.0,
    );

void NavigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Widget),
    );

Widget defultTextFormFiled(
  context, {
  @required TextEditingController controller,
  @required TextInputType type,
  @required String label,
  @required IconData prefixIcon,
  IconData suffixIcon,
  @required Function validate,
  Function onSubmit,
  Function,
  Function onTap,
  bool isPassword = false,
  double radius = 0,
  int maxLength,
  int maxLines = 1,
  int minLines = 1,
      bool enabled,
  Function suffixPressed,
  Function onchange,
  Color cursorColor,
  TextDirection textdirection = TextDirection.rtl,
}) =>
    TextFormField(
      enabled: enabled,
      controller: controller,
      keyboardType: type,
      cursorColor: cursorColor,
      onTap: onTap,
      enableInteractiveSelection: false,
      onChanged: onchange,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        label: Text(
          label,
          textDirection: textdirection,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffixIcon),
              )
            : null,
      ),
      validator: validate,
      obscureText: isPassword,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      onFieldSubmitted: onSubmit,
    );

Widget defultTextButton(
  context, {
  @required Function function,
  @required String text,
  Color color,
  Color backgroundColor,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          backgroundColor: backgroundColor,
        ),
      ),
    );

void NavigateAndRemove(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) => false);

Widget defultAppBar() => AppBar(
      backgroundColor: grey,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: grey),
    );

Widget defultImage({
  double ContainerHeight = 300,
  double ContainerWidth = 400,
  double radius = 20,
  @required ImageProvider Image,
  BoxFit fit = BoxFit.cover,
  Color color = Colors.white24,
  String text,
  Widget Widget,
}) =>
    Container(
      height: ContainerHeight,
      width: ContainerWidth,
      decoration: BoxDecoration(
        color: color,
        image: DecorationImage(
          image: Image,
          fit: fit,
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Widget,
    );

Widget defultMaterialButton({
  double radius = 0,
  double height = 50,
  double width = double.maxFinite,
  @required Function function,
  @required String text,
  Color TextColor = Colors.black,
  Color background = Colors.blueGrey,
  double fontSize = 23,
  FontWeight fontWeight = FontWeight.bold,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
              color: TextColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );

Widget defultProfileRow(
   {
     context,
   Function onPressed,
  @required String text1,
  @required String text2,
  double width = 50.2,
     Function validate,
}) =>
    Row(
      children: [
        Text(
          text1,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          width: width,
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              text2,
              style: Theme.of(context).textTheme.bodyText2,
            ),
        ),
      ],
    );

Future<bool> defaultFlutterToast({
  @required String msg,
  @required Color background,
  Color textColor,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: background,
      textColor: Colors.white,
      fontSize: 16.0,
    );

Widget defaultTextButtonDrawer({
  context,
 @required Function onPressed,
  @required  IconData icon,
  @required  String text
})=> TextButton(
  onPressed:onPressed,
  child: Row(
    children:  [
      Icon(icon),
      const SizedBox(
        width: 20,
      ),
      Text(text),
    ],
  ),
);


Widget defaultPersonalInfoRow({
  context,
  @required TextEditingController controller,
  @required IconData PrefixIcon ,
  Function validate  ,
  TextInputType type,
  String label ='',
  @required String text,

})=>Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(text ,style: Theme.of(context).textTheme.bodyText1,
    ),
    SizedBox(
      width: MediaQuery.of(context).size.width*.6,
      height: MediaQuery.of(context).size.height*.04,
      child: defultTextFormFiled(
          context,
          controller: controller,
          prefixIcon:PrefixIcon ,
          validate: validate,
          type: type,
          label: label
      ),
    ),
  ],
);

Widget defultDrawer(context,
    @required String Name,
    @required int Phone,
    @required  Widget goToProfile,
    ) =>
    SizedBox(
      width: 220,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/R.png', height: 91,),
              const SizedBox(
                height: 15.0,
              ),
              Text(Name,),
              const SizedBox(
                height: 15.0,
              ),
              Text('${Phone.round()}'),
              const SizedBox(
                height: 15.0,
              ),
              defaultTextButtonDrawer(
                  onPressed:(){
                    NavigateTo(context, goToProfile);
                  },
                  icon: Icons.person,
                  text: 'Profile'
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: const [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Connect With us'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              defaultTextButtonDrawer(
                  onPressed: () {
                    CatchHelper.removeUserData(key: 'check').then((value) {
                      CatchHelper.removeUserData(key: 'RolId');
                      CatchHelper.removeUserData(key: 'token');

                      if (value) {
                        NavigateAndRemove(context, LoginScreen());
                      }
                    });
                  },
                  icon: Icons.logout,
                  text: 'Logout'
              ),
            ],
          ),
        ),
      ),
    );
void _launchURL(String _url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}

Widget defaultLaunchRrl ( {
  @required IconData icon,
  @required String Url,
})=>IconButton(
  icon:  Icon(icon),
  onPressed: (){
    _launchURL(Url);
  },
);

