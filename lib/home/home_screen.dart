import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLocation = "Select location";
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header section with logo and profile picture
          Container(
            padding:
                const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                Row(
                  children: [
                    Text("FLAW",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    Image.asset("assets/images/entypo_flower.png",
                        width: 24, height: 24),
                    Text("ESS",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))
                  ],
                ),
                // Profile picture
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          // Title "Make Up Stype"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              "Make Up Stype",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // SizedBox(
          //   width: 250.0,
          //   child: TextLiquidFill(
          //     text: 'LIQUIDY',
          //     waveColor: Colors.blueAccent,
          //     boxBackgroundColor: Colors.redAccent,
          //     textStyle: TextStyle(
          //       fontSize: 80.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     boxHeight: 300.0,
          //   ),
          // ),

          // Location dropdown
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            color: const Color(0xFFD3A5D3),
            child: DropdownButton<String>(
              value: selectedLocation,
              icon: const Icon(Icons.arrow_drop_down),
              isExpanded: true,
              underline: Container(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLocation = newValue!;
                });
              },
              items: <String>[
                'Select location',
                'New York',
                'Los Angeles',
                'Chicago'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          // Main content with message
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: const Text(
                "Opps! Flawless does not service your current location.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFD3A5D3),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              backgroundColor: const Color(0xFFD3A5D3),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black54,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: '',
                ),
              ],
            ),
          ),
          // Indicator line chạy dưới icon
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width / 4 * _currentIndex,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: MediaQuery.of(context).size.width / 4,
              height: 3,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
