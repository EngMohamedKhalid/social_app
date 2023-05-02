import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/modules/register/register_screen.dart';

abstract class AppRoutes{
  static final route = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) {
           return FirebaseAuth.instance.currentUser==null?const LoginScreen():const RegisterScreen();
          },
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) =>const LoginScreen(),
        ),
        GoRoute(
          path: "/register",
          builder: (context, state) =>const RegisterScreen(),
        ),
        // GoRoute(
        //   path: "/search",
        //   builder: (context, state) =>const SearchViewScreen(),
        // ),
      ]
  );


}