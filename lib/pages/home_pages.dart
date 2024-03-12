

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_project_today/pages/search_pages.dart';

import '../service/parcel_service.dart';
import '../widget/custom_field_widget.dart';
import 'create_parcel_pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController recipientNameController = TextEditingController();
  TextEditingController recipientPhoneController = TextEditingController();
  TextEditingController recipientCity = TextEditingController();
  ParcelService parcelService = ParcelService();




  Future<List<Map<String, dynamic>>> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.get(
      Uri.parse(
          'https://demo.zfcourier.xyz/api/v/1.0.0/parcels?page=1&shopId=shop-123'),
      headers: {'x-auth-token': prefs.getString('token') ?? ""},
    );
    print("jjjjjjjjjjjjjjjjjjjjj${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['content'];
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parcel List'),
        centerTitle: true,
        backgroundColor: Colors.amber.withOpacity(0.5),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.logout),),
          IconButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (_)=>ParcelSearchPage()));
          }, icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final parcel = snapshot.data[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {
                      recipientNameController.text = parcel["recipientName"];
                      recipientPhoneController.text = parcel["recipientPhone"];
                      recipientCity.text = parcel["recipientCity"];

                      editEm(parcel["_id"]);
                      print("id ${parcel["_id"]}");
                    },

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
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ParcelCreatePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future editEm(String id) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                height: 600,
                child: Column(
                  children: [
                    Text(
                      "Update parcel",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    CustomField(
                      controller: recipientNameController,
                      hintText: 'recipientName',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomField(
                      controller: recipientPhoneController,
                      hintText: 'recipientPhone',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomField(
                      controller: recipientCity,
                      hintText: 'recipientCity',
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          Map<String, dynamic> data = {
                            "recipientName": recipientNameController.text,
                            "recipientPhone": recipientPhoneController.text,
                            "recipientCity": recipientCity.text,
                          };
                          await parcelService.updateParcel(context, data, id);

                          Navigator.pop(context);
                        },
                        child: Text("Update"))
                  ],
                ),
              ),
            ),
          ));
}
