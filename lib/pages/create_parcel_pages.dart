import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_project_today/widget/utils_widget.dart';



class ParcelCreatePage extends StatefulWidget {
  @override
  _ParcelCreatePageState createState() => _ParcelCreatePageState();
}

class _ParcelCreatePageState extends State<ParcelCreatePage> {
  TextEditingController merchantOrderIdController = TextEditingController();
  TextEditingController recipientNameController = TextEditingController();
  TextEditingController recipientPhoneController = TextEditingController();
  TextEditingController recipientCityController = TextEditingController();
  TextEditingController recipientAreaController = TextEditingController();
  TextEditingController recipientZoneController = TextEditingController();
  TextEditingController recipientAddressController = TextEditingController();
  TextEditingController amountToCollectController = TextEditingController();
  TextEditingController stockPriceController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemWeightController = TextEditingController();
  TextEditingController specialInstructionController = TextEditingController();
  TextEditingController shopIdController = TextEditingController();

  Future<void> createParcel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse('https://demo.zfcourier.xyz/api/v/1.0.0/parcels/create'),
      headers: <String, String>{
        'x-auth-token':  prefs.getString('token') ?? "",
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "merchantOrderId": merchantOrderIdController.text,
        "recipientName": recipientNameController.text,
        "recipientPhone": recipientPhoneController.text,
        "recipientCity": recipientCityController.text,
        "recipientArea": recipientAreaController.text,
        "recipientZone": recipientZoneController.text,
        "recipientAddress": recipientAddressController.text,
        "amountToCollect": int.parse(amountToCollectController.text),
        "stockPrice": int.parse(stockPriceController.text),
        "itemDescription": itemDescriptionController.text,
        "itemQuantity": int.parse(itemQuantityController.text),
        "itemWeight": int.parse(itemWeightController.text),
        "specialInstruction": specialInstructionController.text,
        "shopId": shopIdController.text,
      }),
    );
print("created ${response.body}");
    if (response.statusCode == 200) {
      // Parcel created successfully, do something
      print('Parcel created successfully');
      showSnackBar(context, "Parcel created successfully");
    } else {
      // Failed to create parcel, handle error
      print('Failed to create parcel: ${response.statusCode}');
      showSnackBar(context, "Parcel created failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Parcel'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              controller: merchantOrderIdController,
              decoration: InputDecoration(labelText: 'Merchant Order ID'),
            ),
            TextField(
              controller: recipientNameController,
              decoration: InputDecoration(labelText: 'Recipient Name'),
            ),
            TextField(
              controller: recipientPhoneController,
              decoration: InputDecoration(labelText: 'Recipient Phone'),
            ),
            TextField(
              controller: recipientCityController,
              decoration: InputDecoration(labelText: 'Recipient City'),
            ),
            TextField(
              controller: recipientAreaController,
              decoration: InputDecoration(labelText: 'Recipient Area'),
            ),
            TextField(
              controller: recipientZoneController,
              decoration: InputDecoration(labelText: 'Recipient Zone'),
            ),
            TextField(
              controller: recipientAddressController,
              decoration: InputDecoration(labelText: 'Recipient Address'),
            ),
            TextField(
              controller: amountToCollectController,
              decoration: InputDecoration(labelText: 'Amount to Collect'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: stockPriceController,
              decoration: InputDecoration(labelText: 'Stock Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: itemDescriptionController,
              decoration: InputDecoration(labelText: 'Item Description'),
            ),
            TextField(
              controller: itemQuantityController,
              decoration: InputDecoration(labelText: 'Item Quantity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: itemWeightController,
              decoration: InputDecoration(labelText: 'Item Weight'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: specialInstructionController,
              decoration: InputDecoration(labelText: 'Special Instruction'),
            ),
            TextField(
              controller: shopIdController,
              decoration: InputDecoration(labelText: 'Shop ID'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: ()async{
                createParcel();
                // merchantOrderIdController.clear();
                // recipientNameController.clear();
                // recipientPhoneController.clear();
                // recipientCityController.clear();
                // recipientAreaController.clear();
                // recipientZoneController.clear();
                // recipientAddressController.clear();
                // amountToCollectController.clear();
                // stockPriceController.clear();
                // itemDescriptionController.clear();
                // itemQuantityController.clear();
                // itemWeightController.clear();
                // specialInstructionController.clear();
                // shopIdController.clear();

              },
              child: Text('Create Parcel'),
            ),
          ],
        ),
      ),
    );
  }
}
