import 'package:first_app/ui/screen/login.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 45, bottom: 8),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          style: BorderStyle.solid, color: Colors.black12),
                      backgroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                    },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  )),
            ),
            Container(
              padding: const EdgeInsets.only(right: 25),
              margin: const EdgeInsets.only(right: 45),
              child: const Text(
                'Welcome back! Glad\nto see you, Again!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.grey.shade300)),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 6
                  ),
                  hintText: "Username",
                  hintStyle: TextStyle(fontSize: 22, color: Colors.black26),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'username must be not empty';
                  }
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.grey.shade300)),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 6
                  ),
                  hintText: "Email",
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
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.grey.shade300)),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 6
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 22, color: Colors.black26),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password must be not empty';
                  } else if (value.length < 8) {
                    return 'password must be 8 numbers or letters';
                  }
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.grey.shade300)),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(
                  left: 25, right: 25, top: 20, bottom: 20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 6
                  ),
                  hintText: "Confirm password",
                  hintStyle: TextStyle(fontSize: 22, color: Colors.black26),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'confirm password must be not empty';
                  } else if (value.length < 8) {
                    return 'confirm password must be 8 numbers or letters';
                  } else {
                    return 'confirm password does not match';
                  }
                },
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    maximumSize: const Size(330, 100),
                    padding: const EdgeInsets.all(12),
                    side: const BorderSide(
                        style: BorderStyle.solid, color: Colors.black12),
                    backgroundColor: Colors.deepPurple),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(
                  top: 10,
                  right: 30,
                left: 30,
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.5,
                      endIndent: 15,
                    ),
                  ),
                  Text(
                    "Or Login With",
                    style: TextStyle(fontSize: 15),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1.5,
                      indent: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          style: BorderStyle.solid,color: Colors.black26),
                    color: Colors.white,
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:AN'
                            'd9GcQPcWNv7Gc7t6fsBRFPe-eP0xRIQTELAVM8ag&usqp=CAU')),
                  ),
                  margin: const EdgeInsets.only(right: 20),
                ),
                Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      style: BorderStyle.solid,color: Colors.black26),
                    color: Colors.white,
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://cdn1.iconfinder.com/data/icons/'
                            'google-s-logo/150/Google_Icons-09-512.png')),
                  ),
                  margin: const EdgeInsets.only(right: 20),
                ),
                Container(
                  height: 60,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          style: BorderStyle.solid,color: Colors.black26),
                      color: Colors.white,
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://img.freepik.com/free-icon/mac-os_318-10374.jpg'))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
