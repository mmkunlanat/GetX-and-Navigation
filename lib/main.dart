import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'gallery.dart';
import 'drawer.dart'; // เพิ่ม import

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = <String>[
      'assets/images/tr1.jpg',
      'assets/images/tr2.jpg',
      'assets/images/tr3.jpg',
      'assets/images/tr4.jpg',
      'assets/images/tr5.jpg',
      'assets/images/tr6.jpg',
      'assets/images/tr7.jpg',
      'assets/images/tr8.jpg',
      'assets/images/tr9.jpg',
      'assets/images/tr10.jpg',
    ];

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const MainApp(), // หรือเปลี่ยนเป็นหน้า Home ก็ได้
        ),
        GetPage(
          name: '/allimages',
          page: () => GalleryPage(imageList: Get.arguments ?? []),
        ),
      ],
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My list views app"),
          backgroundColor: const Color.fromARGB(255, 249, 141, 246),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pink.withAlpha((0.15 * 255).round()),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                icon: const Icon(Icons.photo_library, color: Colors.black),
                label: const Text(
                  'ดูรูปทั้งหมด',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                onPressed: () {
                  Get.toNamed('/allimages', arguments: imageList);
                },
              ),
            ),
          ],
        ),
        drawer: MyDrawer(imageList: imageList),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 180,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imageList[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 248, 155, 231),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text('รายการที่ ${index + 1}'),
                      subtitle: Text('รายละเอียดของรายการที่ ${index + 1}'),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Color.fromARGB(255, 248, 151, 219),
                      ),
                      onTap: () {},
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
