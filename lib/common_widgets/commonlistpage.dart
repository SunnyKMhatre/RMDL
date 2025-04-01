import 'package:flutter/material.dart';

class CommonListPage extends StatelessWidget {
  final List<String> items; 
  final void Function(int) onItemTap;

  const CommonListPage({super.key, required this.items, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            title: Text(
              items[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
            onTap: () => onItemTap(index),
          ),
        );
      },
    );
  }
}
