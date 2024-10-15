import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:testapi/t.dart';
class CompanyCard extends StatelessWidget {
  final T companyData;

  CompanyCard({required this.companyData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${companyData.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Industry: ${companyData.industry}'),
            SizedBox(height: 8),
            Text('Size: ${companyData.size}'),
            SizedBox(height: 8),
            Text('Location: ${companyData.location}'),
            SizedBox(height: 8),
            Text('Description: ${companyData.description}'),
          ],
        ),
      ),
    );
  }
}

Future<T> fetchCompanyData() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8085/companies/3'));


  if (response.statusCode == 200) {
    // Parse the JSON data and return a T object
    return T.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load company data');
  }
}

// Usage Example
void main() {
  runApp(MaterialApp(
    home: CompanyDetailsScreen(),
  ));
}

class CompanyDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Company Details')),
      body: FutureBuilder<T>(
        future: fetchCompanyData(), // API call here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Display the company data in the card
            return CompanyCard(companyData: snapshot.data!);
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
