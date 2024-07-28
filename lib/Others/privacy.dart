import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // iOS back arrow icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application and associated services (collectively, the "Service"). Please read this Privacy Policy carefully. If you do not agree with the terms of this Privacy Policy, please do not access the application.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            SizedBox(height: 16.0),
            Text(
              'COLLECTION OF YOUR INFORMATION',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may collect information about you in a variety of ways. The information we may collect via the Service depends on the content and materials you use and includes:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. Personal Data:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '- Demographic and other personally identifiable information (such as your name and email address) that you voluntarily give to us when choosing to participate in various activities related to the Service, such as logging in as an admin, booking a hall, or making payments.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            Text(
              '2. Financial Data:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '- Financial information, such as data related to your payment method (e.g. valid credit card number, card brand, expiration date) that we may collect when you purchase, order, return, exchange, or request information about our services from the Service.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            Text(
              '3. Credentials:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '- Any personal credentials such as username and password used for the admin and user login purposes.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            SizedBox(height: 16.0),
            Text(
              'USE OF YOUR INFORMATION',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may use information collected about you via the Service for various purposes, including but not limited to:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. Admin Login:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '- To allow authorized administrators to log in and manage hall listings, bookings, and other administrative functions.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            Text(
              '2. User Login:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '- To facilitate user access to the Service, including booking halls, making payments, and accessing personalized features.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            SizedBox(height: 16.0),
            Text(
              'DISCLOSURE OF YOUR INFORMATION',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may share information we have collected about you in certain situations. Your information may be disclosed as follows:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. By Law or to Protect Rights:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '- If we believe the release of information about you is necessary to respond to legal process, to investigate or remedy potential violations of our policies, or to protect the rights, property, and safety of others, we may share your information as permitted or required by any applicable law, rule, or regulation.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            Text(
              '2. Third-Party Service Providers:',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '- We may share your information with third-party vendors, service providers, contractors, or agents who perform services for us or on our behalf and require access to such information to do that work.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
            SizedBox(height: 16.0),
            Text(
              'CONTACT US',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'If you have questions or comments about this Privacy Policy, please contact us at info@mrevents.com.',
              style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 16.0),),
            ),
          ],
        ),
      ),
    );
  }
}
