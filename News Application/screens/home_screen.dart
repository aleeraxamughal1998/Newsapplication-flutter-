import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_tutorial/screens/viewallnews_screen.dart';
import 'package:mvvm_tutorial/screens/widgets/latestNews.dart';
import 'package:mvvm_tutorial/viewmodel/newsArticalList.dart';
import 'package:mvvm_tutorial/viewmodel/newsAtricle.dart';
import 'package:provider/provider.dart';

import 'widgets/allnews.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  


  @override
  Widget build(BuildContext context) {
    final items = Provider.of<NewsAtricleList>(context);
    final news = items.articles;
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily News', style: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w800
        ),),
        leading: Icon(Icons.newspaper, color: Colors.black38,),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        ),

      body: news.isEmpty ?  Center(child: CircularProgressIndicator()) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatestNews(data: news,),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left:10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Explore',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                ),
                TextButton(
                  onPressed: (){
                  Navigator.of(context).pushNamed(
                    AllNewsScreen.routeName,
                  );
                }, 
                child: Text('View All')
                )
              ],
            ),
          ),
          AllNews(news: news),
        ],
      ),
    );
  }
}

