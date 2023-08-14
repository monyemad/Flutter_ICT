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

  @override
  void initState()
  {
    total = widget.total;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),
              color: Colors.grey.shade100,
            ),
            margin: const EdgeInsets.all(55),
            padding: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                'price=$total',
                style: const TextStyle(fontSize: 35),
              ),
            ),
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
                Text("ADD 5 to Price",style: TextStyle(fontSize: 20),),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}