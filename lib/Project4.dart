import 'package:flutter/material.dart';
import 'package:flutter_empat_main/widgets/Project4widgets.dart';

//1) Побудувати Scaffold віджет, Drawer, FloatingButton, BottomNavigationBar
//2) Анімований BottomNavigationBar
//3) Анімований Hero віджет
class Project4 extends StatefulWidget {
  const Project4({super.key, required this.title});
  final String title;

  @override
  State<Project4> createState() => _Project4State();
}

class _Project4State extends State<Project4> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    _HomePage(),
    _NotificationsPage(),
    _ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Overall Scaffold, all app built with scaffold, in every project
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          '${widget.title} "Discord at home"',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      drawer: buildDrawer(),
      body: _pages[currentIndex],
      bottomNavigationBar: buildFooterNavigationBar(),
    );
  }

  // Navigation Item Widget
  Widget navItem({
    required int index,
    required Widget icon,
    required String label,
  }) {
    final bool isActive = currentIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconTheme(
            data: IconThemeData(
              color: isActive ? Colors.white : Colors.grey,
              size: 22,
            ),
            child: icon,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Rework Footer Navigation Bar
  Widget buildFooterNavigationBar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 32, 34, 37),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          navItem(index: 0, icon: const Icon(Icons.home), label: 'Home'),
          navItem(
            index: 1,
            icon: const Icon(Icons.notifications),
            label: 'Notifications',
          ),
          navItem(
            index: 2,
            icon: const CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/1200x/8c/de/7f/8cde7fc74f96df9c68e2656a21169bca.jpg',
              ),
              backgroundColor: Colors.transparent,
            ),
            label: 'You',
          ),
        ],
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          // Left Column Channels
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              color: const Color.fromARGB(255, 0, 0, 0),
              alignment: Alignment.topCenter,
              // Channels List
              child: ListView(
                children: [
                  buildMessagesBlock(context),
                  buildChannelBoxGrouped(context),
                ],
              ),
            ),
          ),
          // Right Column Messages
          Expanded(
            flex: 8,
            child: Container(
              decoration: const BoxDecoration(
                color: const Color.fromARGB(255, 20, 20, 20),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Messages
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: const Text(
                      'Messages',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  // Search bar and Add friends button
                  buildsearchBar(context),
                  const SizedBox(height: 10),
                  // Activity bar
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [activityBoxGrouped(context)],
                    ),
                  ),
                  //const SizedBox(height: 10),
                  // Users List
                  Expanded(
                    child: ListView(children: [userBoxGrouped(context)]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Reworked into FloatingAction from Stack
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SnackBar snackBar = const SnackBar(
            content: Text('Floating Action Button Pressed!'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}

class _NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Notifications Page',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final String userId;
  final String name;
  final String avatarUrl;

  const ChatPage({
    super.key,
    required this.userId,
    required this.name,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            Hero(
              tag: 'user_$userId',
              child: CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
            ),
            const SizedBox(width: 12),
            Text(name, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Chat with $name',
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
