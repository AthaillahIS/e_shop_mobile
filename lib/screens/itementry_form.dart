import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'menu.dart';

class ItemEntryFormPage extends StatefulWidget{
  const ItemEntryFormPage({super.key});

  @override
  State<ItemEntryFormPage> createState() => _ItemEntryFormState();
}

class _ItemEntryFormState extends State<ItemEntryFormPage>{
  final _formKey = GlobalKey<FormState>();
  String _item = "";
  int _price = 0;
  String _description = "";
  int _rating = 0;

  @override
  Widget build(BuildContext context){
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: const Center(
          child: Text("Tambahkan Rating Produk"),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Item",
                    labelText: "Item",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _item = value!;
                    });
                  },
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return "Item tidak boleh kosong";
                    }
                    return null;
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "Price tidak boleh kosong";
                    }
                    if (int.tryParse(value) == null){
                      return "Price harus berupa integer";
                    }
                    if (int.parse(value) < 0) {
                      return "Price tidak boleh negatif";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "Deskripsi tidak boleh kosong";
                    }
                    return null;
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Rating",
                    labelText: "Rating",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value){
                    setState(() {
                      _rating = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value){
                    if (value == null || value.isEmpty){
                      return "Rating tidak boleh kosong";
                    }
                    if (int.tryParse(value) == null){
                      return "Rating harus berupa angka";
                    }
                    if (int.parse(value) < 0) {
                      return "Rating tidak boleh negatif";
                    }
                    return null;
                  }
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Kirim ke Django dan tunggu respons
                        final response = await request.postJson(
                          "http://127.0.0.1:8000/create-flutter/",
                          jsonEncode(<String, String>{
                            "item_name": _item,
                            "price": _price.toString(),
                            "description": _description,
                            "rating": _rating.toString(),
                            "date": DateTime.now().toIso8601String(),  // Send date in ISO8601 format
                          }),
                        );
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Item baru berhasil disimpan!"),
                            ));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                              Text("Terdapat kesalahan, silakan coba lagi."),
                            ));
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}