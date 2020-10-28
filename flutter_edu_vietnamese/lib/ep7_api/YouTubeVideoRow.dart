import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

import '../consts.dart';
import 'YouTubeAPI.dart';

class YouTubeVideoRow extends StatelessWidget {
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

  final YouTubeVideo video;
  final int rank;
  final bool compact;
  double _height;

  YouTubeVideoRow({this.video, this.rank, @required this.compact});

  @override
  Widget build(BuildContext context) {
    print(
        'Video ${video.id}: ${video.title} ranked $rank with ${video.likes} likes');

    _height = compact ? kHDIYouTubeHeight * 0.7 : kHDIYouTubeHeight;
    return Container(
      height: _height + kHDISmallMargin,
      padding: EdgeInsets.symmetric(
          horizontal: kHDISmallMargin, vertical: kHDISmallMargin * 0.5),
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
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //THE THUMBNAIL
          GestureDetector(
            onTap: () {
              _launchURL(video.videoUrl);
            },
            child: Stack(
              children: [
                ClipRRect(
                  // crop to have beautiful square photo
                  borderRadius: BorderRadius.all(
                    Radius.circular(kHDISmallBorder),
                  ),
                  child: SizedOverflowBox(
                    size: Size(_height, _height),
                    child: Container(
                      // Fit the image ino 26/9 ratio to remove black border on top and bottom
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(video.imageURL),
                            alignment: FractionalOffset.center,
                            fit: BoxFit.fitWidth),
                      ),
                      height: _height,
                      width: _height / 9.0 * 16.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: kHDISmallFontSize * 2.5,
                    height: kHDISmallFontSize * 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kHDISmallBorder),
                        bottomLeft: Radius.circular(kHDISmallBorder),
                      ),
                      color: kHDIPrimaryColor.withAlpha(180),
                    ),
                    child: Center(
                      child: Text(
                        '$rank',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: kHDISmallFontSize),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //THE DETAIL
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: kHDISmallMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
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
                  Container(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        _launchURL(video.videoUrl);
                      },
                      child: Text(
                        video.title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: kHDIDetailFontSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  if (!compact)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
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
  }
}
