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

## 🚀 Getting Started

Follow these steps to get the app running on your local machine.

### Prerequisites

* Install [Flutter](https://docs.flutter.dev/get-started/install) on your machine.
* An IDE such as VS Code or Android Studio.
* An emulator or physical device to run the app.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Amr-DDD/expense-tracker.git

2. **Get dependencies:**
   ```bash
   flutter pub get
3. **Run the app:**
   ```bash
   flutter run
