import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_medial_tutorial/components/helper_functions.dart';
import 'package:flutter_social_medial_tutorial/components/my_drawer.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Page"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: MyDrawer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          // any errors
          if (snapshot.hasError) {
            displayMessageToUser("Something Went Wrong", context);
          }

          // show loading indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }

          // get all users
          if (snapshot.data == null) {
            return const Text("No Data");
          }

          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                title: Text(user['username']),
                subtitle: Text(user['email']),
              );
            },
          );
        },
      ),
    );
  }
}