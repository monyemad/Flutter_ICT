import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  final int total;

  const Page1({super.key, required this.total});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late int total;

  void buy() {
    setState(() {
      total += 5;
    });
  }

  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();

  @override
  void initState() {
    total = widget.total;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'price=$total',
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: input1Controller,
                  decoration: const InputDecoration(
                      hintText: 'Input1',
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: input2Controller,
                  decoration: const InputDecoration(
                      hintText: 'Input1', border: InputBorder.none),
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
                  ),
                  onPressed: () {
                    buy();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ADD 5 to Price",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
