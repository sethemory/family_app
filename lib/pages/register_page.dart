// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_medial_tutorial/components/helper_functions.dart';
import 'package:flutter_social_medial_tutorial/components/my_button.dart';
import 'package:flutter_social_medial_tutorial/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  // register method
  void register() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: LinearProgressIndicator(),
      ),
    );

    //make sure pw and confirm pw match
    if (passwordController.text != confirmController.text) {
      //pop loading circle
      Navigator.pop(context);

      //show error to user
      displayMessageToUser("Passwords do not match", context);
    } else {
      //try creating user
      try {
        //create the user
        UserCredential? userCred =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        //create a user document and add to firestore
        createUserDocument(userCred);

        //pop loading circle
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //pop loading circle
        Navigator.pop(context);

        //display error message
        displayMessageToUser(e.code, context);
      }
    }
  }

  //create a user document
  Future<void> createUserDocument(UserCredential? userCred) async {
    if (userCred != null && userCred.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCred.user!.email)
          .set({
        'email': userCred.user!.email,
        'username': usernameController.text,
        'approved': 'false',
        'role': "user",
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.family_restroom_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 25),

              //app name
              const Text(
                "G E T   T O G E T H E R",
                style: TextStyle(fontSize: 25),
              ),

              const SizedBox(height: 60),

              //username textfield
              MyTextField(
                hintText: "Username",
                obscureText: false,
                controller: usernameController,
              ),

              const SizedBox(height: 10),

              //email textfield
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: emailController,
              ),

              const SizedBox(height: 10),

              //password textfield
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 10),

              //confirm password textfield
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: confirmController,
              ),

              const SizedBox(height: 5),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              //register button
              MyButton(
                text: "Register Account",
                onTap: register,
                padding: 20,
                size: 15,
              ),

              const SizedBox(height: 10),

              //dont have account register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "  Login Here!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
