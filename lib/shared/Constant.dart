// ignore_for_file: file_names, avoid_print

import 'package:finalproject/models/infectedData/infectedModel.dart';

String baseUrl = 'https://csi-covid19.000webhostapp.com/api/';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
var userid;
var RolId;
var Indexed;
 String token ='';

