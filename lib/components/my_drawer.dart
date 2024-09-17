import 'package:flutter/material.dart';
import 'package:flutter_social_medial_tutorial/components/helper_functions.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header
              DrawerHeader(
                child: Icon(
                  Icons.family_restroom_rounded,
                  size: 70,
                ),
              ),

              SizedBox(
                height: 30,
              ),

              //home tile
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("H O M E"),
                  onTap: () {
                    //pop drawer
                    Navigator.pop(context);

                    //navigate to home
                    Navigator.pushNamed(context, '/home_page');
                  },
                ),
              ),

              //user profile tile
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("P R O F I L E"),
                  onTap: () {
                    //pop drawer
                    Navigator.pop(context);

                    //navigate to profile page
                    Navigator.pushNamed(context, '/profile_page');
                  },
                ),
              ),

              //users tile
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.group),
                  title: Text("U S E R S"),
                  onTap: () {
                    //pop drawer
                    Navigator.pop(context);

                    //navigate to profile page
                    Navigator.pushNamed(context, '/users_page');
                  },
                ),
              ),
            ],
          ),

          //logout
          Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 40),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("L O G O U T"),
              onTap: () {
                //pop drawer
                Navigator.pop(context);

                //logout
                logout();
                Navigator.pushNamed(context, '/auth_page');
              },
            ),
          ),
        ],
      ),
    );
  }
}
