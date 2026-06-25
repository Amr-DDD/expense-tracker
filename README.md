# Flutter Expense Tracker 💸

A responsive, feature-rich expense tracking application built with Flutter. This app allows users to easily add, manage, and visualize their expenses across different categories. It fully supports both Light and Dark themes and adapts its layout for various screen sizes and orientations.

## ✨ Features

* **Track Daily Expenses:** Easily add new expenses with a title, amount, date, and category.
* **Interactive Chart Summary:** A dynamic bar chart visualizes your spending habits, grouping expenses by category (Food, Travel, Leisure/Freetime, Work).
* **Responsive Design:** The UI intelligently adapts to screen widths, switching between a stacked layout for portrait mode and a side-by-side layout for landscape or wider screens.
* **Swipe to Delete & Undo:** Swipe an expense away to delete it. A snackbar appears giving you a quick opportunity to "Undo" the action and restore the item.
* **System-Aware Theming:** Beautiful Light and Dark modes that automatically adapt to your device's system preferences.
* **Platform-Adaptive Dialogs:** Uses `CupertinoAlertDialog` for iOS and standard `AlertDialog` for Android when displaying input validation errors.
* **Custom Models:** Utilizes the `uuid` package for generating unique IDs and `intl` for clean date formatting.

---

## 📂 Project Structure

* **`lib/main.dart`**: App entry point and global theme configuration for Light and Dark modes.
* **`lib/models/expense.dart`**: Contains the `Expense` data model, `Category` enum, and `ExpenseBucket` logic.
* **`lib/widgets/expenses.dart`**: Main dashboard, state management, and responsive layout configuration.
* **`lib/widgets/chart/chart.dart`**: Bar chart container and summary logic for expense buckets.
* **`lib/widgets/chart/chart_bar.dart`**: Individual dynamic UI bars for the chart visualization.
* **`lib/widgets/expense_list/add_expense.dart`**: Modal bottom sheet form for adding new expenses with platform-specific alerts.
* **`lib/widgets/expense_list/expense_list.dart`**: Scrollable `ListView.builder` of expenses utilizing swipe-to-delete.
* **`lib/widgets/expense_list/expense_item.dart`**: Card UI detailing an individual expense's title, amount, category icon, and date.

---

## 🚀 Getting Started

Follow these steps to get the app running on your local machine.

### Prerequisites

* Install [Flutter](https://docs.flutter.dev/get-started/install) on your machine.
* An IDE such as VS Code or Android Studio.
* An emulator or physical device to run the app.

### Installation

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/Amr-DDD/expense-tracker.git](https://github.com/Amr-DDD/expense-tracker.git)
   
2. **Navigate to the project directory:**
   ```bash
   cd expense-tracker

3. **Install dependencies:**
   ```bash
   flutter pub get

4) **Run the app:**
    ```bash
    flutter run
