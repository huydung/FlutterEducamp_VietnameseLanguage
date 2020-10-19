import 'dart:convert';

import 'package:Vietnamese_and_Flutter_Educamp/secret_id.dart';
import 'package:http/http.dart' as http;

enum YouTubeQuery { TRENDING_VIETNAM, TRENDING_NEARME, SEARCH }

class YouTubeVideo {
  String id;
  String imageURL;
  String title;
  String channel;
  DateTime published;
  int views;
  int comments;
  int likes;

  YouTubeVideo(
      {this.id,
      this.imageURL,
      this.title,
      this.channel,
      this.published,
      this.views,
      this.comments,
      this.likes});

  factory YouTubeVideo.fromJSON(Map<String, dynamic> element) {
    //print('${element['id']} : ${element['snippet']['title']}');
    return YouTubeVideo(
      id: element['id'],
      imageURL: element['snippet']['thumbnails']['standard']['url'],
      title: element['snippet']['title'],
      channel: element['snippet']['channelTitle'],
      published: DateTime.parse(element['snippet']['publishedAt']),
      views: int.parse(element['statistics']['viewCount'] ?? '0'),
      comments: int.parse(element['statistics']['likeCount'] ?? '0'),
      likes: int.parse(element['statistics']['commentCount'] ?? '0'),
    );
  }
}

class YouTubeAPI {
  static YouTubeAPI _instance;
  YouTubeAPI._();

  static String _nextPageToken;

  static YouTubeAPI get instance => _instance = _instance ?? YouTubeAPI._();

  Future<List<YouTubeVideo>> getVideos(YouTubeQuery query) async {
    String url =
        'https://www.googleapis.com/youtube/v3/videos?part=snippet&part=statistics&chart=mostPopular&regionCode=VN&maxResults=25&key=$kYouTubeApiToken';
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      //print('getVideos: $url return ${response.body}');
      String data = response.body;
      var jsonData = jsonDecode(data);
      _nextPageToken = jsonData['nextPageToken'];
      List videoItems = List.from(jsonData['items']);
      //print(videoItems);
      List<YouTubeVideo> videos = List();
      videoItems.forEach((element) {
        videos.add(YouTubeVideo.fromJSON(element));
      });

      return videos;
    } else {
      throw ('Can not get a valid response from YouTube');
    }
  }
}
