import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> signin(String email,
      String password,
      String name,) async {
    if (formkey.currentState!.validate()) {
      try {
        FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ).then((value) {
          if (value.user != null)
          {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context){
                  return const MyHomePage3();
                })
            );
          }
        });
      }
      catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 30),
              child: const Text(
                "Name",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: name,
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                  hintStyle: TextStyle(fontSize: 22, color: Colors.black26),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 30),
              child: const Text(
                "Email",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(fontSize: 22, color: Colors.black26),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 30),
              child: const Text(
                "Password",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: password,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(fontSize: 22, color: Colors.black26),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    maximumSize: const Size(190, 80),
                    padding: const EdgeInsets.all(12),
                    backgroundColor: Colors.brown
                ),
                onPressed: () async{
                  await signin (
                    name.text,
                    email.text,
                    password.text,
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign up",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}