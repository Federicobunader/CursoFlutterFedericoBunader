import 'package:flutter/material.dart';

import '../models/bar.dart';
import 'bar_detail_page.dart';

class BarListItem extends StatelessWidget {
  final Bar bar;

  BarListItem({required this.bar});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(bar.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        subtitle: Text(bar.street),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BarDetailPage(bar: bar),
            ),
          );
        },
      ),
    );
  }
}