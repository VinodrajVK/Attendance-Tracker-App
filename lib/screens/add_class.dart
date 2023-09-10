import 'package:attendance_tracker/data/sub_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddClass extends StatefulWidget {
  const AddClass({
    super.key,
    required this.sub,
  });
  final Subject sub;
  @override
  State<StatefulWidget> createState() {
    return _AddClassState();
  }
}

class _AddClassState extends State<AddClass> {
  bool? attended = false;
  DateTime? _selectedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
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

  void _addClass() {
    widget.sub.totalClasses++;
    widget.sub.attendedClasses = (attended!)
        ? widget.sub.attendedClasses + 1
        : widget.sub.attendedClasses;
    widget.sub.percent =
        (widget.sub.attendedClasses / widget.sub.totalClasses * 100).toInt();
    (attended!)
        ? (widget.sub.presentDates.add(_selectedDate!))
        : (widget.sub.absentDates.add(_selectedDate!));
    widget.sub.save();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            Text(
              'Select Date',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.normal),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Date Selected'
                        : DateFormat("yyyy-MM-dd").format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Did You Attend?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal),
                  ),
                  Checkbox(
                      value: attended,
                      onChanged: (didattend) {
                        setState(() {
                          attended = didattend;
                        });
                      }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedDate == null
                            ? _showError(context)
                            : _addClass();
                      });
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showError(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        setState(() {
          Navigator.pop(context);
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Error"),
      content: const Text("Date Not Selected!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
