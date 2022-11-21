import 'package:counter_7/pages/custom_drawer.dart';
import 'package:counter_7/pages/budget_item.dart';
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  // Requiring the list of todos.
  const DataPage({super.key, required this.budgetItems});

  final List<BudgetItem> budgetItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: CustomDrawer(),
      //passing in the ListView.builder
      body: ListView.builder(
        itemCount: budgetItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(budgetItems[index].judul),
            subtitle: Text('${budgetItems[index].nominal}'),
            trailing: Text(budgetItems[index].jenis),
          );
        },
      ),
    );
  }
}
