import 'package:flutter/material.dart';
import 'package:eshop/models/item_entry.dart';
import 'package:eshop/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ItemEntryPage extends StatefulWidget {
  const ItemEntryPage({super.key});

  @override
  State<ItemEntryPage> createState() => ItemEntryPageState();
}

class ItemEntryPageState extends State<ItemEntryPage> {
  Future<List<Entry>> fetchItem(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    // Melakukan decode response menjadi bentuk json
    var data = response;

    // Melakukan konversi data json menjadi object Entry
    List<Entry> listItem = [];
    for (var d in data) {
      if (d != null) {
        listItem.add(Entry.fromJson(d));
      }
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchItem(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data item dalam eshop.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) =>
                    Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data![index].fields.itemName}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.description}"),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.price}"),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.rating}"),
                          const SizedBox(height: 10),
                          Text("${snapshot.data![index].fields.date}")
                        ],
                      ),
                    ),
              );
            }
          }
        },
      ),
    );
  }
}