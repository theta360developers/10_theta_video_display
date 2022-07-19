import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_360/video_360.dart';

class GithubScreen extends StatefulWidget {
  @override
  _GithubScreenState createState() => _GithubScreenState();
}

class _GithubScreenState extends State<GithubScreen> {
  Video360Controller? controller;

  String durationText = '';
  String totalText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var statusBar = MediaQuery.of(context).padding.top;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Storage'),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: width,
              height: height,
              child: Video360View(
                onVideo360ViewCreated: _onVideo360ViewCreated,
                url:
                    'https://codetricity.github.io/flutter_video_display/ageda.MP4',
                onPlayInfo: (Video360PlayInfo info) {
                  setState(() {
                    durationText = info.duration.toString();
                    totalText = info.total.toString();
                  });
                },
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      controller?.play();
                    },
                    color: Colors.grey[100],
                    child: Text('Play'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller?.stop();
                    },
                    color: Colors.grey[100],
                    child: Text('Stop'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      controller?.reset();
                    },
                    color: Colors.grey[100],
                    child: Text('Reset'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.grey[100],
                      child: Text(durationText + ' / ' + totalText),
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FaIcon(
                FontAwesomeIcons.github,
                size: 80,
                color: Color.fromARGB(255, 87, 87, 87),
              ),
            ],
          )
        ],
      ),
    );
  }

  _onVideo360ViewCreated(Video360Controller? controller) {
    this.controller = controller;
  }
}
