import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/config/session/user_session.dart';
import 'package:restaurant/pages/login/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile', style: GoogleFonts.robotoSlab()),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
                child: ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            )),
            const SizedBox(height: 20),
            Text(
              'Randi Maulana A',
              style: GoogleFonts.robotoSlab(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'inforandi97@gmail.com',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            const SizedBox(height: 30),
            const ListTile(
              title: Text('Date of Birth'),
              subtitle: Text('November 13, 1997'),
              leading: Icon(Icons.cake),
            ),
            const Divider(),
            const ListTile(
              title: Text('Phone Number'),
              subtitle: Text('+62814567890'),
              leading: Icon(Icons.phone),
            ),
            const Divider(),
            const ListTile(
              title: Text('Address'),
              subtitle: Text('Jl. Raya Gajah Mada, Malang'),
              leading: Icon(Icons.location_city),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                UserSession().logout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Logout'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
