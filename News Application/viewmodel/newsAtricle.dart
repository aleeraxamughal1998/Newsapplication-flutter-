

import 'package:intl/intl.dart';

import '../models/news.dart';

class NewsArticles {

  final News _news;

  NewsArticles(this._news);
   
   String get author{
    return _news.author;
   }

   String get title{
    return _news.title;
   }
   String get urlImage{
    return _news.urlToImage;
   }

   Source get source{
    return _news.source;
   }

   DateTime get dateTime{
    return _news.publishedAt;
   }

   String get description{
    return _news.description;
   }
   String get url{
    return _news.url;
   }

   String get content{
    return _news.content;
   }
   
}