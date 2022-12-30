import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_tutorial/viewmodel/newsArticalList.dart';
import 'package:mvvm_tutorial/viewmodel/newsAtricle.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NewsDetail extends StatelessWidget {
  static const routeName = '/newsdetail';
 const NewsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final detail = ModalRoute.of(context)?.settings.arguments;
    final newsDetail = Provider.of<NewsAtricleList>(context, listen: false).findByname(detail.toString());
    return Scaffold(
      body:  SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: newsDetail.urlImage == null ? SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Image.network( 'https://media4.s-nbcnews.com/i/newscms/2019_01/2705191/nbc-social-default_b6fa4fef0d31ca7e8bc7ff6d117ca9f4.png', fit: BoxFit.cover,),
              )
              : SizedBox(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Image.network( newsDetail.urlImage, fit: BoxFit.cover,),
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    }, 
                    icon: Icon(
                      Icons.arrow_back, 
                      color: Colors.white,
                      )
                    ),
                    SizedBox( width:  20,),
                    Container(
                      child: Text(
                          newsDetail.source.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                    ),
                ],
              )
                ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsDetail.title, style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                      SizedBox(height: 20,),
                      Text(newsDetail.description == null ? '' : newsDetail.description),
                      SizedBox(height: 20),
                      Text(newsDetail.content == null ? '' : newsDetail.content),
                      TextButton(
                        onPressed:() async {
                          String url = newsDetail.url;
                          if(await canLaunch(url))
                          {
                            await launch(url, forceWebView: false);
                            }
                            else{
                              throw 'Error';
                            }
                      },
                      child: Text(newsDetail.url)),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}