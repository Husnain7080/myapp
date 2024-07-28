import 'package:event_manager/Others/invitefriend.dart';
import 'package:flutter/material.dart';

class Invitefr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the InviteFriendPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InviteFriendPage()),
            );
          },
          child: Text('Invite Friends'),
        ),
      ),
    );
  }
}