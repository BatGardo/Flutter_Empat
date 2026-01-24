import 'package:flutter/material.dart';

class Project3 extends StatefulWidget {
  const Project3({super.key, required this.title});
  final String title;

  @override
  State<Project3> createState() => _Project3State();
}

class _Project3State extends State<Project3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '${widget.title} "Discord at home"',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Row(
          children: [
            // Left Column Channels
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(5.0),
                color: const Color.fromARGB(255, 0, 0, 0),
                alignment: Alignment.topCenter,
                // Channels List
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildMessagesBlock(),
                        buildChannelBox(
                          imageURL:
                              'https://i.pinimg.com/1200x/d0/33/b3/d033b35238b7c9f1b1bfbc16338f9995.jpg',
                          text: 'CH1',
                        ),
                        buildChannelBox(
                          imageURL:
                              'https://www.make.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2Fun655fb9wln6%2FappIcon-discord%2Fb4015a36e7cc3d7c65f221118342f416%2Fdiscord.png&w=3840&q=75',
                          text: 'CH2',
                        ),
                        buildChannelBox(text: 'Channel 3'),
                        buildChannelBox(
                          imageURL:
                              'https://i.pinimg.com/736x/37/a4/bf/37a4bf61e3ff8724cbd0516713c76cdf.jpg',
                          text: 'CH4',
                        ),
                        buildChannelBox(
                          imageURL:
                              'https://i.pinimg.com/736x/23/fe/1b/23fe1bb4769da1bbe6cb8cc85a310f48.jpg',
                          text: 'CH5',
                        ),
                        buildChannelBox(text: 'CH6'),
                        buildChannelBox(text: 'CH7'),
                        buildChannelBox(text: 'CH8'),
                        buildChannelBox(text: 'CH9'),
                        buildChannelBox(text: 'CH10'),
                        buildChannelBox(text: 'CH11'),
                        buildChannelBox(text: 'CH12'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Right Column Messages
            Expanded(
              flex: 8,
              // For hovering messenger button
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: const Color.fromARGB(255, 20, 20, 20),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                      ),
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
                        buildsearchBar(),
                        const SizedBox(height: 10),
                        // Activity bar
                        SizedBox(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              buildActivityBar(
                                imageURL:
                                    'https://i.pinimg.com/736x/98/ab/63/98ab63e0f8a70f44d8071a0a0803f706.jpg',
                                toptext: 'User A',
                                bottomtext: 'Democracy',
                              ),
                              buildActivityBar(
                                toptext: 'User C',
                                bottomtext: 'Channel 3',
                              ),
                              buildActivityBar(
                                imageURL:
                                    'https://i.pinimg.com/1200x/b0/25/ed/b025ed9dc74e7ed7b3c9a7f7b69ebe47.jpg',
                                toptext: 'User D',
                                bottomtext: 'Saint six',
                              ),
                            ],
                          ),
                        ),
                        //const SizedBox(height: 10),
                        // Users List
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                buildUsersBox(
                                  imageUrl:
                                      'https://i.pinimg.com/736x/98/ab/63/98ab63e0f8a70f44d8071a0a0803f706.jpg',
                                  topText: 'User A',
                                  bottomText: 'Call ended',
                                  lastActivity: '5m',
                                  status: 'Online',
                                ),
                                buildUsersBox(
                                  imageUrl:
                                      'https://i.pinimg.com/1200x/f2/7a/34/f27a34384238e446eccc00baa5ceda9a.jpg',
                                  topText: 'User B',
                                  bottomText:
                                      'You: Hey, D want primogems again...',
                                  color: const Color.fromARGB(255, 30, 31, 36),
                                  lastActivity: '2d',
                                ),
                                buildUsersBox(
                                  topText: 'User C',
                                  bottomText: 'User C: Where`s my avatar?',
                                  lastActivity: '10h',
                                  status: 'Online',
                                ),
                                buildUsersBox(
                                  imageUrl:
                                      'https://i.pinimg.com/1200x/b0/25/ed/b025ed9dc74e7ed7b3c9a7f7b69ebe47.jpg',
                                  topText: 'User D',
                                  bottomText: 'User D: PRIMOGEEEEEEEMS',
                                  lastActivity: '3w',
                                  status: 'Online',
                                ),
                                buildUsersBox(
                                  topText: 'User E',
                                  bottomText: 'Call ended',
                                  lastActivity: '3w',
                                  status: 'Online',
                                ),
                                buildUsersBox(
                                  topText: 'User F',
                                  bottomText: 'Call missed',
                                  lastActivity: '1mo',
                                ),
                                buildUsersBox(
                                  topText: 'User G',
                                  bottomText: 'Call ended',
                                  lastActivity: '2mo',
                                  status: 'Online',
                                ),
                                buildUsersBox(
                                  topText: 'User H',
                                  bottomText: 'You: Busy, not now',
                                  lastActivity: '2mo',
                                ),
                                buildUsersBox(
                                  topText: 'User I',
                                  bottomText: 'User I: You saw me?',
                                  lastActivity: '6mo',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Hovering messenger button
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: buildHoverMessengerButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buildFooterNavigationBar(),
    );
  }

  Widget buildHoverMessengerButton() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 88, 101, 242),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Icon(Icons.messenger_rounded, color: Colors.white, size: 28),
    );
  }

  Widget buildMessagesBlock() {
    return Column(
      children: [
        // Messenger Icon
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 88, 101, 242),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Icon(Icons.messenger_rounded, color: Colors.white, size: 28),
        ),
        // Spacing and line
        const SizedBox(height: 12),
        Container(
          height: 2,
          width: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 18, 18, 18),
          ),
        ),
      ],
    );
  }

  Widget buildFooterNavigationBar() {
    return Container(
      height: 60,
      // Whole Footer Bar
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 32, 34, 37),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Home Button
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home, color: Colors.white),
                    Text('Home', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
          // Notifications Button
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.notifications, color: Colors.white),
                    Text(
                      'Notifications',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Profile Button
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/1200x/8c/de/7f/8cde7fc74f96df9c68e2656a21169bca.jpg',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    Text('You', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildChannelBox({
    Color color = const Color.fromARGB(255, 0, 0, 0),
    String? imageURL = null,
    required text,
  }) {
    return SizedBox(
      height: 80,
      width: 60,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        // Material and InkWell for button effect
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8.0),
              ),
              // Image checker
              child: Center(
                child: imageURL != null
                    ? CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(imageURL),
                        backgroundColor: Colors.transparent,
                      )
                    : Text(
                        text,
                        maxLines: 1,
                        style: const TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUsersBox({
    String imageUrl =
        'https://www.make.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2Fun655fb9wln6%2FappIcon-discord%2Fb4015a36e7cc3d7c65f221118342f416%2Fdiscord.png&w=3840&q=75',
    required String topText,
    required String bottomText,
    Color color = const Color.fromARGB(255, 20, 20, 20),
    required String lastActivity,
    String status = 'Offline',
  }) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        // Material and InkWell for button effect
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    // Avatar with status indicator left side
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(imageUrl),
                          backgroundColor: Colors.transparent,
                        ),
                        // Status indicator
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: status == 'Online'
                                  ? Colors.green
                                  : Colors.grey,
                              shape: BoxShape.circle,
                              border: Border.all(color: color, width: 4),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 12),
                    // Texts and last activity Right side
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            //Texts Column
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  topText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 125, 127, 140),
                                  ),
                                ),
                                Text(
                                  bottomText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: const Color.fromARGB(
                                      255,
                                      140,
                                      145,
                                      152,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 6),
                          // Last activity Text
                          Text(
                            lastActivity,
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 109, 110, 115),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildsearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          // Icon search
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 32, 34, 37),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 10),
          // Friend add button
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 54, 57, 63),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.people, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  Text('Add friends', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildActivityBar({
    String imageURL =
        'https://www.make.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net/un655fb9wln6/appIcon-discord/b4015a36e7cc3d7c65f221118342f416/discord.png&w=3840&q=75',
    required String toptext,
    required String bottomtext,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // For hover effect
      child: Stack(
        children: [
          // Main Container
          Container(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 36.0, 12.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 32, 34, 37),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Avatar Image left
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(imageURL),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(width: 12),
                // Texts Column center
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      toptext,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bottomtext,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Hover icon button topright
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 32,
              height: 32,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 46, 49, 54),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.volume_up, color: Colors.grey, size: 20),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
