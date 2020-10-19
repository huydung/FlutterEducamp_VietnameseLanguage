import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
import 'package:Vietnamese_and_Flutter_Educamp/services/YouTubeAPI.dart';
import 'package:flutter/material.dart';

class PageYouTube extends StatefulWidget {
  @override
  _PageYouTubeState createState() => _PageYouTubeState();
}

class _PageYouTubeState extends State<PageYouTube> {
  bool _loading = true;

  Future<List<YouTubeVideo>> _fetchVideosFuture;
  List<YouTubeVideo> _videos;

  @override
  void initState() {
    _fetchVideosFuture =
        YouTubeAPI.instance.getVideos(YouTubeQuery.TRENDING_VIETNAM);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Videos in Vietnam'),
      ),
      body: Center(
        child: FutureBuilder<List<YouTubeVideo>>(
          future: _fetchVideosFuture,
          initialData: [],
          builder: (BuildContext context,
              AsyncSnapshot<List<YouTubeVideo>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.hasData);
              if (snapshot.hasData) {
                _videos = snapshot.data;
                return Column(
                  children: [
                    Text(
                      'Finished loading ${_videos.length} videos with the first one being ${_videos[0].title}',
                      style: TextStyle(fontSize: kSubtitleFontSize),
                    ),
                    Image(
                      image: AssetImage('assets/vietnamflag.png'),
                    )
                  ],
                );
              } else {
                return Text(
                  'Error Loading YouTube Videos: ${snapshot.error}',
                  style: TextStyle(fontSize: kSubtitleFontSize),
                );
              }
            } else {
              return CircularProgressIndicator(
                value: null,
                valueColor: new AlwaysStoppedAnimation<Color>(kHDIPrimaryColor),
              );
            }
          },
        ),
      ),
    );
  }
}
