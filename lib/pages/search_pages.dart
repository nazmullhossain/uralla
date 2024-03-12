import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class ParcelSearchPage extends StatefulWidget {
  @override
  _ParcelSearchPageState createState() => _ParcelSearchPageState();
}

class _ParcelSearchPageState extends State<ParcelSearchPage> {
  TextEditingController _searchController = TextEditingController();
  String _recipientName = '';
  String _recipientCity = '';
  int _page = 1;

  Future<List<Map<String,dynamic>>> _searchParcels() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String baseUrl = 'https://demo.zfcourier.xyz/api/v/1.0.0/parcels';
    String recipientName = _searchController.text.trim();
    String recipientPhone = ''; // You can set this value if needed
    String recipientCity = _recipientCity.trim();
    String shopId = 'shop-123'; // Adjust this according to your requirement

    String url = '$baseUrl?recipientName=$recipientName'
        '&recipientPhone=$recipientPhone'
        '&recipientCity=$recipientCity'
        '&page=$_page'
        '&shopId=$shopId';

    var response = await http.get(Uri.parse(url), headers: {
      'x-auth-token':prefs.getString('token') ?? ""

    });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['content'];
      return data.cast<Map<String, dynamic>>();

    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcel Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search by recipient name',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _searchParcels,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _recipientName = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Recipient City',
                ),
                onChanged: (value) {
                  setState(() {
                    _recipientCity = value;
                  });
                },
              ),
              SizedBox(height: 10,),
              FutureBuilder(
                future: _searchParcels(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return SizedBox(
                      height: 600,
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final parcel = snapshot.data[index];
                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
        
                              title: Column(
                                children: [
                                  Text(parcel['status']),
                                  Text(parcel['recipientName']),
                                  Text(parcel['recipientPhone']),
                                  Text(parcel['recipientCity']),
                                  Text(parcel['recipientArea']),
                                  Text(parcel['recipientZone']),
                                  Text(parcel['recipientAddress']),
                                  Text(parcel['shopId']),
                                ],
                              ),
        
                              trailing: Column(
                                children: [
                                  Text(
                                    "${parcel['amountToCollect']}",
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ],
                              ),
        
                              // Add more fields as needed
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
