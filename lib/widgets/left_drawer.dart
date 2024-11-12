import 'package:flutter/material.dart';
import 'package:eshop/screens/menu.dart';
import 'package:eshop/screens/itementry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'E-Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                    "Penuhi seluruh kebutuhan Anda!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color:Colors.white,
                      fontWeight: FontWeight.normal,
                    )
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke MoodEntryFormPage
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ItemEntryFormPage(),
                ),
              );

              /*
      TODO: Buatlah routing ke MoodEntryFormPage di sini,
      setelah halaman MoodEntryFormPage sudah dibuat.
      */
            },
          ),
        ],
      ),
    );
  }
}