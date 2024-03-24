import 'package:flutter/material.dart';
import './profile_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          Profile.logout().then((_) {
            Navigator.of(context).pushReplacementNamed('/login');
          });
        },
        child: const Text('Logout'),
      ),
    );
  }
}
