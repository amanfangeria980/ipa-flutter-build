import 'package:flutter/material.dart';

void main() {
  runApp(const HTCIApp());
}

class HTCIApp extends StatelessWidget {
  const HTCIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Track the current selected index for navigation

  // List of pages for each bottom navigation item
  final List<Widget> _pages = [
    HomePageContent(), // This will be the main content for Home
    EventPage(), // Event Page
    FoodPage(), // Food Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true, // Centers the logo
        leading: IconButton(
          icon: Icon(Icons.menu_outlined, color: Colors.white, size: 50,), // Menu icon on the left
          onPressed: () {
            // Handle menu action
          },
        ),
        title: Image.asset(
          'image/logo.gif', // Replace with your logo asset
          height: 50, // Adjust the height of the logo
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.white, size: 50), // Account icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()), // Navigate to Account Page
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Display the selected page

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex, // Track the current selected index
        onTap: _onItemTapped, // Update selected index when an item is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: 'Food',
          ),
        ],
      ),
    );
  }
}

// Home Page Content
class HomePageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Wrap GridView with a fixed height to prevent overflow
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 350, // Set a fixed height to prevent overflow issues
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24, // Increased spacing between grid items
                  crossAxisSpacing: 16,
                  childAspectRatio: 3 / 2, // Adjusted aspect ratio to give more space to the icons
                ),
                children: [
                  _buildSection(
                      context, 'Pujas', 'image/poo.png', Colors.pinkAccent, Colors.redAccent),
                  _buildSection(
                      context, 'Festivals', 'image/rat.png', Colors.orangeAccent, Colors.deepOrange),
                  _buildSection(
                      context, 'Donation', 'image/don.png', Colors.lightBlueAccent, Colors.blueAccent),
                  _buildSection(
                      context, 'Darshan', 'image/da.png', Colors.greenAccent, Colors.teal),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Upcoming Festivals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: double.infinity,
              child: Image.asset(
                'image/gg.jpeg', // Offer banner image asset
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Upcoming Pujas
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'UPCOMING PUJAS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.orange.shade100,
              child: Center(
                child: Text(
                  'Upcoming Pujas List Goes Here',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create section buttons with gradient backgrounds
  Widget _buildSection(BuildContext context, String title, String assetPath, Color startColor, Color endColor) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: Offset(0, 4),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(assetPath, height: 80), // Image centered and properly sized
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16), // Space between text and bottom
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Text color is white
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Event Page
class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // Example Event Item
                _buildEventCard(
                  context,
                  'Garba',
                  '18th Oct 2024',
                  '7:00 PM',
                  'HTCI',
                  'image/ga.png',
                ),
                _buildEventCard(
                  context,
                  'Diwali ',
                  '20th Oct 2024',
                  '9:00 PM',
                  'HTCI',
                  'image/li.png',
                ),
                _buildEventCard(
                  context,
                  'Art Exhibition',
                  '22nd Oct 2024',
                  '10:00 AM',
                  'HTCI',
                  'image/ee.png',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketCheckInPage()),
                );
              },
              icon: Icon(Icons.qr_code_scanner),
              label: Text('Ticket Check-in'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Event Card UI
  Widget _buildEventCard(BuildContext context, String title, String date, String time, String location, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('$date at $time', style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                SizedBox(height: 4),
                Text(location, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _showTicketBookingBottomSheet(context, title);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text('Book Ticket'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Show Ticket Booking Bottom Sheet
  void _showTicketBookingBottomSheet(BuildContext context, String eventTitle) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Book Ticket for $eventTitle', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ticket Quantity', style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(icon: Icon(Icons.remove_circle_outline), onPressed: () {}),
                      Text('1', style: TextStyle(fontSize: 16)),
                      IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {}),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ticket booked successfully!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text('Confirm Booking', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Ticket Check-In Page
class TicketCheckInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Check-in'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            // Implement the camera check-in functionality here
          },
          icon: Icon(Icons.camera_alt),
          label: Text('Open Camera for Check-in'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}

// Food Page Content
class FoodPage extends StatelessWidget {
  final List<Map<String, dynamic>> foodItems = [
    {
      'image': 'image/dal.jpeg',
      'name': 'Rice & Dal',
      'price': 150,
    },
    {
      'image': 'image/dosa.jpeg',
      'name': 'Masala Dosa',
      'price': 250,
    },
    {
      'image': 'image/roti.jpeg',
      'name': 'Sabji & Chapati',
      'price': 180,
    },
    {
      'image': 'image/rice.jpeg',
      'name': 'Fried Rice',
      'price': 220,
    },
    {
      'image': 'image/rajma.jpeg',
      'name': 'Rice Rajma',
      'price': 180,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Food Order',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final foodItem = foodItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Food Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        foodItem['image'],
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16), // Space between image and text
                    // Food Name and Price
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            foodItem['name'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4), // Space between name and price
                          Text(
                            '${foodItem['price']}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Buy Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle Buy action here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Buy',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Account Page
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Account', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Avatar, Name, and Phone Number
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.orange,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange.shade200,
                    radius: 40,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'user',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '+123456789',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Phone Numbers Section
            ListTile(
              title: Text('My Phone Numbers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('+123456789', style: TextStyle(fontSize: 16)),
                      TextButton(onPressed: () {}, child: Text('Set Whatsapp')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Alternate Number', style: TextStyle(color: Colors.grey)),
                      TextButton(onPressed: () {}, child: Text('Add an Alternate Number')),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),

            // List of Account Options
            _buildAccountOption(context, 'Languages', Icons.language),
            _buildAccountOption(context, 'Profile', Icons.person),
            _buildAccountOption(context, 'Email Address', Icons.email),
            _buildAccountOption(context, 'My Addresses', Icons.location_on),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountOption(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Add specific functionality for each option here
      },
    );
  }
}
