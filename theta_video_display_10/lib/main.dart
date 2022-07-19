import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theta_video_display_10/screens/dropbox_screen.dart';
import 'package:theta_video_display_10/screens/firebase_screen.dart';
import 'package:theta_video_display_10/screens/github_screen.dart';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
    routes: <String, WidgetBuilder>{
      "/firebase": (BuildContext context) => FireBaseScreen(),
      "/dropbox": (BuildContext context) => DropBoxScreen(),
      "/github": (BuildContext context) => GithubScreen(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("360 Video Storage")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text('More Info'),
                            content: Text(
                                'THETA video files can be accessed on commercial cloud services to display in 360 view. We demo Github, Firebase and Dropbox.'),
                            actions: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context, "OK"),
                                  child: Text('OK'))
                            ],
                          )),
                  child: Text('more info')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/github");
                },
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  color: Color.fromARGB(255, 87, 87, 87),
                ),
                iconSize: 80,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/dropbox");
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.dropbox,
                    color: Color.fromARGB(255, 29, 137, 225),
                  ),
                  iconSize: 80),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/firebase");
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.fire,
                    color: Color.fromARGB(255, 255, 187, 86),
                  ),
                  iconSize: 80),
            ],
          ),
        ],
      ),
    );
  }
}
