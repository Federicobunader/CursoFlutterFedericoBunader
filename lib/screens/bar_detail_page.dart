import 'package:flutter/material.dart';

import '../models/bar.dart';

class BarDetailPage extends StatelessWidget {
  final Bar bar;

  BarDetailPage({required this.bar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bar.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Detalle',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Valor',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Calle')),
                DataCell(Text(bar.street)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Número')),
                DataCell(Text(bar.number.toString())),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Barrio')),
                DataCell(Text(bar.neighborhood)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Teléfono')),
                DataCell(Text(bar.phone.toString())),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Email')),
                DataCell(Text(bar.email)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Sitio web')),
                DataCell(Text(bar.website)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Facebook')),
                DataCell(Text(bar.facebook)),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Instagram')),
                DataCell(Text(bar.instagram)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}