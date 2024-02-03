import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/di.config.dart';

@InjectableInit()
Future configureDependencies() => GetIt.instance.init();
