import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthServices{
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  static void login({required String email,required String password}){
    firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password,
    ).then((value) {
      Fluttertoast.showToast(
          msg: "Login SuccessFully",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
         textColor: Colors.white,
      );
    }).catchError((error){
      Fluttertoast.showToast(
        msg: "Error,Please try again",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    });
  }
  static void register({required String email,required String password,required String name}){
    firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password,
    ).then((value) {
      FirebaseFirestore.instance.collection("users").doc(firebaseAuth.currentUser!.uid).set({
        "email":email,
        "password":password,
        "userId":firebaseAuth.currentUser!.uid,
        "name":name,
      }).then((value){
        Fluttertoast.showToast(
          msg: "SignUp SuccessFully",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }).catchError((error){
        Fluttertoast.showToast(
          msg: "Error,Please try again$error",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      });
    }).catchError((error){
      Fluttertoast.showToast(
        msg: "Error,Please try again",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    });
  }
}