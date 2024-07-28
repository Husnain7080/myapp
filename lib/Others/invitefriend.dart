import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendPage extends StatelessWidget {
  final String inviteLink = 'http://mrevents.rf.gd'; // Your invite link

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invite Friends'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Invite your friends to join us using the link below!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Invite Link',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
                suffixIcon: IconButton(
                  icon: Icon(Icons.copy),
                  onPressed: () {
                    // Copy the invite link to the clipboard
                    Clipboard.setData(ClipboardData(text: inviteLink));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invite link copied to clipboard!')),
                    );
                  },
                ),
              ),
              controller: TextEditingController(text: inviteLink),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Share the invite link using the share_plus package
                Share.share(inviteLink, subject: 'Join me on this amazing app!');
              },
              child: Text('Invite'),
            ),
          ],
        ),
      ),
    );
  }
}
