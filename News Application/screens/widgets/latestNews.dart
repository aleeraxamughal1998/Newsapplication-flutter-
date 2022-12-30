import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_tutorial/screens/detail_screen.dart';
import 'package:mvvm_tutorial/viewmodel/newsArticalList.dart';
import 'package:mvvm_tutorial/viewmodel/newsAtricle.dart';
import 'package:provider/provider.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({super.key, required this.data});
  final List<NewsArticles> data;

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
   final ScrollController _scrollController = ScrollController();
    
  @override
  void initState() {
    
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtant = _scrollController.position.minScrollExtent;
      double maxScrollExtant = _scrollController.position.maxScrollExtent;

      animateToMaxMin(maxScrollExtant, minScrollExtant,maxScrollExtant, 25, _scrollController);
    
    });
    super.initState();
  }
  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.37,

      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: widget.data.length > 5 ? 5 : widget.data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) { 
        return Stack(
          children: [
            Card(
              margin: EdgeInsets.only(left: 10, right: 10),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                ),
              ),
              child: widget.data[index] == null ? Center(
                child: CircularProgressIndicator(),
              ) : Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                ),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.data[index].urlImage == null ? 'https://media4.s-nbcnews.com/i/newscms/2019_01/2705191/nbc-social-default_b6fa4fef0d31ca7e8bc7ff6d117ca9f4.png' :
                      widget.data[index].urlImage
                    ),
                    fit: BoxFit.cover
                  )
                )
                )       
            ),
            Positioned(
              top: 10,
              left: 20,
              right: 30,
              child: Text(widget.data[index].source.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),
              )
              ),
              Positioned(
                bottom: 30,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                                   widget.data[index].author == null ? '' : widget.data[index].author,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                  ),
                      ),
                    ),
      
                  ],
                )
                )
          ],
        );
        }
        ),
    );
  }
}