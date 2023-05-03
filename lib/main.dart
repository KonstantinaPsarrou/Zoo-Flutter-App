import 'package:flutter/material.dart';
import 'animals.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dion\'s Zoo',
      home: AnimalList(),
    );
  }
}

class AnimalList extends StatefulWidget {
  @override
  _AnimalListState createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList>{
  List<Animal> animals=[
    Animal(
      species: 'Lion',
      name: 'Simba',
      age: 4,
      weight: 420.0,
      description: 'The king of the jungle, with a majestic mane and fierce roar.',
      imageurl: 'https://cdn.pixabay.com/photo/2016/09/09/20/01/lion-1657957_960_720.jpg'
    ),
    Animal(
      species: 'Elephant',
      name: 'Ellie',
      age: 12,
      weight: 6000.0,
      description: 'A gentle giant, with a long trunk and floppy ears.',
      imageurl: 'https://cdn.pixabay.com/photo/2013/05/29/22/25/elephant-114543_960_720.jpg'
    ),
    Animal(
      species: 'Giraffe',
      name: 'Geri',
      age: 8,
      weight: 1900.0,
      description: 'The tallest animal in the world, with a long neck and beautiful spots.',
      imageurl: 'https://cdn.pixabay.com/photo/2021/05/21/12/35/giraffe-6271050_960_720.jpg'
    ),
    Animal(
      species: 'Penguin',
      name: 'Pete',
      age: 3,
      weight: 15.0,
      description: 'A flightless bird, with a tuxedo-like appearance and waddling gait.',
      imageurl: 'https://cdn.pixabay.com/photo/2021/07/28/20/39/penguin-6503804_960_720.jpg'
    ),
    Animal(
      species: 'Dolphin',
      name: 'Dolly',
      age: 7,
      weight: 330.0,
      description: 'A highly intelligent marine mammal, with a sleek body and playful personality.',
      imageurl: 'https://cdn.pixabay.com/photo/2013/11/01/11/13/dolphin-203875_960_720.jpg'
    ),
    Animal(
      species: 'Koala',
      name: 'Kiki',
      age: 5,
      weight: 13.0,
      description: 'A marsupial native to Australia, with a cute and cuddly appearance.',
      imageurl: 'https://cdn.pixabay.com/photo/2018/01/02/09/42/koala-3055832_960_720.jpg'
    ),
    Animal(
      species: 'Kangaroo',
      name: 'Kanga',
      age: 6,
      weight: 70.0,
      description: 'An iconic Australian animal, with powerful legs and a distinctive pouch.',
      imageurl: 'https://cdn.pixabay.com/photo/2022/03/10/11/03/eastern-grey-kangaroo-7059640_960_720.jpg'
    )
  ];

  List<bool> isFavorite = List.generate(7, (index) => false);

  void _Favorite(int index) {
    setState(() {
      isFavorite[index] = !isFavorite[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Dion\'s Zoo Animals'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (BuildContext context, int index) {
          Animal animal = animals[index];
          return ListTile(
            leading: IconButton(
              icon: Icon(
                isFavorite[index] ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () => _Favorite(index),
            ),
            title: Text(animal.name),
            subtitle: Text('Age: ${animal.age}, Weight: ${animal.weight.toStringAsFixed(1)}'),
            trailing: Image.network(
            animal.imageurl,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => animal,
                ),
              );
            }
          );
        }
      ),
    );
  }
}