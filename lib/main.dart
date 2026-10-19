import 'package:flutter/material.dart';

import 'core/bootstrap/bootstrap_app.dart';
import 'hoteliq_app.dart';

void main() async {
  await bootstrapApp();
  runApp(const HoteliqApp());
}
