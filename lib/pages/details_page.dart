import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
   DetailsPage({super.key,

  required this.recipientAddress,
    required this.recipientArea,
    required this.recipientCity,
    required this.recipientName,
    required this.recipientPhone,
    required this.recipientZone,
    required this.shopId
  });
  String recipientName,recipientPhone,recipientCity,recipientArea,recipientZone,recipientAddress,shopId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details page"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),

          ),
          child: Column(
            children: [
              Text(recipientName),
              Text(recipientArea),
              Text(recipientAddress),
              Text(recipientCity),
              Text(recipientPhone),
              Text(recipientZone),
              Text(shopId),

            ],
          ),
        ),
      ),
    );
  }
}
