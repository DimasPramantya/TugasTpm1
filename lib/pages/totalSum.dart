import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TotalSumPage extends StatefulWidget {
  @override
  _TotalSumPageState createState() => _TotalSumPageState();
}

class _TotalSumPageState extends State<TotalSumPage> {
  final TextEditingController numberController = TextEditingController();
  double total = 0.0;

  void calculateTotal() {
    String input = numberController.text.trim();

    if (input.isEmpty) {
      setState(() => total = 0.0);
      return;
    }

    List<String> numbers = input.split(",");
    setState(() {
      total = numbers
          .map((n) => double.tryParse(n.trim().replaceAll(',', '.')) ?? 0.0)
          .reduce((a, b) => a + b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jumlah Total"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hitung Total Angka",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 20),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\d.,]'))],
              decoration: const InputDecoration(
                labelText: "Masukkan angka (pisahkan dengan koma)",
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateTotal,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 50),
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text("Hitung", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Text(
              "Total: ${total.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}