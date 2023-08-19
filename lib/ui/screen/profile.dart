import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(20),
            child: const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "First name",
                  hintText: "Enter your name",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(20),
            child: const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "Enter your number",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: InputBorder.none),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(20),
            child: const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
