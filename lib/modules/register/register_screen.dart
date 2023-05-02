import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/shared/component/custom_button.dart';
import 'package:social_app/shared/component/custom_text_field.dart';
import 'package:social_app/shared/network/remote/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameCon = TextEditingController();
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
             "Register Now ",
             style: TextStyle(
               fontSize: 19.sp,
               fontWeight: FontWeight.w600
             ),
           ),
            SizedBox(height: 60.h,),
            CustomTextField(
                controller: nameCon,
                validateText: "Your Name",
                hintText: "Type Your Name",
                prefix: Icons.person,
            ),
            SizedBox(height: 25.h,),
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
                  FirebaseAuthServices.register(
                      email: emailCon.text,
                      password: passCon.text,
                      name: nameCon.text,
                  );
                },
                text: "Sign Up",
            ),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account?",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600
                  ),
                ),
                TextButton(
                    onPressed: (){
                      GoRouter.of(context).push("/login");
                    },
                    child: Text(
                      "Login In",
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
