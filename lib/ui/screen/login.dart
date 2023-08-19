import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/main.dart';
import 'package:first_app/ui/screen/profile.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> login(String email,
      String password,) async {
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
        title: const Text("Login"),
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email must be not empty';
                  }
                },
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password must be not empty';
                  }
                  else if (value.length < 8) {
                    return 'password must be 8 numbers or letters';
                  }
                },
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    maximumSize: const Size(190, 80),
                    padding: const EdgeInsets.all(12),
                    backgroundColor: Colors.brown
                ),
                onPressed: () async{
                  await login (
                    email.text,
                    password.text,
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                )),
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
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const Profile();
                      })
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create Account",
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