import 'package:flutter/material.dart';

import 'colors.dart';

OurStyle({family = "regular", double? size = 14, color = whiteColor}) {
  return TextStyle(
    fontSize: size,
    color: color,
  );
}
