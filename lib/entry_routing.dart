import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_medial_tutorial/pages/test_pages/home_page.dart';

import 'auth/waiting_page.dart';
import 'data models/user.dart';

class EntryRouter extends StatefulWidget {
  const EntryRouter({super.key});

  @override
  State<EntryRouter> createState() => _EntryRouterState();
}

class _EntryRouterState extends State<EntryRouter> {
  @override
  Widget build(BuildContext context) {
    return control();
  }
}

class control extends StatefulWidget {
  control();

  @override
  _controlState createState() => _controlState();
}

class _controlState extends State<control> {
  _controlState();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var role;
  var email;
  var username;
  var approved;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Users") //.where('uid', isEqualTo: user!.uid)
        .doc(user!.email)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
    }).whenComplete(() {
      //CircularProgressIndicator();
      setState(() {
        email = loggedInUser.email.toString();
        role = loggedInUser.role.toString();
        username = loggedInUser.username.toString();
        approved = loggedInUser.approved.toString();
      });
    });
  }

  routing() {
    if (approved == 'true') {
      return HomePage();
    } else {
      return const WaitingPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    CircularProgressIndicator();
    return routing();
  }
}