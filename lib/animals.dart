import 'package:flutter/material.dart';

class Animal extends StatelessWidget {
  final String species;
  final String name;
  final int age;
  final double weight;
  final String description;
  final String imageurl;

  Animal({
    Key? key,
    required this.species,
    required this.name,
    required this.age,
    required this.weight,
    required this.description,
    required this.imageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.green
      ),
      body: SingleChildScrollView(
        child: Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.network(
                imageurl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                '$species \n\u2022 Name: $name \n\u2022 Age: $age \n\u2022 Weight: ${weight.toStringAsFixed(1)} \n\u2022 Description: $description \n'  ,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}