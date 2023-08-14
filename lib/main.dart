//import 'package:first_app/ui/screen/home_page.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage3(),
    );
  }
}

class MyHomePage3 extends StatelessWidget {
  const MyHomePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade400),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content:
                                const Text('do you really want to log out',style: TextStyle(fontSize: 20)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('no',style: TextStyle(fontSize: 20)),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('yes',style: TextStyle(fontSize: 20)),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text('Log out',style: TextStyle(fontSize: 20)),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('password soo week',style: TextStyle(fontSize: 20)),
                      ),
                    );
                  },
                  child: const Text('show snack bar',style: TextStyle(fontSize: 25)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return const Column(
                            children: [Text('No Comment',
                            style: TextStyle(fontSize: 25))],
                          );
                        });
                  },
                  child: const Text('Comment',style: TextStyle(fontSize: 25)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
