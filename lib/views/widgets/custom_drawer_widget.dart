import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:home_decoration_marketplace/controllers/firebase_auth_controller.dart';
import 'package:home_decoration_marketplace/views/screens/login_screen.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({super.key});

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  final firebaseAuthController = FirebaseAuthController();

  void _logout() async {
    await firebaseAuthController.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      curve: Curves.decelerate,
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/person.png"),
            ),
            title: const Text("Alex Babkin"),
            subtitle: const Text("+734632378545"),
            trailing: IconButton(
              onPressed: _logout,
              icon: const Icon(Icons.logout),
            ),
          ),
          const Gap(20),
          //   Column(
          //     children: [
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 50,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(color: Colors.blue),
          //         ),
          //       ),
          //       const Gap(10),
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 50,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(color: Colors.blue),
          //         ),
          //       ),
          //       const Gap(10),
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 50,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(color: Colors.blue),
          //         ),
          //       ),
          //       const Gap(10),
          //       Container(
          //         width: MediaQuery.of(context).size.width,
          //         height: 50,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(color: Colors.blue),
          //         ),
          //       ),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
