import 'package:counter_7/models/watchlist_item.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/widgets/custom_drawer.dart';
import 'package:intl/intl.dart';

class MyWatchListById extends StatefulWidget {
  const MyWatchListById(
      {super.key, required this.title, required this.watchListItem});
  final String title;
  final WatchListItem watchListItem;

  @override
  State<MyWatchListById> createState() => _MyWatchListByIdState();
}

class _MyWatchListByIdState extends State<MyWatchListById> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(children: [
            Expanded(
              child: Column(
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      widget.watchListItem.fields.title,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Release Date
                        Text.rich(
                          TextSpan(
                            // with no TextStyle it will have default text style
                            children: <TextSpan>[
                              // Release Date
                              const TextSpan(
                                  text: 'Release Date: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: DateFormat.yMMMMd('en_US').format(
                                      widget.watchListItem.fields.releaseDate)),
                            ],
                          ),
                        ),

                        // Rating
                        Text.rich(
                          TextSpan(
                            // with no TextStyle it will have default text style
                            children: <TextSpan>[
                              // Release Date
                              const TextSpan(
                                  text: 'Rating: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      '${widget.watchListItem.fields.rating.toDouble()}/5'),
                            ],
                          ),
                        ),

                        // Status
                        Text.rich(
                          TextSpan(
                            // with no TextStyle it will have default text style
                            children: <TextSpan>[
                              // Release Date
                              const TextSpan(
                                  text: 'Status: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: widget.watchListItem.fields.watched
                                      ? 'watched'
                                      : 'not watched'),
                            ],
                          ),
                        ),

                        // Status
                        const Text('Review:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(widget.watchListItem.fields.review),
                      ]),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Text("Back", style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ]),
        ));
  }
}
