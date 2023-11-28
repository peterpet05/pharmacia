import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/models/news_model.dart';
import 'package:pharmacia/utils/api_services.dart';

class AllArticle extends StatefulWidget {
  const AllArticle({super.key});

  @override
  State<AllArticle> createState() => _AllArticleState();
}

class _AllArticleState extends State<AllArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F4EB),
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFFF6F4EB),
        automaticallyImplyLeading: true,
        elevation: 4.0,
        titleSpacing: 0.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: FutureBuilder<NewsPost>(
        future: getNews(),
        builder: (context, AsyncSnapshot<NewsPost> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<News> newsList = snapshot.data!.newsList;

            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 17.5, right: 17.5, bottom: 5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F4EB),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 0.5,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Image.network(
                            newsList[index].thumbnail,
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 11.0, 15.0, 0.0),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF4682A9),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              newsList[index].category,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(11.0, 8.0, 15.0, 5.0),
                          child: Text(
                            newsList[index].title,
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(11.0, 5.0, 15.0, 10.0),
                          child: Row(
                            children: [
                              Icon(Icons.person_2_outlined, color: Colors.black.withOpacity(0.5), size: 20,),
                              SizedBox(width: 5,),
                              Text(newsList[index].author + "    |  "),
                              SizedBox(width: 5,),
                              Icon(Icons.date_range_outlined, color: Colors.black.withOpacity(0.5), size: 18,),
                              SizedBox(width: 5,),
                              Text(newsList[index].date),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
