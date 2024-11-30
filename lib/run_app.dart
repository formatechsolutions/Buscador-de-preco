import 'core/routes/routes.dart';
import 'core/services/services_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class RunApp {
  static Future<void> run() async {
    return runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();

      await ServicesManager.init();
      await afterAppRun();

      return runApp(const ApplicationContent());
    }, (error, stack) async {
      debugPrint('Error initing app $error, the stack was: $stack');
    });
  }
  
  static Completer<void> afterRunAppCompleted = Completer();
  static Future<void> afterAppRun() async {
    if (!afterRunAppCompleted.isCompleted) {
      afterRunAppCompleted.complete();
    }
  }
}

class ApplicationContent extends StatelessWidget {
  const ApplicationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BuscaPreco',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: Routes.routes,
    );
  }
}