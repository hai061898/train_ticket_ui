import 'package:flutter/material.dart';

class ItemStatus extends StatelessWidget {
  const ItemStatus({
    Key? key,
    required this.status,
    required this.color,
  }) : super(key: key);

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(width: 7),
        Text(
          status,
          style:const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}