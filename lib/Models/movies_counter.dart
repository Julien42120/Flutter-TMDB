import 'package:flutter/material.dart';

class MovieCounter extends StatelessWidget {
  const MovieCounter({
    Key? key,
    required this.count,
  }) : super(key: key);

  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration:
          const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      child: Center(
        child: Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
