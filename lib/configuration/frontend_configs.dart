import 'package:flutter/material.dart';

class FrontendConfigs {

  List<Color> getGradientColorsFromName(String name) {
    // Define a list of gradient pairs
    final List<List<Color>> gradients = [
      [Colors.blue[300]!, Colors.blue[100]!],
      [Colors.purple[300]!, Colors.purple[100]!],
      [Colors.teal[300]!, Colors.teal[100]!],
      [Colors.pink[300]!, Colors.pink[100]!],
      [Colors.amber[300]!, Colors.amber[100]!],
      [Colors.indigo[300]!, Colors.indigo[100]!],
      [Colors.green[300]!, Colors.green[100]!],
      [Colors.orange[300]!, Colors.orange[100]!],
      [Colors.cyan[300]!, Colors.cyan[100]!],
      [Colors.deepPurple[300]!, Colors.deepPurple[100]!],
    ];

    // Calculate a hash code from the name
    int nameHash = name.length;
    for (int i = 0; i < name.length; i++) {
      nameHash += name.codeUnitAt(i);
    }

    // Use the hash to consistently select a gradient
    int gradientIndex = nameHash % gradients.length;
    return gradients[gradientIndex];
  }
}