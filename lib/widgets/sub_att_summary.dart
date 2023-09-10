import 'package:attendance_tracker/data/sub_data.dart';
import 'package:flutter/material.dart';

class SubSummary extends StatefulWidget {
  const SubSummary({
    super.key,
    required this.sub,
    required this.changeScreen,
  });
  final Subject sub;
  final void Function(Subject sub) changeScreen;
  @override
  State<StatefulWidget> createState() {
    return _SubSummaryState();
  }
}

class _SubSummaryState extends State<SubSummary> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          widget.changeScreen(widget.sub);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                widget.sub.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              SizedBox(
                child: Text(
                  '${widget.sub.percent}%',
                  style: TextStyle(
                    color: (widget.sub.percent >= 75)
                        ? (Colors.green)
                        : (Colors.pink),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
