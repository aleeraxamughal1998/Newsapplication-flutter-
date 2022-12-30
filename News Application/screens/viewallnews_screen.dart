import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_tutorial/screens/detail_screen.dart';
import 'package:mvvm_tutorial/viewmodel/newsArticalList.dart';
import 'package:mvvm_tutorial/viewmodel/newsAtricle.dart';
import 'package:provider/provider.dart';

import 'widgets/search_bar.dart';

class AllNewsScreen extends StatefulWidget {
  AllNewsScreen({super.key});
  static const routeName = '/allnewsscreen';

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  void initState() {
    // TODO: implement initState
   

    Provider.of<NewsAtricleList>(context, listen: false).headLines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsList = Provider.of<NewsAtricleList>(context);
    final news = newsList.articles;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('All News',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black38,
          fontSize: 20
        )
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, 
        icon: Icon(Icons.arrow_back, color: Colors.black38,)),
      ),
      body: SafeArea(
        child:  Column(
          children: [
            SearchBar(newsList: newsList),
            Expanded(
              child: news.isEmpty ? Center(child: CircularProgressIndicator(),) :  ListView.builder(
                    itemCount: news.length,
                    itemBuilder: (context, index) => Card(
                      elevation: 6,
                      child: ListTile(
                        hoverColor: Colors.grey,
                        title: Text(news[index].source.name,),
                        leading: news[index].urlImage == null ? Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:NetworkImage('https://media4.s-nbcnews.com/i/newscms/2019_01/2705191/nbc-social-default_b6fa4fef0d31ca7e8bc7ff6d117ca9f4.png'),
                              fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38.withOpacity(0.3),
                                  offset: Offset(2, 4),
                                  blurRadius: 8
                                )
                              ]
                        )
                        ) : Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:NetworkImage(news[index].urlImage),
                              fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38.withOpacity(0.3),
                                  offset: Offset(2, 4),
                                  blurRadius: 8
                                )
                              ]
                          )
                          ),
                          trailing: TextButton(
                            onPressed: (){
                               Navigator.of(context).pushNamed(
                        NewsDetail.routeName,
                        arguments: news[index].dateTime.toIso8601String()
                      );
                          }, 
                          child: Text('View Detail')),
                          subtitle: Text(DateFormat.yMEd().add_jm().format(news[index].dateTime),
                      ),
                      ),
                      )
                      ),
            ),
          ],
        )
          
        ),
    );
  }
}

