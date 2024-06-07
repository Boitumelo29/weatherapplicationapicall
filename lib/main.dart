import 'package:flutter/material.dart';
import 'package:weatherapplicationapicall/weather_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController search = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: search,
              decoration: const InputDecoration(
                hintText: 'Enter city',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                WeatherPage.loadd(search.text);
              },
              child: const Text("Search"),
            ),
            WeatherPage(
              city: search.text,
            )
          ],
        ),
      ),
    );
  }
}
