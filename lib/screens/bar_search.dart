import 'package:flutter/material.dart';

import '../models/bar.dart';
import 'bar_detail_page.dart';

class BarSearch extends SearchDelegate<Bar> {
  final List<Bar> bars;

  BarSearch(this.bars);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = bars.where((bar) => bar.name.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: results.map<Widget>((bar) => ListTile(
        title: Text(bar.name),
        onTap: () {
          close(context, bar);
        },
      )).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = bars.where((bar) => bar.name.toLowerCase().contains(query.toLowerCase()));

    return ListView(
      children: suggestions.map<Widget>((bar) => ListTile(
        title: Text(bar.name),
        onTap: () {
          query = bar.name;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BarDetailPage(bar: bar),
            ),
          );
        },
      )).toList(),
    );
  }
}