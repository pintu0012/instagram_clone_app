import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: GoogleFonts.nunito().fontFamily,
          primarySwatch: Colors.red,
          appBarTheme: AppBarTheme(brightness: Brightness.dark)),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images = [
    'https://filmfare.wwmindia.com/content/2020/oct/ranveersingh11602233648.jpg',
    'https://resizing.flixster.com/rAsJJ6c0ouzhDU9l7HuMr1fGvqo=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/586740/586740_v9_ba.jpg',
    'https://static.toiimg.com/thumb/msid-80055727,width-1200,height-900,resizemode-4/.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/8/8b/Katrina_Kaif_promoting_Bharat_in_2019.jpg',
    'https://www.pinkvilla.com/files/styles/contentpreview/public/arjun-kapoor-completes-nine-years-main.jpg?itok=otBq57uG',
    'https://upload.wikimedia.org/wikipedia/commons/6/66/Kareena_Kapoor_at_TOIFA16.jpg',
    'https://static.toiimg.com/thumb/8221315.cms?width=170&height=240',
    'https://i.pinimg.com/originals/b4/bd/99/b4bd993cc5925116416cf76b06bdfc7f.jpg'
  ];
  List<String> names = [
    'ranveersingh',
    'realsonakshi',
    'deepikapadukon',
    'katrinakaif',
    'arjunkapoor',
    'kareenakapoor',
    'akshaykumar',
    'ajaydevgan'
  ];
  @override
  Widget build(BuildContext context) {
    buildStorySection() {
      return Container(
        height: 110.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36.0,
                    backgroundColor: Colors.red,
                    child: CircleAvatar(
                      radius: 33.0,
                      backgroundImage: NetworkImage(images[index]),
                    ),
                  ),
                  Text(
                    names[index],
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    buildUserTile(String url, String name) {
      return Container(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            radius: 20.0,
            backgroundImage: NetworkImage(url),
          ),
          title: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          trailing: Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
        ),
      );
    }

    buildPostBody(String image) {
      return Container(
        child: Stack(
          children: [
            Image.network(image),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(500.0)),
                child: Text(
                  '1/3',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
            ),
          ],
        ),
      );
    }

    buildLikeAndCommentSection() {
      return Container(
        padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
        child: Row(
          children: [
            Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 12.0,
            ),
            Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            SizedBox(
              width: 12.0,
            ),
            Icon(
              Icons.send_outlined,
              color: Colors.white,
            ),
            Expanded(
              child: SizedBox(
                width: 12.0,
              ),
            ),
            Icon(
              Icons.turned_in_not,
              color: Colors.white,
            ),
            SizedBox(
              width: 12.0,
            ),
          ],
        ),
      );
    }

    buildCountSection() {
      return Container(
        child: Row(
          children: [
            SizedBox(
              width: 12.0,
            ),
            Text(
              '61,02,028 views',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              width: 12.0,
            ),
            Text('Liked by imandks',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
      );
    }

    buildCaptionSection(String name) {
      return Container(
        height: 100.0,
        margin: EdgeInsets.only(left: 12.0, top: 5.0),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Row(
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' The past is done.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'View all 24,364 comments',
              style: TextStyle(color: Colors.white38),
            )
          ],
        ),
      );
    }

    buildPostsListView() {
      return Container(
        child: ListView.builder(
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildUserTile(images[index].toString(), names[index]),
                    buildPostBody(images[index]),
                    buildLikeAndCommentSection(),
                    buildCountSection(),
                    buildCaptionSection(names[index]),
                  ],
                ),
              );
            }),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Image.asset(
          'assets/logo.png',
          height: 60.0,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add_box_outlined),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.send),
          ),
        ],
      ),
      body: Column(
        children: [
          buildStorySection(),
          Expanded(child: buildPostsListView()),
        ],
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(
                    color: Colors
                        .yellow))), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.deepOrange,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.slideshow),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'School',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'Settings',
            ),
          ],
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
