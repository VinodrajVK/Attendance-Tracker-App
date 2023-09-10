import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSum extends StatelessWidget {
  const DateSum({
    super.key,
    required this.date,
    required this.isAttended,
  });
  final DateTime? date;
  final bool? isAttended;
  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(date!);
    return Card(
      color: (isAttended!) ? Colors.greenAccent : Colors.pink,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          formattedDate,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
