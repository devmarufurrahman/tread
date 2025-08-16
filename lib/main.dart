import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tread256/app.dart';
import 'package:tread256/core/services/token_datasource.dart';
import 'package:tread256/features/subscriptions/services/stripe_service.dart';
import 'package:tread256/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await TokenDatasource.init();
  await StripeServicePayment.setup();
  // await configLoading();
  runApp(const Tread256());
}

// Future<void> configLoading() async {
//   EasyLoading.instance
//     ..backgroundColor = AppColors.primary
//     ..indicatorColor = Colors.white
//     ..textColor = Colors.white
//     ..maskColor = Colors.black.withOpacity(0.5)
//     ..userInteractions = false
//     ..dismissOnTap = false;
// }
