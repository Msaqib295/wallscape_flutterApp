import 'package:flutter/material.dart';
import 'package:wallscape/views/screens/search.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search wallpapers",
                errorBorder : InputBorder.none,
                focusedBorder : InputBorder.none,
                focusedErrorBorder : InputBorder.none,
                disabledBorder : InputBorder.none,
                enabledBorder : InputBorder.none,
                border : InputBorder.none,
              ),
            ),
          ),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(query: _searchController.text)));
              },
              child: Icon(Icons.search))
        ],
      ),
    );
  }
}
