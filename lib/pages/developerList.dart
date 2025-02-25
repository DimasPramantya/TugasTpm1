import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeveloperListPage extends StatelessWidget {
  final List<Map<String, String>> developers = [
    {"id": "123220185", "name": "Fawaz"},
    {"id": "123220155", "name": "Rozaan"},
    {"id": "123210022", "name": "Dimas"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Pengembang"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: developers.length,
          itemBuilder: (context, index) {
            String name = developers[index]['name']!;
            String id = developers[index]['id']!;

            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    name[0],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                title: Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "ID: $id",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                },
              ),
            );
          },
        ),
      ),
    );
  }
}