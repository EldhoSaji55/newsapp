import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Explore publishers and trending news",
                style: GoogleFonts.sourceSans3(
                  textStyle:
                      const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Publishers Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Publishers",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to "See All" Publishers screen
                    },
                    child: const Text("See All"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Horizontally Scrollable Publisher Cards
              SizedBox(
                height: 167,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10, // Example number of publishers
                  itemBuilder: (context, index) {
                    return _buildPublisherCard();
                  },
                ),
              ),
              const SizedBox(height: 20),
              // News Section
              const Text(
                "News",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // News Filters (Horizontally Scrollable)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterButton("All"),
                    _buildFilterButton("Newest"),
                    _buildFilterButton("Most Viewed"),
                    _buildFilterButton("Popular"),
                    _buildFilterButton("Trending"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a Publisher Card
  Widget _buildPublisherCard() {
    return Container(
      width: 147,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Publisher Logo
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/7/79/Forbes_logo.svg"), // Replace with dynamic logo
          ),
          const SizedBox(height: 10),
          // Publisher Title
          Text(
            "Forbes",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          // Follow Button
          ElevatedButton(
            onPressed: () {
              // Follow/Unfollow logic
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Follow"),
          ),
        ],
      ),
    );
  }

  // Helper method to build a Filter Button
  Widget _buildFilterButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextButton(
        onPressed: () {
          // Handle filter logic
        },
        child: Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
