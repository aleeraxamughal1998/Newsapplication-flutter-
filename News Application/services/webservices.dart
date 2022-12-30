
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/news.dart';

class WebServices{

  Future< List<News>> fetchDatabySearch(String keywords) async {
    final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=$keywords&apiKey=72c9d74ab6924664a24a04a8ccc12bae'));
    

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((e) => News.fromJson(e)).toList();
    }
    else {
      throw Exception('Error ');
    }
  }
  Future<List<News>> fetchNewsApi() async {

    final response = await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=72c9d74ab6924664a24a04a8ccc12bae'));
     
    if(response.statusCode == 200){
       final result = jsonDecode(response.body.toString());
      Iterable list = result['articles'];
      return list.map((items) => News.fromJson(items)).toList();
    }
    else {
      throw Exception('No Result Found');
    }
    

  }
}