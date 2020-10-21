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

  String get videoUrl => 'https://www.youtube.com/watch?v=$id';

  YouTubeVideo(
      {this.id,
      this.imageURL,
      this.title,
      this.channel,
      this.published,
      this.views = 0,
      this.comments = 0,
      this.likes = 0});

  factory YouTubeVideo.fromJSON(Map<String, dynamic> element) {
    //print('${element['id']} : ${element['snippet']['title']}');
    YouTubeVideo video = YouTubeVideo(
      id: element['id'] is String ? element['id'] : element['id']['videoId'],
      imageURL: element['snippet']['thumbnails']['high']['url'],
      title: element['snippet']['title'],
      channel: element['snippet']['channelTitle'],
      published: DateTime.parse(element['snippet']['publishedAt']),
    );

    if (element['statistics'] != null) {
      video.views = int.parse(element['statistics']['viewCount'] ?? '0');
      video.likes = int.parse(element['statistics']['likeCount'] ?? '0');
      video.comments = int.parse(element['statistics']['commentCount'] ?? '0');
    }
    return video;
  }
}

class YouTubeAPI {
  static YouTubeAPI _instance;
  YouTubeAPI._();

  static YouTubeAPI get instance => _instance = _instance ?? YouTubeAPI._();

  Future<List<YouTubeVideo>> getVideos({query = ''}) async {
    String url;
    if (query == '') {
      url =
          'https://www.googleapis.com/youtube/v3/videos?part=snippet&part=statistics&chart=mostPopular' +
              '&regionCode=VN&maxResults=50&key=$kYouTubeApiToken';
    } else {
      url =
          'https://www.googleapis.com/youtube/v3/search?part=snippet&relevanceLanguage=vi-VN&type=video&q=$query' +
              '&regionCode=VN&maxResults=50&key=$kYouTubeApiToken';
    }
    ;

    print(url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      //print('getVideos: $url return ${response.body}');
      String data = response.body;
      var jsonData = jsonDecode(data);
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
