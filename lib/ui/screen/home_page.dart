import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/data/models/smart.dart';
import 'package:first_app/ui/screen/counter.dart';
import 'package:first_app/ui/screen/login.dart';
import 'package:first_app/ui/screen/profile.dart';
import 'package:first_app/ui/widgets/smart_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Smart> smart = [
    Smart(
        title: 'Amazon Alexa And Google Assistant',
        thumbnail: "https://cdn.thewirecutter.com/wp-content/media/2021/05/"
            "smartdisplaysupdate-2048px-0S1A8250-2x1-1.jpg?auto="
            "webp&quality=75&crop=2:1&width=1024",
        price: 350),
    Smart(
        title: 'Nikon 600D Mirrorless',
        thumbnail: "https://blogger.googleusercontent.com/img/b/R29vZ2xl/"
            "AVvXsEhnF7Mj3engykcKLOU4nafKCfy8mDcvSrl9yKZJuHDoXgefzwl7Fw6gH"
            "VpjiL6_km8927R2yeHf2tRgdHqOanUzv-LWMjL0kaP4DjZpngLqZskDNL76fgH"
            "LhNr-AfifQhRXwTmuvasJPMuqh8fAbq-_GIPBiiQPNWcWAnCEXZRkl2_Th9MTVA"
            "/s16000/P1010059.jpg",
        price: 400),
    Smart(
        title: 'Amazon Echo Look',
        thumbnail: 'https://i.ebayimg.com/images/g/cjAAAOSwX61ZEw-Q/s-l500.jpg',
        price: 350),
    Smart(
        title: 'WJPILIS Smart Wrist Watch',
        thumbnail: "https://images-na.ssl-images-amazon.com/images/I/"
            "71TlocQ6c2L.jpg",
        price: 200),
    Smart(
        title: 'Echo Dot Kids Edition',
        thumbnail: "https://techcrunch.com/wp-content/uploads/2019/"
            "06/Echo-Dot-Kids-Edition-Blue.jpg?resize=768,768",
        price: 300),
  ];
  Future<bool> signout() async {
    try{
      await FirebaseAuth.instance.signOut();
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: const Text('Smart tech.'),
        centerTitle: true,
        leading: IconButton(
          onPressed: ()async{
            await signout().then((value) {
              if (value){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context){
                      return const Login();
                    })
                );
              }
            });
          },
          icon: const Icon
            (Icons.logout_rounded),
        ),
        actions: const [Icon(Icons.menu_rounded)],
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: smart.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Page1(total: smart[index].price)),
                    );
                  },
                  child: TextAndIcon(
                    smart: smart[index],
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(20),
                        width: 180,
                        height: 180,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'All Tasks',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '46 items',
                              style: TextStyle(fontSize: 15,
                              color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 135,
                        child: Container(
                          height: 18,
                          decoration: const BoxDecoration(
                            color: Colors.pinkAccent,
                            shape: BoxShape.circle,
                          ),
                          margin: const EdgeInsets.all(14),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(20),
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Personal',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '22 items',
                              style: TextStyle(fontSize: 15,
                              color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 135,
                        child: Container(
                          height: 18,
                          decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                          margin: const EdgeInsets.all(8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(20),
                        width: 180,
                        height: 180,
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'My work',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '10 items',
                              style: TextStyle(fontSize: 15,
                                  color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 135,
                        child: Container(
                          height: 18,
                          decoration: const BoxDecoration(
                            color: Colors.orangeAccent,
                            shape: BoxShape.circle,
                          ),
                          margin: const EdgeInsets.all(14),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(20),
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Project',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '8 items',
                              style: TextStyle(fontSize: 15,
                                  color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 135,
                        child: Container(
                          height: 18,
                          decoration: const BoxDecoration(
                              color: Colors.greenAccent,
                              shape: BoxShape.circle),
                          margin: const EdgeInsets.all(8),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(20),
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        margin: const EdgeInsets.all(6),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Shopping',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '12 items',
                              style: TextStyle(fontSize: 15,
                              color: Colors.black26),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 135,
                        child: Container(
                          height: 18,
                          decoration: const BoxDecoration(
                            color: Colors.cyan,
                            shape: BoxShape.circle,
                          ),
                          margin: const EdgeInsets.all(14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
