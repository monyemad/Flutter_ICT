import 'package:first_app/cubit/my_app_cubit.dart';
import 'package:first_app/cubit/my_app_state.dart';
import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signin extends StatelessWidget {
   Signin({super.key});

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                "Name",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.name,
                controller: name,
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.black26),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                "Email",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.black26),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                "Phone",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: phone,
                decoration: const InputDecoration(
                  hintText: "Enter your phone",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.black26),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 25),
              child: const Text(
                "Password",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: password,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(fontSize: 18, color: Colors.black26),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: BlocConsumer<AppCubitA, AppStateA>(
                listener: (context, state) {
                  if (state is CreateErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error,
                        ),
                      ),
                    );
                  } else if (state is CreateDoneState) {
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
                        padding: const EdgeInsets.all(12),
                        backgroundColor: Colors.brown),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await context.read<AppCubitA>().signin(
                            email: email.text,
                            password: password.text,
                            name: name.text,
                            phone: phone.text);
                      }
                    },
                    child: state is CreateLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Sign up",
                            style: TextStyle(fontSize: 20),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
