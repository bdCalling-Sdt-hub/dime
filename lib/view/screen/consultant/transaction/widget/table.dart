import 'package:dime/view/common_widgets/text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: CustomText(text: '#SI'),
          ),
          DataColumn(
            label: CustomText(text: 'Full Name'),
          ),
          DataColumn(
            label: CustomText(text: 'Acc Number'),
          ),
          DataColumn(
            label: CustomText(text: 'Date'),
          ),
          DataColumn(
            label: CustomText(text: 'Amount'),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('1')),
              DataCell(Text('John Doe')),
              DataCell(Text('1234567890')),
              DataCell(Text('2023-01-01')),
              DataCell(Text('\$1000')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('2')),
              DataCell(Text('Jane Smith')),
              DataCell(Text('2345678901')),
              DataCell(Text('2023-02-01')),
              DataCell(Text('\$1500')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('3')),
              DataCell(Text('Paul Brown')),
              DataCell(Text('3456789012')),
              DataCell(Text('2023-03-01')),
              DataCell(Text('\$2000')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('4')),
              DataCell(Text('Alice Green')),
              DataCell(Text('4567890123')),
              DataCell(Text('2023-04-01')),
              DataCell(Text('\$2500')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('5')),
              DataCell(Text('Bob White')),
              DataCell(Text('5678901234')),
              DataCell(Text('2023-05-01')),
              DataCell(Text('\$3000')),
            ],
          ),
        ],
      ),
    );
  }
}
