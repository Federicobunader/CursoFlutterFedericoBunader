import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/bar.dart';
import 'bar_detail_page.dart';
import 'bar_search.dart';

class BarsListPage extends StatelessWidget {
  final List<Bar> bars;

  BarsListPage({required this.bars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bares notables'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: BarSearch(bars));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 40.0,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'Nombre',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Barrio',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: bars.map((Bar bar) => DataRow(
              cells: <DataCell>[
                DataCell(
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BarDetailPage(bar: bar),
                        ),
                      );
                    },
                    child: Text(bar.name),
                  ),
                ),
                DataCell(Text(bar.neighborhood)),
              ],
            )).toList(),
          ),
        ),
      ),
    );
  }
}