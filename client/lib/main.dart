import 'package:Lumeo/app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:window_manager/window_manager.dart';

void main() async {
  await onSystemInit();

  runApp(const MainApp());
}

Future<void> onSystemInit() async {
  // WidgetsBinding
  WidgetsFlutterBinding.ensureInitialized();

  // Date Format
  await initializeDateFormatting();
  tz.initializeTimeZones();

  // Dotenv
  await dotenv.load(fileName: "assets/config/.env");
}
