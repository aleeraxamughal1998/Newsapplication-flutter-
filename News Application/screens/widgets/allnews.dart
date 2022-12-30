import 'package:flutter/material.dart';
import 'package:mvvm_tutorial/screens/detail_screen.dart';

import '../../viewmodel/newsAtricle.dart';
import 'package:intl/intl.dart';

class AllNews extends StatelessWidget {
  const AllNews({
    Key? key,
    required this.news,
  }) : super(key: key);

  final List<NewsArticles> news;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      child: Expanded(
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) => Column(
            children: [
              Card(
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
                    subtitle: Text(DateFormat.yMEd().add_jm().format(news[index].dateTime),
                ),
                ),
              ),
              Divider()
            ],
          )
          ),
      ),
    );
  }
}