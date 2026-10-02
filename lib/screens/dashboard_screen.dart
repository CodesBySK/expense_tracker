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
  double get totalExpense {
    return ExpenseData.expenses.fold(
      0,
          (sum, expense) => sum + expense.amount,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor:   Colors.white,//deepOrangeAccent.shade100,
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        //backgroundColor:   Colors.pinkAccent.shade100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome to Expense Tracker',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Keep track of your daily expenses',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 25),

            // Total Expense Card
            Card(
              elevation: 4,
              //color: Colors. deepOrangeAccent.shade100,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(
                      Icons.account_balance_wallet,
                      size: 45,
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Total Expense',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Rs. ${totalExpense.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Number of Expenses
            /*Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.receipt_long),
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Text(
                        'Total Transactions',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Text(
                      '${ExpenseData.expenses.length}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
*/
            //const SizedBox(height: 30),

            // Add Expense
            ElevatedButton.icon(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddExpenseScreen(),
                  ),
                );

                setState(() {});
              },
              icon: const Icon(Icons.add),

              label: const Text('Add Expense',style: TextStyle(color: Colors.black)
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),

            ),

            const SizedBox(height: 12),

            // View Expenses
            OutlinedButton.icon(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpenseListScreen(),
                  ),
                );

                setState(() {});
              },

              icon: const Icon(Icons.list_alt),
              label: const Text('View Expenses',style: TextStyle(color: Colors.black),),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}