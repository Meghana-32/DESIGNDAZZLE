import 'package:flutter/material.dart';
import 'package:myapp/screens/accounts.dart';
import 'package:myapp/screens/decor_items_screen.dart';
import 'package:myapp/screens/support.dart';
import 'package:myapp/screens/orders.dart';
import 'package:myapp/widgets/appbar.dart';
import 'package:myapp/widgets/sidebar.dart';
import 'package:myapp/widgets/bottomnavbar.dart';
import 'package:myapp/widgets/login_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DESIGN DAZZLE',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  final List<Widget> _widgetsOptions = <Widget>[
    const MyAccountsScreen(),
    const SupportScreen(),
    const OrdersScreen(),
    DecorItemsScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const LoginBottomSheet();
      },
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: 'DesignDazzle',
        backgroundColor: Colors.pink,
        scaffoldKey: _scaffoldKey,
        onNotificationTap: () {},
        onLoginTap: () => _showLoginBottomSheet(context),
        subtitle: 'Shop now & make your design decor shine',
      ),
      drawer: const SideBar(),
      body: Scrollbar(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              _widgetsOptions.elementAt(_selectedIndex),
              const SizedBox(height: 20),
              const Text(
                'Decor Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DecorItemsScreen()),
                        );
                      },
                      child: _buildDecorItem(
                        'https://i.pinimg.com/originals/74/a5/17/74a517b5728c09c42ac6f7cdc089b0f7.jpg', 
                        'Wall Decor'
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildDecorItem('https://tse2.mm.bing.net/th?id=OIP.SAgUpGYGPg1sj4mvyNSnbwHaD4&pid=Api&P=0&h=180', 'Indoor Decor'),
                    const SizedBox(height: 10),
                    _buildDecorItem('https://i.ytimg.com/vi/KjUIW0_Sm4Q/maxresdefault.jpg', 'OutDoor Decor'),
                    const SizedBox(height: 10),
                    _buildDecorItem('https://cdn.shopify.com/s/files/1/0244/9349/0240/files/Modern_Pink_Abstract_Floral_Wall_Art_Pictures_Fine_Art_Canvas_Prints_Flower_Posters_For_Living_Room_Home_Interior_Bedroom_Wall_Decoratio_1.png?v=1572363546', 'Paintings'),
                    const SizedBox(height: 10),
                    _buildDecorItem('https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRTge1YdaQcbweKfbGk7Xj6XfQ6HjLTgYrru-KsOG2z7jAy5LsRkGO4zYOdEi5MBifZEgD-ZmdQP5vU1ZGfreGc6M34Eq_11rmX_DdUZvxyVi2sorvFQU3n6Q&usqp=CAE', 'Decor Quote Hangers'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _scrollToTop,
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _scrollToBottom,
            child: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
    );
  }

  Widget _buildDecorItem(String imageUrl, String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.network(imageUrl, fit: BoxFit.cover, height: 150, width: double.infinity),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
