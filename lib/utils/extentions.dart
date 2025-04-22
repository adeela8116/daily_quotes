import 'package:flutter/material.dart';

extension SpaceExtension on num {
  SizedBox get spaceX => SizedBox(height: toDouble());
  SizedBox get spaceY => SizedBox(width: toDouble());
}