import 'package:flutter/material.dart';

class DecorItemsScreen extends StatefulWidget {
  @override
  _DecorItemsScreenState createState() => _DecorItemsScreenState();
}

class _DecorItemsScreenState extends State<DecorItemsScreen> {
  List<int> _counters = List<int>.generate(6, (index) => 0); // Initialize counters for each image
  final List<String> _imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYCqUTPsVhvs8KGIsbILgx9vSzHGlY-2GFEg&s',
    'https://tse2.mm.bing.net/th?id=OIP.SAgUpGYGPg1sj4mvyNSnbwHaD4&pid=Api&P=0&h=180',
    'https://i.ytimg.com/vi/KjUIW0_Sm4Q/maxresdefault.jpg',
    'https://cdn.shopify.com/s/files/1/0244/9349/0240/files/Modern_Pink_Abstract_Floral_Wall_Art_Pictures_Fine_Art_Canvas_Prints_Flower_Posters_For_Living_Room_Home_Interior_Bedroom_Wall_Decoratio_1.png?v=1572363546',
    'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRTge1YdaQcbweKfbGk7Xj6XfQ6HjLTgYrru-KsOG2z7jAy5LsRkGO4zYOdEi5MBifZEgD-ZmdQP5vU1ZGfreGc6M34Eq_11rmX_DdUZvxyVi2sorvFQU3n6Q&usqp=CAE',
    'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRTge1YdaQcbweKfbGk7Xj6XfQ6HjLTgYrru-KsOG2z7jAy5LsRkGO4zYOdEi5MBifZEgD-ZmdQP5vU1ZGfreGc6M34Eq_11rmX_DdUZvxyVi2sorvFQU3n6Q&usqp=CAE',
  ];
  final List<double> _prices = [100, 200, 300, 400, 500, 600]; // Prices for each image

  void _incrementCounter(int index) {
    setState(() {
      _counters[index]++;
    });
  }

  void _decrementCounter(int index) {
    setState(() {
      if (_counters[index] > 0) {
        _counters[index]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decor Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.8,
          ),
          itemCount: _imageUrls.length,
          itemBuilder: (context, index) {
            return _buildImageCard(index);
          },
        ),
      ),
    );
  }
  

  Widget _buildImageCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Handle image tap
              },
              child: Image.network(
                _imageUrls[index],
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                
                children: [
                  Text(
                    'Item ${index + 1}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _decrementCounter(index),
                        icon: Icon(Icons.remove),
                      ),
                      Text('${_counters[index]}', style: TextStyle(fontSize: 16)),
                      IconButton(
                        onPressed: () => _incrementCounter(index),
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      final cost = _counters[index] * _prices[index];
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Total Cost: \$${cost.toStringAsFixed(2)}'),
                          );
                        },
                      );
                    },
                    child: Text('Cost Price'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
