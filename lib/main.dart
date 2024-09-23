import 'package:flutter/material.dart';

void main() {
  runApp(CarMenuApp());
}

class CarMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Menu App',
      theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
      home: CarMenuScreen(),
    );
  }
}

class CarMenuScreen extends StatelessWidget {
  final List<Map<String, String>> cars = [
    {
      'title': 'Седан', 
      'image': 'assets/9305.jpeg',
      'description': 'Описание седана: удобный и экономичный.'
    },
    {
      'title': 'Легковушка',
      'image': 'assets/AQABFIKIRoaubfEbmb1FGDAx8LGNuk1__VwP0inp0eWTRly1omM3B7Z3Mn2sJE8VW6nzFPdNM_9vgdM9qxZBbgK20mw.jpg',
      'description': 'Описание легковушки: идеальна для города.'
    },
    {
      'title': 'Легковушка 2',
      'image': 'assets/cb408c9a3850ffade17fdd8c137f0f865374ddf8.webp',
      'description': 'Описание легковушки 2: комфорт и стиль.'
    },
    {
      'title': 'Внедорожник',
      'image': 'assets/deb4d2f2ivh8n47mksvhbj3sslpbqlk9.jpg',
      'description': 'Описание внедорожника: для сложных условий.'
    },
    {
      'title': 'Спорткар',
      'image': 'assets/samye-dorogie-avtomobili_shut.jpg',
      'description': 'Описание спорткара: скорость и мощь.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Меню машин'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarDetailScreen(
                      title: cars[index]['title']!,
                      image: cars[index]['image']!,
                      description: cars[index]['description']!,
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      cars[index]['image']!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cars[index]['title']!,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CarDetailScreen extends StatelessWidget {
  final String title;
  final String image;
  final String description;

  CarDetailScreen({required this.title, required this.image, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
