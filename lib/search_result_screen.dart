import 'package:flutter/material.dart';
import 'drug_interaction_checker.dart';

class SearchResultScreen extends StatelessWidget {
  final DrugInteractionChecker checker = DrugInteractionChecker();
  final List<String> drugs;

  SearchResultScreen({Key? key, required this.drugs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checker.loadCSV(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<String> interactionResults = checker.checkInteractions(drugs);
          return Scaffold(
            appBar: AppBar(
              title: Text('Interaction Results'),
            ),
            body: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    '${interactionResults.length} Interaction(s) Found!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: interactionResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(interactionResults[index]),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('New search'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Edit search'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          // Display a loading indicator while CSV data is loading
          return Scaffold(
            appBar: AppBar(
              title: Text('Interaction Results'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
