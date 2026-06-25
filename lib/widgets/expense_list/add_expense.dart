import 'dart:io';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense(this.onAddExpense, {super.key});

  final void Function(Expense expense) onAddExpense;

  @override
  State<AddExpense> createState() {
    return _AddExpense();
  }
}

class _AddExpense extends State<AddExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCateogry = Category.food;

  void selectDate() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: Text('Invalid Input'),
          content: const Text(
            'Please fill all data; tite, amount and choose a date',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Okay"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: const Text(
            'Please fill all data; tite, amount and choose a date',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Okay"),
            ),
          ],
        ),
      );
    }
  }

  void _submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialog();

      return;
    }
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCateogry,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    // 1. Define the repeating UI pieces ONCE as variables
    final titleField = TextField(
      controller: _titleController,
      maxLength: 50,
      decoration: const InputDecoration(label: Text("Title")),
    );

    final amountField = TextField(
      controller: _amountController,
      maxLength: 20,
      decoration: const InputDecoration(
        prefixText: '\$',
        label: Text("Amount"),
      ),
      keyboardType: TextInputType.number,
    );

    final categoryDropdown = DropdownButton(
      value: _selectedCateogry,
      items: Category.values
          .map(
            (c) =>
                DropdownMenuItem(value: c, child: Text(c.name.toUpperCase())),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) setState(() => _selectedCateogry = value);
      },
    );

    final datePicker = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _selectedDate == null
              ? 'No date Selected'
              : formater.format(_selectedDate!),
        ),
        IconButton(
          onPressed: selectDate,
          icon: const Icon(Icons.calendar_month),
        ),
      ],
    );

    // Using a list for the buttons so we can easily spread (...) them into any Row
    final actionButtons = [
      ElevatedButton.icon(
        onPressed: _submitData,
        icon: const Icon(Icons.add),
        label: const Text("Add"),
      ),
      const SizedBox(width: 15),
      ElevatedButton.icon(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.cancel),
        label: const Text("Cancel"),
      ),
    ];

    // 2. Build the Layout using the variables
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;

        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
              child: Column(
                children: [
                  if (isWide) ...[
                    // WIDE SCREEN LAYOUT
                    Row(
                      children: [
                        Expanded(child: titleField),
                        const SizedBox(width: 15),
                        Expanded(child: amountField),
                      ],
                    ),
                    Row(
                      children: [
                        categoryDropdown,
                        const SizedBox(width: 15),
                        Expanded(child: datePicker),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: actionButtons,
                    ),
                  ] else ...[
                    // NARROW SCREEN LAYOUT
                    titleField,
                    Row(
                      children: [
                        Expanded(child: amountField),
                        const SizedBox(width: 15),
                        Expanded(child: datePicker),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        categoryDropdown,
                        const Spacer(),
                        ...actionButtons,
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
