import 'package:flutter/material.dart';
import 'package:counter_7/budget_item.dart';

class BudgetItemsProvider extends ChangeNotifier {
  List<BudgetItem> budgetItems;

  BudgetItemsProvider({
    required this.budgetItems,
  });

  void addBudgetItems(BudgetItem newItem) {
    budgetItems.add(newItem);
  }
}
