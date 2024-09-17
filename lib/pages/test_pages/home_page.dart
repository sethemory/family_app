// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_social_medial_tutorial/components/my_drawer.dart';
import 'package:flutter_social_medial_tutorial/components/my_post_button.dart';
import 'package:flutter_social_medial_tutorial/components/my_post_tile.dart';
import 'package:flutter_social_medial_tutorial/components/my_textfield.dart';
import 'package:flutter_social_medial_tutorial/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  // Text controller
  TextEditingController newPostController = TextEditingController();

  // post message
  void postMessage() {
    // only post if something is in the text field
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    // clear the text controller after post
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Chat'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          // Intro text at the top
          const Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Row(
              children: [
                Text("Add your message to the Family chat here:"),
              ],
            ),
          ),

          // Textfield box for user to type
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    hintText: "Say something...",
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),
                PostButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),

          // Posts
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // show loading indicator
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: LinearProgressIndicator(),
                );
              }

              //get all posts
              final posts = snapshot.data!.docs;

              // no data?
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No posts... Post Something"),
                  ),
                );
              }

              // return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // get each individual post
                    final post = posts[index];

                    // get data from each post
                    String message = post['PostMessage'];
                    String userEmail = post['UserEmail'];
                    //Timestamp timestamp = post['TimeStamp'];

                    // return as a list tile
                    return MyPost(title: message, subTitle: userEmail);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
