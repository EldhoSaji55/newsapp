import 'package:flutter/material.dart';
import 'package:newsapp/controller/home_screen_controller/home_screen_controller.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/utils/constants/color_constants.dart';
import 'package:newsapp/view/detailednews_Screen/detailedNews.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeScreenController>().gettrendingNews();
    context.read<HomeScreenController>().getRecommendedNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Welcome Back Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back, User!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Here\'s the latest updates for you.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 24),

          // Trending News Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending News',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                height: 200,
                child: Consumer<HomeScreenController>(
                  builder: (context, Homecontroller, child) => Homecontroller
                          .isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Homecontroller.topArticles.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.only(right: 16),
                              child: Container(
                                width: 300,
                                child: Stack(
                                  children: [
                                    Image.network(
                                      Homecontroller
                                              .topArticles[index].urlToImage ??
                                          "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg?w=900",
                                      width: 300,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      top: 10,
                                      left: 10,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        color: Colors.black.withOpacity(0.6),
                                        child: Text(
                                          'Category',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Container(
                                        color: ColorConstants.mainWhite,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Homecontroller.topArticles[index]
                                                      .title ??
                                                  "",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  Homecontroller
                                                          .topArticles[index]
                                                          .source!
                                                          .name ??
                                                      "",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  'Date',
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),

          // Recommendations Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommendations',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Consumer<HomeScreenController>(
                builder: (context, RecoNewsController, child) =>
                    RecoNewsController.isRLoading
                        ? Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: RecoNewsController.allArticles.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewsDetailScreen(
                                        imageUrl:
                                            "https://via.placeholder.com/300",
                                        title:
                                            "Breaking News: Flutter is Amazing!",
                                        category: "Technology",
                                        channelName: "Tech World",
                                        publishDate: "Nov 23, 2024",
                                        content:
                                            "Flutter continues to grow as one of the most popular frameworks for building cross-platform applications. Developers love its flexibility and performance.",
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                RecoNewsController
                                                        .allArticles[index]
                                                        .urlToImage ??
                                                    "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg?w=900",
                                              ),
                                            ),
                                            SizedBox(width: 8),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  RecoNewsController
                                                          .allArticles[index]
                                                          .source!
                                                          .name ??
                                                      "",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  RecoNewsController
                                                      .topArticles[index]
                                                      .publishedAt
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            ElevatedButton(
                                              onPressed: () {},
                                              child: Text('Follow'),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          RecoNewsController
                                                  .allArticles[index].title ??
                                              "",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Author: ${RecoNewsController.allArticles[index].author ?? ""}',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Image.network(
                                          RecoNewsController.allArticles[index]
                                                  .urlToImage ??
                                              "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg?w=900",
                                          width: double.infinity,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
