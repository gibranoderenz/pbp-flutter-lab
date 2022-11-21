import 'package:counter_7/models/watchlist_item.dart';
import 'package:counter_7/pages/form.dart';
import 'package:counter_7/pages/data.dart';
import 'package:counter_7/pages/home.dart';
import 'package:counter_7/pages/mywatchlist.dart';
import 'package:counter_7/utils/fetch_watchlist.dart';
import 'package:counter_7/providers/budget_items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage(title: 'Program Counter')),
                );
              },
            ),
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Route menu ke halaman Tambah Budget
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Route menu ke halaman Data Budget
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DataPage(
                          budgetItems: Provider.of<BudgetItemsProvider>(context)
                              .budgetItems)),
                );
              },
            ),
            ListTile(
              title: const Text('My Watch List'),
              onTap: () {
                // Route menu ke halaman Data Budget
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  Future<List<WatchListItem>> watchList = fetchWatchList();
                  return MyWatchList(
                      title: "My Watch List", watchList: watchList);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
