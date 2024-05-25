import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class DrugInteractionChecker {
  List<dynamic> interactionData = [];

  DrugInteractionChecker() {
    loadCSV();
  }

  Future<void> loadCSV() async {
    final data = await rootBundle.loadString('assets/CombinedDatasetConservative.csv');
    interactionData =  CsvToListConverter(eol: '\n', fieldDelimiter: '\t').convert(data);
  }

  List<String> checkInteractions(List<String> drugs) {
    List<String> interactions = [];
    for (var row in interactionData) {
      if(row.length > 11) {
        String drug1 = row[1].toString();
        //print("Drug1: "+drug1);
        String drug2 = row[3].toString();
        //print("Drug2: "+drug2);
        if (drugs.contains(drug1) && drugs.contains(drug2)) {
          interactions.add(row[11]
              .toString()); // Assuming this is the interaction description
        }
      }
    }
    return interactions;
  }
}

