// ignore_for_file: file_names

String baseUrl = 'https://csi-covid19.000webhostapp.com/api/';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


 String token ='';
 String myToken ='f72d3b422a79a83afb2df462ebc1d74a';
