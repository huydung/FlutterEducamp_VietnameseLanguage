import 'package:Vietnamese_and_Flutter_Educamp/consts.dart';
import 'package:Vietnamese_and_Flutter_Educamp/services/YouTubeAPI.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class PageYouTube extends StatefulWidget {
  @override
  _PageYouTubeState createState() => _PageYouTubeState();
}

class _PageYouTubeState extends State<PageYouTube> {
  bool _loading = true;

  _launchURL(String url) async {
    //const url = 'https://flutter.dev';
    if (await canLaunch(url) != null) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

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
                return ListView.builder(
                  itemCount: _videos.length,
                  itemBuilder: (context, index) {
                    YouTubeVideo video = _videos[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: kHDISmallMargin,
                          vertical: kHDISmallMargin * 0.5),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.all(
                        //     Radius.circular(kSmallMargin * 0.5)),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.blueGrey[800],
                            width: 1.0,
                          ),
                        ),
                        //color: Colors.white60.withAlpha(20),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.white30,
                        //   ),
                        // ],
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _launchURL(video.videoUrl);
                            },
                            child: ClipRRect(
                              // crop to have beautiful square photo
                              borderRadius: BorderRadius.all(
                                Radius.circular(kHDISmallBorder),
                              ),
                              child: SizedOverflowBox(
                                size:
                                    Size(kHDIYouTubeHeight, kHDIYouTubeHeight),
                                child: Container(
                                  // Fit the image ino 26/9 ratio to remove black border on top and bottom
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(video.imageURL),
                                        alignment: FractionalOffset.center,
                                        fit: BoxFit.fitWidth),
                                  ),
                                  height: kHDIYouTubeHeight,
                                  width: kHDIYouTubeWidth,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: kHDISmallMargin),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          video.channel.toUpperCase(),
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: kHDISmallFontSize,
                                            color: Colors.blueGrey[400],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          timeago.format(video.published),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: kHDISmallFontSize,
                                            color: Colors.blueGrey[400],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kHDISmallBorder,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _launchURL(video.videoUrl);
                                    },
                                    child: Text(
                                      video.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: kHDIDetailFontSize,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: kHDISmallBorder,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: FaIcon(
                                          FontAwesomeIcons.eye,
                                          size: kHDIDetailFontSize,
                                          color: kHDISubtleColor,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '${NumberFormat.compact().format(video.views)}',
                                          style: TextStyle(
                                            fontSize: kHDISmallFontSize,
                                            color: kHDISubtleColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: FaIcon(
                                          FontAwesomeIcons.thumbsUp,
                                          size: kHDIDetailFontSize,
                                          color: kHDISubtleColor,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '${NumberFormat.compact().format(video.likes)}',
                                          style: TextStyle(
                                            fontSize: kHDISmallFontSize,
                                            color: kHDISubtleColor,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: FaIcon(
                                          FontAwesomeIcons.comments,
                                          size: kHDIDetailFontSize,
                                          color: kHDISubtleColor,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '${NumberFormat.compact().format(video.comments)}',
                                          style: TextStyle(
                                            fontSize: kHDISmallFontSize,
                                            color: kHDISubtleColor,
                                          ),
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
                    );
                  },
                );
              } else {
                return Text(
                  'Error Loading YouTube Videos: ${snapshot.error}',
                  style: TextStyle(fontSize: kHDISubtitleFontSize),
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
