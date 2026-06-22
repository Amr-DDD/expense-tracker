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
  // get Textfield input
  //method #1:
  /*  
  var _enteredValue = '';
  void _textFieldTitle(String text) {
    _enteredValue = text;
  }*/

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

  // we must dispose of the TextEditingController because we no longer need it and it will stay in the memory
  // it will also keep
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    // this gets the amount of space taken up by keyboard from bottom
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                16,
                16,
                16,
                keyboardSpace + 16,
              ), // we changed the top 3lshan ynzl shwia 3lshan l camera kanet me8ateya el klam
              child: Column(
                children: [
                  if (width >= 600)
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _titleController,
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text("Title"),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            maxLength: 20,
                            decoration: const InputDecoration(
                              prefixText: '\$',
                              label: Text("Amount"),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    )
                  else
                    TextField(
                      controller: _titleController,
                      //method #1:
                      //onChanged: _textFieldTitle,
                      maxLength: 50,
                      decoration: const InputDecoration(label: Text("Title")),
                      // keyboardType: TextInputType.text,
                      // this sets which keybord to open to the user, when the textfield is clicked
                      // Some keyboards are optimized for numbers or email entry etc..
                    ),
                  if (width >= 600)
                    Row(
                      children: [
                        DropdownButton(
                          value: _selectedCateogry,
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase()),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }

                            setState(() {
                              _selectedCateogry = value;
                            });
                          },
                        ),
                        SizedBox(width: 15),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedDate == null
                                    ? 'No date Selected'
                                    : formater.format(
                                        _selectedDate!,
                                      ), // notice the "!" I added at the end which simply tells flutter that this value will never be null so that it can accept the value
                              ),
                              IconButton(
                                onPressed: selectDate,
                                icon: Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            maxLength: 20,
                            decoration: const InputDecoration(
                              prefixText: '\$',
                              label: Text("Amount"),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),

                        SizedBox(width: 15),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _selectedDate == null
                                    ? 'No date Selected'
                                    : formater.format(
                                        _selectedDate!,
                                      ), // notice the "!" I added at the end which simply tells flutter that this value will never be null so that it can accept the value
                              ),
                              IconButton(
                                onPressed: selectDate,
                                icon: Icon(Icons.calendar_month),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (width >= 600)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _submitData,
                          icon: Icon(Icons.add),
                          label: Text("Add"),
                        ),
                        const SizedBox(width: 15),

                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel),
                          label: Text("Cancel"),
                        ),
                      ],
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DropdownButton(
                          value: _selectedCateogry,
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase()),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value == null) {
                              return;
                            }

                            setState(() {
                              _selectedCateogry = value;
                            });
                          },
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: _submitData,
                          icon: Icon(Icons.add),
                          label: Text("Add"),
                        ),
                        const SizedBox(width: 15),

                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel),
                          label: Text("Cancel"),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
