import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: 120,
            padding: EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Search",
                    ),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.camera_alt,
                  color: Colors.grey[800],
                  size: 30,
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              'Stories',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            Text('See Active')
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 180,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          makeStory(
                              storyImage: 'assets/two.jpg',
                              userName: 'Alemitu Tefera',
                              userImage: 'assets/one.jpg'),
                          makeStory(
                              storyImage: 'assets/three.jpg',
                              userImage: 'assets/four.jpg',
                              userName: 'Amanuel Kutalo'),
                          makeStory(
                            storyImage: 'assets/five.jpg',
                            userImage: 'assets/six.jpg',
                            userName: 'Mesihu Amanuel',
                          ),
                          makeStory(
                            storyImage: 'assets/eight.jpg',
                            userImage: 'assets/seven.jpg',
                            userName: 'Gech Aman',
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/four.jpg'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Amanuel Kutalo',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_horiz,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      width: 1000,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Image.asset(
                        'assets/one.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('2K'),
                        SizedBox(
                          width: 140,
                        ),
                        Text('120'),
                        Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('7'),
                        Icon(
                          Icons.share,
                          color: Colors.grey,
                          size: 20,
                        )
                      ],
                    ),
                    makeLikeButton(),
                  ]),
            ),
          ))
        ],
      ),
    );
  }

  Widget makeStory({storyImage, userImage, userName}) {
    return AspectRatio(
      aspectRatio: 1.6 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image:
              DecorationImage(image: AssetImage(storyImage), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.1),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                        image: AssetImage(userImage), fit: BoxFit.cover)),
              ),
              Text(
                userName,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeLikeButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: BorderDirectional(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(isPressed ? Icons.thumb_up : FontAwesomeIcons.thumbsUp),
            color: isPressed ? Colors.blue : Colors.grey,
            onPressed: () {
              setState(() {
                isPressed = !isPressed;
              });
            },
          ),
          Text(
            "Like",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.chat, color: Colors.grey),
          Text(
            "Comment",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.share, color: Colors.grey),
          Text(
            "Share",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
