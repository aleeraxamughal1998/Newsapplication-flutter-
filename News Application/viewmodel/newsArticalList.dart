
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_tutorial/services/webservices.dart';
import 'package:mvvm_tutorial/viewmodel/newsAtricle.dart';

import '../models/news.dart';


class NewsAtricleList extends ChangeNotifier{
List<NewsArticles> articles = [];
NewsAtricleList(){ 
  headLines();
}
  Future<void> headLines() async {
    
    List<News> news = await WebServices().fetchNewsApi();
    this.articles = news.map((items) => NewsArticles(items)).toList();
    notifyListeners();
  }

  Future<void> searchFor(String keywords) async {
    notifyListeners();
    List<News> news = await WebServices().fetchDatabySearch(keywords);
    articles = news.map((e) => NewsArticles(e)).toList();
    notifyListeners();
  }

  NewsArticles findByname(String date) {
    var data = articles.firstWhere((element) => element.dateTime.toIso8601String() == date.toString());
    return data;
  }

}