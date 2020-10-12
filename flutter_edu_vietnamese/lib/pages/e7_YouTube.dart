import 'dart:io';

import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
import 'package:Vietnamese_and_Flutter_Educamp/services/YouTubeAPI.dart';
import 'package:flutter/material.dart';
import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';

class E7_YouTube extends StatefulWidget {
  @override
  _E7_YouTubeState createState() => _E7_YouTubeState();
}

class _E7_YouTubeState extends State<E7_YouTube> {
  List<YouTubeVideo> videos = List();
  bool _loading = true;

  void _fetchVideos() async {
    //sleep(Duration(milliseconds: 3000));
    videos = await YouTubeAPI.instance.getVideos(YouTubeQuery.TRENDING_VIETNAM);
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _fetchVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube in Vietnam'),
      ),
      body: Center(
        child: _loading
            ? CircularProgressIndicator(
                value: null,
                backgroundColor: kHDIBGColor,
                valueColor: AlwaysStoppedAnimation<Color>(kHDIPrimaryColor),
              )
            : Text(
                'Finish fetching the videos! We got ${videos.length} videos!'),
      ),
    );
  }
}
