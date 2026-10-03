import 'package:flutter/material.dart';

import '../expense_data.dart';
import 'add_expense_screen.dart';
import 'expense_list_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Calculate total expenses
  double get totalExpense {
    return ExpenseData.expenses.fold(0, (sum, expense) => sum + expense.amount);
  }

  // Calculate current month's expenses
  double get monthlyExpense {
    final now = DateTime.now();

    return ExpenseData.expenses
        .where(
          (expense) =>
              expense.date.month == now.month && expense.date.year == now.year,
        )
        .fold(0, (sum, expense) => sum + expense.amount);
  }

  // Calculate total for a specific category
  double categoryTotal(String category) {
    return ExpenseData.expenses
        .where((expense) => expense.category == category)
        .fold(0, (sum, expense) => sum + expense.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome
            const Text(
              'Welcome to Expense Tracker',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            const Text(
              'Keep track of your daily expenses',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Total & Monthly Expense
            Row(
              children: [
                Expanded(
                  child: _summaryCard(
                    title: 'Total Expense',
                    amount: totalExpense,
                    icon: Icons.account_balance_wallet_rounded,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _summaryCard(
                    title: 'This Month',
                    amount: monthlyExpense,
                    icon: Icons.calendar_month_rounded,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Total Transactions
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(
                        0xFFFF84AE,
                      ).withValues(alpha: 0.15),
                      child: const Icon(
                        Icons.receipt_long_rounded,
                        color: Color(0xFFFF84AE),
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Text(
                        'Total Transactions',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Text(
                      '${ExpenseData.expenses.length}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Action Buttons
            Row(
              children: [
                // Add Expense
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddExpenseScreen(),
                          ),
                        );

                        setState(() {});
                      },
                      icon: const Icon(Icons.add_rounded),
                      label: const Text(
                        'Add Expense',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // View Expenses
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExpenseListScreen(),
                          ),
                        );

                        setState(() {});
                      },
                      icon: const Icon(Icons.list_alt_rounded),
                      label: const Text(
                        'View Expenses',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Category Summary
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Category Summary',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    _categoryRow(
                      'Food',
                      Icons.restaurant,
                      categoryTotal('Food'),
                    ),

                    _categoryRow(
                      'Transport',
                      Icons.directions_car,
                      categoryTotal('Transport'),
                    ),

                    _categoryRow(
                      'Shopping',
                      Icons.shopping_bag,
                      categoryTotal('Shopping'),
                    ),

                    _categoryRow(
                      'Bills',
                      Icons.receipt,
                      categoryTotal('Bills'),
                    ),

                    _categoryRow(
                      'Other',
                      Icons.more_horiz,
                      categoryTotal('Other'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Summary Card
  Widget _summaryCard({
    required String title,
    required double amount,
    required IconData icon,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFFF84AE).withValues(alpha: 0.15),
              child: Icon(icon, size: 21, color: const Color(0xFFFF84AE)),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 3),

            Text(
              'Rs. ${amount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Category Row
  Widget _categoryRow(String category, IconData icon, double amount) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 22),

          const SizedBox(width: 12),

          Expanded(child: Text(category, style: const TextStyle(fontSize: 16))),

          Text(
            'Rs. ${amount.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
