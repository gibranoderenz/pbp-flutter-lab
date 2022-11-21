import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:counter_7/models/watchlist_item.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/widgets/custom_drawer.dart';
import 'package:counter_7/pages/mywatchlist_by_id.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({super.key, required this.title, required this.watchList});
  final String title;
  final Future<List<WatchListItem>> watchList;

  @override
  State<MyWatchList> createState() => _MyWatchListState();
}

class _MyWatchListState extends State<MyWatchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: CustomDrawer(),
        body: FutureBuilder(
            future: widget.watchList,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [Text("Tidak ada watchlist yang ada.")],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      padding: const EdgeInsets.all(16.0),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyWatchListById(
                                    title: 'Detail',
                                    watchListItem: snapshot.data![index],
                                  ),
                                ));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      width: 1.5,
                                      color:
                                          snapshot.data![index].fields.watched
                                              ? Colors.green
                                              : Colors.red)),
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      snapshot.data![index].fields.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Checkbox(
                                    activeColor: Colors.green,
                                    value: snapshot.data![index].fields.watched,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        snapshot.data![index].fields.watched =
                                            !snapshot
                                                .data![index].fields.watched;
                                      });
                                    },
                                  ),
                                ],
                              )),
                        );
                      });
                }
              }
            }));
  }
}
