import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  List<String> selectedDrugs = [];
  List<String> searchHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DDI Checker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search drugs',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        selectedDrugs.add(value);
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // Barcode scan functionality here
                  },
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Wrap(
              children: selectedDrugs.map((drug) {
                return Chip(
                  label: Text(drug),
                  onDeleted: () {
                    setState(() {
                      selectedDrugs.remove(drug);
                    });
                  },
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                String currentSearch = selectedDrugs.join(', ');
                searchHistory.add(currentSearch);
                Navigator.pushNamed(context, '/searchResult', arguments: selectedDrugs);
              },
              child: const Text('Start interaction check'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchHistory[index]),
                    onTap: () {
                      // Show past search results
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
