import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(
                fontSize: 25, letterSpacing: 1.5, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.light_mode),
                title: Text('Light Mode'),
                trailing: Switch(
                  value: true,
                  onChanged: (bool newValue) {},
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                trailing: Switch(
                  value: true,
                  onChanged: (bool newValue) {},
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.language),
                title: Text('Language'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text('Privacy Policy'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Account'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.password),
                title: Text('Change Password'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
