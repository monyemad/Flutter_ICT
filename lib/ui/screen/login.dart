import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/cubit/my_app_cubit.dart';
import 'package:first_app/cubit/my_app_cubit.dart';
import 'package:first_app/cubit/my_app_state.dart';
import 'package:first_app/main.dart';
import 'package:first_app/ui/screen/Register.dart';

//import 'package:first_app/ui/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 25),
                margin: const EdgeInsets.only(bottom: 80, right: 45),
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
                        style: BorderStyle.solid, color: Colors.grey.shade400)),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        style: BorderStyle.solid, color: Colors.grey.shade400)),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
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
                    } else if (value.length < 8) {
                      return 'password must be 8 numbers or letters';
                    }
                  },
                ),
              ),
              BlocConsumer<AppCubitA, AppStateA>(
                listener: (context, state) {
                  if (state is LoginErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error,
                        ),
                      ),
                    );
                  } else if (state is LoginDoneState) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const MyHomePage3();
                    }));
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          maximumSize: const Size(330, 100),
                          padding: const EdgeInsets.all(12),
                          side: const BorderSide(
                              style: BorderStyle.solid, color: Colors.black12),
                          backgroundColor: Colors.deepPurple),
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          context
                              .read<AppCubitA>()
                              .login(email.text, password.text);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state is LoginLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 20),
                                ),
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      ));
                },
              ),
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
                          style: BorderStyle.solid, color: Colors.black26),
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
                          style: BorderStyle.solid, color: Colors.black26),
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
                            style: BorderStyle.solid, color: Colors.black26),
                        color: Colors.white,
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-icon/mac-os_318-10374.jpg'))),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const Register();
                        }));
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(color: Colors.red, fontSize: 19),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
