import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:job_app/features/job_details/presentation/screens/job_details_screen.dart';

import 'core/routing/router.dart';
import 'features/job/presentation/screens/job_screen.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Job App',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      builder: EasyLoading.init(),
    );
  }
}
