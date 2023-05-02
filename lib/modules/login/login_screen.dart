import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/shared/component/custom_button.dart';
import 'package:social_app/shared/component/custom_text_field.dart';
import 'package:social_app/shared/network/remote/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 100.h),
          children: [
            Text(
              "Login Now To Your Account",
              style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 60.h,),
            CustomTextField(
              controller: emailCon,
              inputType: TextInputType.emailAddress,
              validateText: "Your Email",
              hintText: "Type Your Email",
              prefix: Icons.email,
            ),
            SizedBox(height: 25.h,),
            CustomTextField(
              controller: passCon,
              validateText: "Your Password",
              hintText: "Type Your Password",
              prefix: Icons.lock,
            ),
            SizedBox(height: 60.h,),
            CustomButton(
              onPressed: () {
                FirebaseAuthServices.login(
                  email: emailCon.text,
                  password: passCon.text,
                );
              },
              text: "Login",
            ),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Haven't an account?",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600
                  ),
                ),
                TextButton(
                  onPressed: (){
                    GoRouter.of(context).push("/register");
                  },
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
