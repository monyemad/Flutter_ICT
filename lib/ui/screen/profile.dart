import 'package:first_app/cubit/my_app_cubit.dart';
import 'package:first_app/cubit/my_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubitA, AppStateA>
        (builder: (context, state) {
          if (context.read<AppCubitA>().userData != null) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                   CircleAvatar(
                    radius: 80,
                    backgroundImage: context
                        .read<AppCubitA>()
                        .userData!
                        .image ==
                        ''
                        ? const NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3541/3541871.png')
                        : NetworkImage(
                        context.read<AppCubitA>().userData!.image),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                            style: BorderStyle.solid, color: Colors.black54),
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                          onPressed: () {
                            context.read<AppCubitA>().pickImage();
                          },
                          icon: const Icon(Icons.photo_camera_outlined)),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.black,
                  ),
                ),
                child: ListTile(
                  style: ListTileStyle.list,
                  title: Text(
                    context.read<AppCubitA>().userData!.name,
                  ),
                  leading: const Text(
                    'User Name:',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.black,
                  ),
                ),
                child: ListTile(
                  style: ListTileStyle.list,
                  title: Text(
                    context.read<AppCubitA>().userData!.email,
                  ),
                  leading: const Text(
                    'Email:',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.black,
                  ),
                ),
                child: ListTile(
                  style: ListTileStyle.list,
                  title: Text(
                    context.read<AppCubitA>().userData!.phone,
                  ),
                  leading: const Text(
                    'Phone Number:',
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
          ),
        );
      }
      else{
        return const Text('Error',
        style: TextStyle(fontSize: 150),);
    }
    }
    ),
    );
  }
}
