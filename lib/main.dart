import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/modules/register/register_screen.dart';
import 'package:social_app/shared/routes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context,child){
        return  MaterialApp.router(
          routerConfig: AppRoutes.route,
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}
