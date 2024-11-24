import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublisherScreen extends StatelessWidget {
  final String publisherName;
  final String aboutPublisher;
  final String logoUrl;
  final bool isVerified;
  final int totalNews;
  final int followers;
  final int following;

  const PublisherScreen({
    super.key,
    required this.publisherName,
    required this.aboutPublisher,
    required this.logoUrl,
    this.isVerified = false,
    required this.totalNews,
    required this.followers,
    required this.following,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            publisherName,
            style: GoogleFonts.roboto(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle more icon action
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Publisher Logo and Stats Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Publisher Logo
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(logoUrl),
                  ),
                  const SizedBox(width: 20),
                  // Stats
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatColumn("Headings", totalNews),
                        _buildStatColumn("Followers", followers),
                        _buildStatColumn("Following", following),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Follow Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Follow/Unfollow logic
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Follow"),
                ),
              ),
              const SizedBox(height: 20),
              // Publisher Name and Verification
              Row(
                children: [
                  Text(
                    publisherName,
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (isVerified)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.blue,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              // About Section
              const Text(
                "About",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                aboutPublisher,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              // News by Publisher Section
              Text(
                "News by $publisherName",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              // Sort By Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sort by", style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    items: const [
                      DropdownMenuItem(value: "newest", child: Text("Newest")),
                      DropdownMenuItem(
                          value: "most_viewed", child: Text("Most Viewed")),
                      DropdownMenuItem(
                          value: "popular", child: Text("Popular")),
                      DropdownMenuItem(
                          value: "trending", child: Text("Trending")),
                    ],
                    onChanged: (value) {
                      // Handle sort logic
                    },
                    hint: const Text("Newest"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Search Bar
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search news...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create stats column
  Widget _buildStatColumn(String label, int count) {
    return Column(
      children: [
        Text(
          "$count",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ],
    );
  }
}
