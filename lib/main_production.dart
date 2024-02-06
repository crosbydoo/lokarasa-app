import 'flavors.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/utils/date_time_util.dart';
import 'package:restaurant_app/di.dart';
import 'package:restaurant_app/main.dart';
import 'package:restaurant_app/resources/provider/theme_provider.dart';

Future<void> main() async {
  F.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await initializeDateFormatting(DateTimeUtil.locale, null);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
