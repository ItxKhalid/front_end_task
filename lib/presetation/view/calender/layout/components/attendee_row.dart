import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class AttendeeRow extends StatelessWidget {
  final List<String> imagePaths;

  const AttendeeRow(
      {super.key, required this.imagePaths});

  // Function to generate a random gradient
  LinearGradient _getRandomGradient() {
    final List<List<Color>> gradients = [
      [Colors.blue, Colors.blueAccent],
      [Colors.purple, Colors.pink],
      [Colors.orange, Colors.deepOrange],
      [Colors.green, Colors.teal],
      [Colors.red, Colors.redAccent],
    ];
    final randomIndex = Random().nextInt(gradients.length);
    return LinearGradient(
      colors: gradients[randomIndex],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
      imagePaths.length,
          (index) {
        String imagePath = imagePaths[index % imagePaths.length];
        bool isSvg = imagePath.endsWith('.svg');

        return Transform.translate(
          offset: Offset(-(index * 8.0), 0),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.transparent,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: _getRandomGradient(),
              ),
              child: isSvg
                  ? SvgPicture.asset(
                imagePath,
                fit: BoxFit.cover,
              )
                  : ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    ),
    );
  }
}
