import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<bool> likedList = List.generate(15, (index) => false);
  List<bool> bookmarkedList = List.generate(15, (index) => false);
  final PageController _pageController = PageController();

  void navigateToMessages() {
    _pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showStory(String storyName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(storyName),
          content:
              const Text("This is where the story content will be displayed."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var pic = [
      'https://images.pexels.com/photos/29609563/pexels-photo-29609563/free-photo-of-scenic-alpine-landscape-with-rustic-cabins.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
      'https://images.pexels.com/photos/12329504/pexels-photo-12329504.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/9102721/pexels-photo-9102721.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1387037/pexels-photo-1387037.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/2318543/pexels-photo-2318543.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/2236713/pexels-photo-2236713.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/1848662/pexels-photo-1848662.jpeg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/21323/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=600',
      'https://images.pexels.com/photos/2469122/pexels-photo-2469122.jpeg?auto=compress&cs=tinysrgb&w=600'
    ];

    var storyPics = [
      {
        'name': 'Raza',
        'image': 'https://randomuser.me/api/portraits/women/1.jpg',
      },
      {
        'name': 'Liaqat',
        'image': 'https://randomuser.me/api/portraits/men/2.jpg',
      },
      {
        'name': 'Sokat',
        'image': 'https://randomuser.me/api/portraits/women/3.jpg',
      },
      {
        'name': 'Sokat',
        'image': 'https://randomuser.me/api/portraits/women/3.jpg',
      },
      {
        'name': 'Sokat',
        'image': 'https://randomuser.me/api/portraits/women/3.jpg',
      },
      {
        'name': 'Sokat',
        'image': 'https://randomuser.me/api/portraits/women/3.jpg',
      },
      {
        'name': 'Sokat',
        'image': 'https://randomuser.me/api/portraits/women/3.jpg',
      },
    ];

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xFFfd746c),
                  Color(0xFFff9068),
                  Color(0xFF00aaff),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: navigateToMessages,
              icon: const Icon(Icons.message, color: Colors.white),
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              children: [
                // Stories Section
                SizedBox(
                  
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: storyPics.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => showStory(storyPics[index]['name']!),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                backgroundColor: Colors.blue,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                    storyPics[index]['image']!,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                storyPics[index]['name']!,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Post Section
                Expanded(
                  child: ListView.builder(
                    itemCount: pic.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 197, 190, 190),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.network(
                                pic[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                color: Colors.black.withOpacity(0.6),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Post ${index + 1}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            likedList[index]
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: likedList[index]
                                                ? Colors.red
                                                : Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              likedList[index] =
                                                  !likedList[index];
                                            });
                                            showSnackbar(
                                              context,
                                              likedList[index]
                                                  ? 'You liked post ${index + 1}'
                                                  : 'You unliked post ${index + 1}',
                                            );
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            bookmarkedList[index]
                                                ? Icons.bookmark
                                                : Icons.bookmark_border,
                                            color: bookmarkedList[index]
                                                ? Colors.yellow
                                                : Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              bookmarkedList[index] =
                                                  !bookmarkedList[index];
                                            });
                                            showSnackbar(
                                              context,
                                              bookmarkedList[index]
                                                  ? 'You bookmarked post ${index + 1}'
                                                  : 'You removed bookmark from post ${index + 1}',
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const MessagesScreen(),
          ],
        ),
      ),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Messages Screen (not developed)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
                'This is where you would show messages or chat content.'),
          ],
        ),
      ),
    );
  }
}
