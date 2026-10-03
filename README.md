# 📱 Mini Expense Tracker

A Flutter-based mobile application developed.

The Mini Expense Tracker allows users the following features.

##  Features
* Add Expense
* Edit Expense
* Delete Expense
* View Expense List
* Expense Categories
* Expense Date Selection
* Total Expense Calculation
* Monthly Expense Calculation
* Form Validation
* Local Data Persistence

## Day 3 Improvements
* Search Expenses
* Category Filtering
* Category-wise Expense Summary 
* Monthly Total
* Improved UI/UX
* Empty State
   
## 📱 Application Screens

### 1. Dashboard

The dashboard displays:

* Total expense amount
* Current Month's Expense
* Total transactions
* Add Expense button
* View Expenses button

### 2. Add Expense

Users can enter:

* Expense title
* Amount
* Category
* Date

Basic validation is applied before before saving the expense.

### 3. Expense List

The expense list displays:

* Search
* Category filtering
* Edit
* Delete
* Expense date
* Expense category
* Expense amount
 
##  UI & Theme

The application uses a modern pink-based accent theme.

The interface includes:

* Pink AppBar
* Pink action buttons
* White cards
* Light background
* Rounded input fields
* Material 3 components
* Consistent spacing and typography

The Dashboard is improved to provide a more compact and organized layout, including
side-by-side summary cards and action buttons
## 🛠️ Technologies Used

* **Flutter**
* **Dart**
* **Android Studio**
* **Material Design**
* **SharedPreferences**

## 📦 Version Information

| Technology | Version |
| ---------- | ------- |
| Flutter    | 3.24.1  |
| Dart       | 3.8.1   |
| DevTools   | 2.45.1  |

## 🗂️ Project Structure

```text
lib/
│
├── main.dart
├── expense_data.dart
│
├── models/
│   └── expense.dart
│
├── screens/
│   ├── dashboard_screen.dart
│   ├── add_expense_screen.dart
│   └── expense_list_screen.dart
│
└── widgets/
    └── expense_card.dart
```

### Architecture Overview

The project follows a simple and organized structure:

* **Models** — Defines the `Expense` data model.
* **Screens** — Contains the main application screens.
* **Widgets** — Contains reusable UI components.
* **ExpenseData** — Manages the application's expense data and local persistence.
* **main.dart** — Initializes the Flutter application and theme.

## 💾 Local Persistence

The application uses **SharedPreferences** to store expenses locally on the device.

Expense information is converted into JSON before being saved.

Stored information includes:

* Title
* Amount
* Category
* Date

When the application starts, previously saved expenses are loaded automatically.

This allows expenses to remain available even after the application is closed and reopened.

##  Total Expense Calculation

The dashboard calculates the total amount of all stored expenses using Dart's `fold()` method.

The dashboard updates when expenses are added, edited, or deleted.
## Monthly Expense Calculation

In the Dashboard we also calculates the total expense for the current month.
The application compares the month and year of each expense with the current month and year and then calculates the total.

## Category-wise Expense Summary

The Dashboard provides a category summary for:
* Food
* Transport
* Shopping
* Bills
* Other

The application filters expenses by category and calculates the total amount for each category.
##  Search & Filter

The Expense List provides two ways to find expenses:

### Search

Users can search expenses by title.

### Category Filter

Users can filter expenses by:

* All
* Food
* Transport
* Shopping
* Bills
* Other

Search and category filtering can also be used together.

##  Edit & Delete

Users can edit an existing expense and update:

* Title
* Amount
* Category
* Date

Users can also delete expenses directly from the Expense List.

Changes are automatically saved to local storage.

## Validation

Basic form validation has been implemented.

The application checks that:

* Expense title is not empty.
* Amount is not empty.
* Amount is a valid number.
* Amount is greater than zero.
* A category is selected.
* A date is selected.

##  What I Learned

During this project, I practiced:

* Flutter application structure
* Dart classes and models
* Using `StatelessWidget` and `StatefulWidget`
* Navigation between screens
* Form validation
* Date selection
* List Handling
* Search and filtering
* Category-based selection
* Local data persistence
* JSON encoding and decoding
* SharedPreferences
* Reusable Flutter widgets
* UI layout using Row, Column, Card, and Expanded
  

##  Problems 

## 1. Keeping Expense Data Available Between Screens

In application I need a shared place to store expenses so that different screens could access the same data.
So I came up with solution to create an ExpenseData class to maintain the expense list and provide access to it throughout the application.

## 2. Saving Data After Restarting the Application

Initially, expenses were only stored in memory, meaning they could disappear when the application was restarted.
So I Used SharedPreferences to save expense data locally using JSON.

## Future Improvements
Possible future improvements include:

*  Cloud database integration
*  User authentication
*  Expense charts and analytics
*  Monthly and yearly report
*  Export expenses to CSV or PDF
*  Cloud synchronization across devices


## Internship Task

This project is develop as part of the:

HisabDo / XICTEK Systems — Batch 2 Internship

## Track: Flutter

Task: Mini Expense Tracker — Day 1, Day 2 & Day 3
##  Developer

**Savaira Kiran**

