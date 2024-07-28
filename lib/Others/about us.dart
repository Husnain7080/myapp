import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutuS extends StatelessWidget {
  const AboutuS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // iOS back arrow icon
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
        title: Text(
          'About Us',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is Mr. Event?',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: Text(
                'Mr. Event is a premier event complex that offers a wide range of facilities and services to make your event a memorable one. Our state of the art complex is equipped with modern amenities and infrastructure to cater to all your event needs.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                      fontSize: 16),
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Facilities:',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(
                  'Spacious halls with seating capacity for up to 500 guests',
                ),
                _buildBulletPoint(
                  'State-of-the-art audio-visual equipment',
                ),
                _buildBulletPoint(
                  'Delicious catering services with a variety of menu options',
                ),
                _buildBulletPoint(
                  'Ample parking space for guests',
                ),
                _buildBulletPoint(
                  '24/7 security and surveillance',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Follow us on:',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon:
                      Image.asset('assets/facebook.png', height: 40, width: 40),
                  onPressed: () {
                    // Handle Facebook button press
                  },
                ),
                IconButton(
                  icon:
                      Image.asset('assets/whatsapp.png', height: 40, width: 40),
                  onPressed: () {
                    // Handle WhatsApp button press
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/instagram.png',
                      height: 40, width: 40),
                  onPressed: () {
                    // Handle Instagram button press
                  },
                ),
                IconButton(
                  icon:
                      Image.asset('assets/twitter.png', height: 40, width: 40),
                  onPressed: () {
                    // Handle Twitter button press
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Contact us Via:',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () async {},
                  leading: Icon(
                    Icons.email,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                  title: Text(
                    'info@mrevent.com',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    )),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    const phone = 'tel:+923151754154';
                    if (await canLaunch(phone)) {
                      await launch(phone);
                    } else {
                      throw 'Could not launch $phone';
                    }
                  },
                  leading: Icon(
                    Icons.phone,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                  title: Text(
                    '+923151754154',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    )),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.location_on,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                  title: Text(
                    'Main Exhibition Halls, Lahore, Punjab 54782, Pakistan',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(top: 4),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
