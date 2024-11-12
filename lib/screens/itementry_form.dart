import 'package:flutter/material.dart';
import 'package:eshop/widgets/left_drawer.dart';

class ItemEntryFormPage extends StatefulWidget{
  const ItemEntryFormPage({super.key});

  @override
  State<ItemEntryFormPage> createState() => _ItemEntryFormState();
}

class _ItemEntryFormState extends State<ItemEntryFormPage>{
  final _formKey = GlobalKey<FormState>();
  String _item = "";
  int _amount = 0;
  int _price = 0;
  String _description = "";
  int _rating = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: const Center(
          child: Text("Tambahkan rating produk"),
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
                    hintText: "Amount",
                    labelText: "Amount",
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
                      return "Amount tidak boleh kosong";
                    }
                    if (int.tryParse(value) == null){
                      return "Amount harus berupa integer";
                    }
                    if (int.parse(value) < 0) {
                      return "Amount tidak boleh negatif";
                    }
                    return null;
                  },
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Item: $_item'),
                                    Text('Amount: $_amount'),
                                    Text('Price: $_price'),
                                    Text('Description: $_description'),
                                    Text('Rating: $_rating')
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
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