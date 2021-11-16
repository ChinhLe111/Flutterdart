import 'code.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Code> parseCode(String responseBody){
  var list = json.decode(responseBody) as List<dynamic>;
  List<Code> codes = list.map((model)) => Code.fromJson(model)).toList();
  return codes;
}

Future<List<Code>> fetchCodes() async{
  final response = await http.get('https://newsapi.org/v2/everything?q=tesla&from=2021-10-16&sortBy=publishedAt&apiKey=a2a2d74705004dc59b54f8d697d20269');
  if(response.statusCode == 200){
    return compute(parseCode,response.body);
  }else{
    throw Exception('Request API Error');
  }
}