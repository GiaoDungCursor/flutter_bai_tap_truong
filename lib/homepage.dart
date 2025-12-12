import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top icons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Welcome text
              const Text(
                "Welcome,",
                style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Charlie",
                style: TextStyle(fontSize: 24),
              ),

              const SizedBox(height: 20),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Saved places title
              const Text(
                "Saved Places",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Grid of images
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: [
                    placeCard('assets/image/Picture1.png'),
                    placeCard('assets/image/Picture2.png'),
                    placeCard('assets/image/Picture3.png'),
                    placeCard('assets/image/Picture4.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget placeCard(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        path,
        fit: BoxFit.cover,
      ),
    );
  }
}