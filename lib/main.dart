import 'package:flutter/material.dart';

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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My list views app"),
          backgroundColor: const Color.fromARGB(255, 249, 141, 246),
        ),
        body: Column(
          children: [
            // GridView Section with images
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
                  itemCount: imageList.length,
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
            // ListView Section
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
                      onTap: () {
                        // เพิ่ม action เมื่อกดแต่ละรายการได้ที่นี่
                      },
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
