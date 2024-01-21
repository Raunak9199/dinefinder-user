import 'dart:async';

import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app/app.dart';

late final GetStorage box;

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init('df user');
  box = GetStorage('df user');
  await AppUtils.getStoredData();
}

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      await initApp();
      runApp(const DineFinderUser());
    },
    (error, stack) {
      /* FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      fatal: true,
    ); */
    },
  );
}

