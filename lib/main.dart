import 'package:flutter/material.dart';

// import two custom tools into the application
import 'newsfeed.dart';
import 'notes.dart';

// The main() function the entry point of the app
void main() {
  runApp(const MyApp());
}

// MyApp widget that represents application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // build() method returns a MaterialApp widget which contains the application routes, theme
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App Title
      title: 'A04MDEV1005W23',

      // App Theme
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      // initial route of app (home)
      initialRoute: '/',

      // routes of app Home Page, Newsfeed Page, Notes Page
      routes: {
        '/': (context) => const MyHomePage(title: 'Mobile Web Applications - MDEV1005 W23'),
        '/newsfeed': (context) => NewsFeedPage(),
        '/notes': (context) => const NotesPage(),
      },
    );
  }
}

// Define StatefulWidget class called MyHomePage
class MyHomePage extends StatefulWidget {

  // Constructor requires title and key
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  // Override createState method to return new _MyHomePageState
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Define State class called _MyHomePageState
class _MyHomePageState extends State<MyHomePage> {

  // Override the build method to create the UI for the widget
  @override
  Widget build(BuildContext context) {
    // Return a Scaffold with an AppBar and a body containing a Column
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
              'MAHFUZ AFTAB & RABIH NADER, worked as a team to complete the Mobile Web Application-MDEV1005 W23 Assignment 04',
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

