import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search),
            labelText: 'Search for Restaurant',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), 
              gapPadding: 5
            )
          ),
        )   
    );
  }
}
