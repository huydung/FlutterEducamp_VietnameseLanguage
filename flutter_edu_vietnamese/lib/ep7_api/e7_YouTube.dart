import 'package:flutter/material.dart';

import '../consts.dart';
import 'YouTubeAPI.dart';
import 'YouTubeVideoRow.dart';

class PageYouTube extends StatefulWidget {
  @override
  _PageYouTubeState createState() => _PageYouTubeState();
}

class _PageYouTubeState extends State<PageYouTube> {
  Future<List<YouTubeVideo>> _fetchVideosFuture;
  List<YouTubeVideo> _videos;
  bool isSearchResult = false;
  String _appBarTitle = 'Trending in Vietnam - YouTube';
  TextEditingController _searchFieldController = TextEditingController();

  @override
  void initState() {
    _fetchVideosFuture = YouTubeAPI.instance.getVideos();
    super.initState();
  }

  void _submitSearchQuery(String value) {
    setState(() {
      if (value != null && value.length > 0 && value.trim().length > 0) {
        _appBarTitle = 'Search Results in Vietnam - YouTube';
        isSearchResult = true;
        _fetchVideosFuture = YouTubeAPI.instance.getVideos(query: value.trim());
      } else {
        _appBarTitle = 'Trending in Vietnam - YouTube';
        isSearchResult = false;
        _fetchVideosFuture = YouTubeAPI.instance.getVideos();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<YouTubeVideo>>(
              future: _fetchVideosFuture,
              initialData: [],
              builder: (BuildContext context,
                  AsyncSnapshot<List<YouTubeVideo>> snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(
                      value: null,
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(kHDIPrimaryColor),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error Loading YouTube Videos: ${snapshot.error}',
                      style: TextStyle(fontSize: kHDISubtitleFontSize),
                    ),
                  );
                }

                if (snapshot.hasData) {
                  _videos = snapshot.data;
                  if (_videos.isEmpty) {
                    return Center(
                      child: Text(
                        'No videos found',
                        style: TextStyle(fontSize: kHDISubtitleFontSize),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: _videos.length,
                    itemBuilder: (context, index) {
                      YouTubeVideo video = _videos[index];
                      return YouTubeVideoRow(
                        video: video,
                        rank: index + 1,
                        compact: isSearchResult,
                      );
                    },
                  );
                }
                ;

                return Text(
                  'No data.',
                  style: TextStyle(fontSize: kHDISubtitleFontSize),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(kHDISmallMargin),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kHDIPrimaryColor.withAlpha(200),
                  kHDIPrimaryColor,
                  kHDIPrimaryColor.withAlpha(200)
                ],
                stops: [0.05, 0.5, 0.95],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),
            height: kHDIDetailFontSize * 4,
            child: TextField(
              controller: _searchFieldController,
              decoration: InputDecoration(
                hintText: 'type to search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchFieldController.clear();
                    _submitSearchQuery('');
                  },
                ),
                //border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(0),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                //contentPadding: EdgeInsets.all(0),
                isDense: true,
                //labelText: 'Search',
              ),
              maxLines: 1,
              style: TextStyle(
                fontSize: kHDIDetailFontSize,
                height: 1,
              ),
              textAlignVertical: TextAlignVertical.center,
              onSubmitted: _submitSearchQuery,
            ),
          ),
        ],
      ),
    );
  }
}
