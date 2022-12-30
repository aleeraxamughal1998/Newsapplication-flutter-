import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/newsArticalList.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    required this.newsList,
  }) : super(key: key);

  final NewsAtricleList newsList;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: _controller,
        onFieldSubmitted: (val){
          if(val != null){
         widget.newsList.searchFor(val);
          } 
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          suffixIcon: IconButton(
            onPressed: (){
              _controller.clear();
              setState(() {
                 Provider.of<NewsAtricleList>(context,listen: false).headLines();
              });
            }, 
            icon: Icon(Icons.clear))
        ),
      ),
    );
  }
}