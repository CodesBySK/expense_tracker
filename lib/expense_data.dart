import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'models/expense.dart';

class ExpenseData {
  static final List<Expense> expenses = [];

  static const String _storageKey = 'expenses';

  static Future<void> loadExpenses() async {
    final prefs = await SharedPreferences.getInstance();

    final savedExpenses = prefs.getStringList(_storageKey);

    if (savedExpenses == null) {
      return;
    }

    expenses.clear();

    for (final expenseJson in savedExpenses) {
      final data = jsonDecode(expenseJson);

      expenses.add(
        Expense(
          title: data['title'],
          amount: (data['amount'] as num).toDouble(),
          category: data['category'],
          date: DateTime.parse(data['date']),
        ),
      );
    }
  }

  static Future<void> saveExpenses() async {
    final prefs = await SharedPreferences.getInstance();

    final savedExpenses = expenses.map((expense) {
      return jsonEncode({
        'title': expense.title,
        'amount': expense.amount,
        'category': expense.category,
        'date': expense.date.toIso8601String(),
      });
    }).toList();

    await prefs.setStringList(_storageKey, savedExpenses);
  }
}
