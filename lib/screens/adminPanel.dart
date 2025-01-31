import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_manager/Others/about%20us.dart';
import 'package:event_manager/Others/privacy.dart';
import 'package:event_manager/Others/support.dart';
import 'package:event_manager/Others/terms.dart';
import 'package:event_manager/Others/user_acoount.dart';
import 'package:event_manager/components/constants.dart';
import 'package:event_manager/screens/admin.dart';
import 'package:event_manager/screens/bookedEventsByusers.dart';
import 'package:event_manager/screens/editDeleteScreen.dart';
import 'package:event_manager/screens/login_screen.dart';
import 'package:event_manager/screens/userprofileAdmin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({
    super.key,
  });
  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', false);
      await prefs.setBool('isAdmin', false);
      await prefs.setBool('isUser', false);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late String username = "";
  late String email = "";
  String tokentosave = "";
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((token) {
      tokentosave = token!;
      print("FCM Token: $token");
    });
    // Fetch email and username from provider
    // SignIn.sendNotification(devicdeid, "dededBhenchod", "deya");
    _loadUserData();
  }

  Future<void> updateDeviceId(String userId, String newDeviceId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({'deviceId': newDeviceId});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('devicdeid', tokentosave);
  }

  late String userdocid = "";
  late String devicdeid = '';
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email') ?? "";
      username = prefs.getString('username') ?? "";
      userdocid = prefs.getString('userdocidforadmin') ?? "";
      devicdeid = prefs.getString('devicdeid') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userdocid.isNotEmpty) {
      updateDeviceId(userdocid, tokentosave);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Admin Panel'),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: kTextColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black,
                    child: Icon(
                      Icons.person,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (username.isNotEmpty)
                    Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (email.isNotEmpty)
                    Text(
                      email,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.support,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              title: Text(
                'Support',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SupportUs()));
                // Navigate to feedback page
              },
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              title: Text(
                'Invite a Friend',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // Navigate to feedback page
              },
            ),
            ListTile(
              leading: Icon(
                Icons.update,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyScreen()));
                // Navigate to contact us page
              },
            ),
            ListTile(
              leading: Icon(
                Icons.more,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              title: Text(
                'Terms & Conditions',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsOfUseScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_mark_sharp,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              title: Text(
                'About us',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutuS()));
                // Nav\\gate to feedback page
              },
            ),
            ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 16,
                  ),
                ),
                onTap: _logout),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AdminPanelCard(
              backgroundColor: Colors.red,
              title: 'Add Events',
              imageUrl: 'assets/images/add.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminPage(email: email, username: username),
                  ),
                );
                // Handle Add Events tap
              },
            ),
            AdminPanelCard(
              backgroundColor: const Color.fromARGB(255, 192, 122, 250),
              title: 'View/Edit Events',
              imageUrl: 'assets/images/editdel.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditDeleteScreen(userEmail: email),
                  ),
                );

                // Handle View/Edit Events tap
              },
            ),
            AdminPanelCard(
              backgroundColor: const Color.fromARGB(255, 108, 191, 247),
              title: 'Booked Events',
              imageUrl: 'assets/images/ticket.png',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminBookedEventsScreen(),
                  ),
                );

                // Handle View/Edit Events tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdminPanelCard extends StatelessWidget {
  final String title;

  final VoidCallback onTap;
  final String imageUrl;
  final Color backgroundColor;
  const AdminPanelCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.imageUrl,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10),
          child: Material(
            color: Colors.transparent,
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 114, 114, 114),
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        child: Image.asset(
                          imageUrl,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            children: title.split(' ').map((word) {
                              return TextSpan(
                                text: '$word\n',
                              );
                            }).toList(),
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
