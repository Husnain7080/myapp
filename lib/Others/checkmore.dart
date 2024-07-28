import 'package:event_manager/Others/privacy.dart';
import 'package:event_manager/Others/terms.dart';
import 'package:flutter/material.dart';

class CheckMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to indicate that you don't want to close the app
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Check More'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.library_books),
                title: Text(
                  'Terms and Conditions',
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsOfUseScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
