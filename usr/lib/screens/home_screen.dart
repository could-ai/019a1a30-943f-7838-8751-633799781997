import 'package:flutter/material.dart';
import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<User> _users = [
    User(
      name: 'Jessica',
      age: 25,
      imageUrl: 'https://picsum.photos/id/1011/800/600',
      bio: 'Lover of dogs, coffee, and travel.',
    ),
    User(
      name: 'Mark',
      age: 28,
      imageUrl: 'https://picsum.photos/id/1012/800/600',
      bio: 'Into hiking, coding, and good food.',
    ),
    User(
      name: 'Emily',
      age: 22,
      imageUrl: 'https://picsum.photos/id/1013/800/600',
      bio: 'Artist and musician. Let\'s create something beautiful.',
    ),
     User(
      name: 'David',
      age: 30,
      imageUrl: 'https://picsum.photos/id/1014/800/600',
      bio: 'Entrepreneur and fitness enthusiast.',
    ),
  ];

  int _currentIndex = 0;

  void _nextUser() {
    setState(() {
      if (_currentIndex < _users.length - 1) {
        _currentIndex++;
      } else {
        // Optional: loop back to the first user or show a "no more users" message
        _currentIndex = 0; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Your Match'),
        backgroundColor: Colors.pink[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ProfileCard(user: _users[_currentIndex]),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _nextUser,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.close, color: Colors.red, size: 40),
                ),
                FloatingActionButton(
                  onPressed: _nextUser,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.favorite, color: Colors.green, size: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
