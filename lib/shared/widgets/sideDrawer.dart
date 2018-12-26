import 'package:flutter/material.dart';
import 'package:testapp/pages/counter_page.dart';
import 'package:testapp/pages/test_page.dart';
import 'package:testapp/pages/user_page.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Counter page'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CounterPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.track_changes),
            title: Text('User Page'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => UserPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.train),
            title: Text('Test API Page'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => TestPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
