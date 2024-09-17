import 'package:flutter/material.dart';

import '../components/helper_functions.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Waiting Page"),
      ),
      drawer: Drawer(
        child: Center(
          child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("L O G O U T"),
              onTap: () {
                //pop drawer
                Navigator.pop(context);
          
                //logout
                logout();
                Navigator.pushNamed(context, '/auth_page');
              }),
        ),
      ),
      body: Center(
        child: Text("Wait for the admin to approve your account."),
      ),
    );
  }
}
