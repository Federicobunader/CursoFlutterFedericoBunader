import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/bar.dart';
import 'bars_list_page.dart';
import 'package:csv/csv.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bar> bars = [];

  Future<List<Bar>> loadCsvData() async {
    final rawData = await rootBundle.loadString('lib/assets/espacios-culturales.csv');
    final rowsAsListOfValues = const CsvToListConverter().convert(rawData);

    return rowsAsListOfValues.skip(1).expand((row) {
      // Solo retorna los bares donde el valor en la columna "Funcion_principal" es "BAR" y "Subcategoria" es "NOTABLE"
      if (row[1] == 'BAR' && row[2] == 'NOTABLE') {

        String phone;
        if (row[15] is int) {
          phone = row[15].toString();
        } else {
          phone = row[15];
        }

        return [Bar(
          name: row[3],
          street: row[8],
          number: row[9],
          neighborhood: row[10],
          phone: phone,
          email: row[16],
          website: row[17],
          facebook: row[19],
          twitter: row[20],
          instagram: row[21],
        )];
      }
      return Iterable<Bar>.empty();
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    loadCsvData().then((loadedBars) {
      setState(() {
        bars = loadedBars;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BarsListPage(bars: bars);
  }
}