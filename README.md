# 📱 Mini Expense Tracker

A Flutter-based mobile application developed.

The Mini Expense Tracker allows users the following features.

##  Features

* ➕ Add expenses
* 📋 View expense list
* 💰 Calculate total expenses
* 🏷️ Expense categories
* 📅 Select expense dates
* ✏️ Edit expenses
* 🗑️ Delete expenses
* 🔍 Search expenses
* 🔎 Filter expenses by category
* 💾 Local data persistence
* ✅ Form validation
* 🎨 Consistent color theme
* 📱 Navigation between screens
* 🔄 Automatic dashboard updates
* 📊 Total transaction count
* 🎯 Responsive and user-friendly UI

## 📱 Application Screens

### 1. Dashboard

The dashboard displays:

* Total expense amount
* Total number of transactions
* Add Expense button
* View Expenses button

### 2. Add Expense

Users can enter:

* Expense title
* Amount
* Category
* Date

The form validates the entered information before saving the expense.

### 3. Expense List

The expense list displays:

* Expense title
* Amount
* Category
* Date
* Category icon
* Edit option
* Delete option

The screen also provides:

* Search functionality
* Category filters

##  UI & Theme

The application uses a modern pink-based color theme.

The interface includes:

* Pink AppBar
* Pink action buttons
* White cards
* Light background
* Rounded input fields
* Material 3 components
* Consistent spacing and typography

## 🛠️ Technologies Used

* **Flutter**
* **Dart**
* **Android Studio**
* **Material 3**
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

* Creating a Flutter application
* Building UI with Flutter widgets
* Using `StatelessWidget` and `StatefulWidget`
* Creating Dart models
* Organizing a Flutter project
* Form validation
* Text input handling
* Dropdown menus
* Date pickers
* Screen navigation
* Passing data between screens
* Creating reusable widgets
* Managing application state
* Using `setState()`
* Searching and filtering lists
* Editing and deleting data
* Calculating values using Dart collection methods
* Local data persistence using SharedPreferences
* Creating a consistent application theme
* Debugging and using `flutter analyze`

## ⚠️ Challenges Faced

Some challenges during development included:

* Managing shared expense data between screens.
* Updating the dashboard after adding, editing, and deleting expenses.
* Persisting expense data locally.
* Handling asynchronous operations safely.
* Fixing Flutter analyzer warnings.

These challenges helped improve my understanding of Flutter application structure and state management.

## 🚀 Future Improvements

Possible future improvements include:

*  Cloud database integration
*  User authentication
*  Expense charts and analytics
*  Monthly and yearly report
*  Export expenses to CSV or PDF
*  Cloud synchronization across devices

##  Developer

**Savaira Kiran**

Flutter Developer — Internship Trainee

---

Developed for practical learning and experience in Flutter application development.
