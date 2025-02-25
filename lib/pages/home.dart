import 'package:flutter/material.dart';
import 'package:tpm/pages/calculator.dart';
import 'package:tpm/pages/developerList.dart';
import 'package:tpm/pages/oddEven.dart';
import 'package:tpm/pages/totalSum.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            _buildMenuItem(context, "Pengembang", Icons.person, DeveloperListPage()),
            _buildMenuItem(context, "Kalkulator", Icons.calculate, CalculatorPage()),
            _buildMenuItem(context, "Bilangan Ganjil Genap", Icons.filter_1, OddEvenPage()),
            _buildMenuItem(context, "Jumlah Total Angka", Icons.format_list_numbered, TotalSumPage()),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent, size: 18),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
      ),
    );
  }
}