import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counter_7/models/watchlist_item.dart';

Future<List<WatchListItem>> fetchWatchList() async {
  var url = Uri.parse("http://gibs-tugas-pbp.herokuapp.com/mywatchlist/json/");

  var res = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(res.bodyBytes));

  List<WatchListItem> watchList = [];
  for (var d in data) {
    if (d != null) watchList.add(WatchListItem.fromJson(d));
  }

  return watchList;
}
