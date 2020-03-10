import 'package:flutter/material.dart';
import 'package:cristofer_flutter_template/app/app_module.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const environment = '.env';
  await DotEnv().load(environment);
  return runApp(AppModule());
}
