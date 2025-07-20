import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  final List<String> imageList;
  const MyDrawer({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 163, 73, 0)),
            child: Text('Menu', style: TextStyle(fontSize: 30, color: Colors.white)),
          ),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              Get.offAllNamed('/');
            },
          ),
          ListTile(
            title: const Text('All images'),
            leading: const Icon(Icons.photo_library),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed('/allimages', arguments: imageList);
            },
          ),
        ],
      ),
    );
  }
}
