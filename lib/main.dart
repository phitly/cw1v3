import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter & Image Toggle App',
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
            )
          : ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.light,
              ),
            ),
      home: MyHomePage(
        title: 'Counter & Image Toggle App',
        onThemeToggle: _toggleTheme,
        isDarkMode: _isDarkMode,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final String title;
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _showFirstImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _showFirstImage = !_showFirstImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Counter Section
              const Text(
                'Counter Value:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Increment'),
              ),
              
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),
              
              // Image Toggle Section
              const Text(
                'Image Toggle:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: _showFirstImage
                      ? Icon(
                          Icons.sunny,
                          size: 100,
                          color: widget.isDarkMode ? Colors.yellow : Colors.orange,
                        )
                      : Icon(
                          Icons.nightlight_round,
                          size: 100,
                          color: widget.isDarkMode ? Colors.lightBlue : Colors.indigo,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleImage,
                child: const Text('Toggle Image'),
              ),
              
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 20),
              
              // Theme Toggle Section
              const Text(
                'Theme Mode:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                widget.isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: widget.onThemeToggle,
                child: Text(
                  widget.isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
