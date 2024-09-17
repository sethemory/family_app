import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_medial_tutorial/components/my_drawer.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: MyDrawer(),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // loading..
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }

          // error
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          //data received
          else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data!.data();

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //profile picture
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.person,
                      size: 64,
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // username
                  Text(
                    user!['username'],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // email
                  Text(
                    user['email'],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text("No Data");
          }
        },
      ),
    );
  }
}
