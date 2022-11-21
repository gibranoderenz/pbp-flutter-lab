import 'package:counter_7/providers/budget_items_provider.dart';
import 'package:counter_7/widgets/custom_drawer.dart';
import 'package:counter_7/pages/data.dart';
import 'package:counter_7/pages/budget_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String _jenis = "Pemasukan";
  List<String> pilihanJenis = ["Pemasukan", "Pengeluaran"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
        ),
        drawer: CustomDrawer(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Nasi goreng",
                            labelText: "Judul",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onChanged: (String? judul) {
                          setState(() {
                            _judul = judul!;
                          });
                        },
                        onSaved: (String? judul) {
                          setState(() {
                            _judul = judul!;
                          });
                        },
                        validator: (String? judul) {
                          if (judul == null || judul.isEmpty) {
                            return "Judul tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            hintText: "10000",
                            labelText: "Nominal",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        onChanged: (String? nominal) {
                          setState(() {
                            _nominal = int.parse(nominal!);
                          });
                        },
                        onSaved: (String? nominal) {
                          setState(() {
                            _nominal = int.parse(nominal!);
                          });
                        },
                        validator: (String? nominal) {
                          if (int.parse(nominal!) < 0) {
                            return "Nominal tidak boleh negatif!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      ListTile(
                        title: const Text("Jenis"),
                        trailing: DropdownButton(
                            hint: const Text("Pilih Jenis"),
                            value: _jenis,
                            items: pilihanJenis.map((String pilihan) {
                              return DropdownMenuItem(
                                  value: pilihan, child: Text(pilihan));
                            }).toList(),
                            onChanged: (String? jenis) {
                              setState(() {
                                _jenis = jenis!;
                              });
                            }),
                      ),
                      // submit button
                      const SizedBox(height: 24.0),
                      const SizedBox(height: 24.0),
                      TextButton(
                          child: Text("Simpan",
                              style: TextStyle(color: Colors.white)),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BudgetItem newItem = BudgetItem(
                                  judul: _judul,
                                  nominal: _nominal,
                                  jenis: _jenis);
                              Provider.of<BudgetItemsProvider>(context,
                                      listen: false)
                                  .addBudgetItems(newItem);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DataPage(
                                          budgetItems:
                                              Provider.of<BudgetItemsProvider>(
                                                      context)
                                                  .budgetItems)));
                            }
                          })
                    ],
                  )),
            )));
  }
}
