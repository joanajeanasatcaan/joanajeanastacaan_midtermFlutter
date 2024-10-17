import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JoanaJeanAstacaan_MidtermExam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<Item> items = [
    Item(name: 'apple', details: 'color red'),
    Item(name: 'orange', details: 'color orange'),
    Item(name: 'guava', details: 'color green'),
    Item(name: 'star apple', details: 'color light yellow'),
    Item(name: 'grapes', details: 'color violet'),
    Item(name: 'lemon', details: 'color yellow'),
    Item(name: 'mango', details: 'color yellow'),
    Item(name: 'lomboy', details: 'color purple'),
    Item(name: 'watermelon', details: 'color pink inside'),
    Item(name: 'dragon fruit', details: 'color pink outside'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JoanaJeanAstacaan_MidtermExam'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(item: items[index]);
        },
      ),
    );
  }
}

class Item {
  final String name;
  final String details;
  bool isAdded = false;

  Item({required this.name, required this.details});
}

class ItemCard extends StatelessWidget {
  final Item item;

  ItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.isAdded ? const Color.fromARGB(255, 250, 173, 255) : Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item.name,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.details), 
                  onPressed: () {
                    print(item.details);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add_box),
                  onPressed: () {
                    item.isAdded = true;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} added!')),
                    );
                    (context as Element).markNeedsBuild(); 
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
