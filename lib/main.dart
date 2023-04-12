import 'package:flutter/material.dart';

import 'newsfeed.dart';
import 'notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A04MDEV1005W23',

      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const MyHomePage(title: 'Mobile Web Applications - MDEV1005 W23'),
        '/newsfeed': (context) => NewsFeedPage(),
        '/notes': (context) => const NotesPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(''),
            Image.asset(
              'images/welcome.png',
              width: 750,
              height: 350,
            ),
            Text(
              'Welcome the Exciting Flutter Web Application Project!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 29,
              ),
            ),
            SizedBox(height: 18),
            Text(
              'MAHFUZ AFTAB & RABIH NADER, worked as a team to complete the of Mobile Web Application-MDEV1005 W23 Assignment 04',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 14),
            Text(
              'Select your desired tool',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsFeedPage(),
                      ),
                    );
                  },
                  child: const Text('Newsfeed'),
                ),
                const SizedBox(width: 14),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotesPage(),
                      ),
                    );
                  },
                  child: const Text('Notes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

