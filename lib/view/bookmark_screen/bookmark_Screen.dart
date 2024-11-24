import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bookmarks",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Saved articles for later reading",
                style: GoogleFonts.sourceSans3(
                  textStyle:
                      const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: 10, // Example item count
          itemBuilder: (context, index) {
            return _buildBookmarkCard();
          },
        ),
      ),
    );
  }

  // Helper method to build a Bookmark Card
  Widget _buildBookmarkCard() {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article Heading
            Text(
              "Breaking News: Flutter 3.0 Released",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // News Metadata
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/7/79/Forbes_logo.svg"), // Example channel logo
                    ),
                    const SizedBox(width: 10),
                    const Text("Forbes"),
                  ],
                ),
                const Text("2 hours ago"),
              ],
            ),
            const SizedBox(height: 10),
            // News Category
            const Text(
              "Technology",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            // Bookmark Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://via.placeholder.com/400x200", // Placeholder image
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
