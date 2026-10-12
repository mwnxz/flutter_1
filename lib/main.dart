import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const MedinowScreen(),
    const MeditateScreen(),
    const CourseDetailsScreen(),
    const OrganizerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color(0xFF4A90E2),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.spa), label: 'Medinow'),
          BottomNavigationBarItem(
              icon: Icon(Icons.self_improvement), label: 'Meditate'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Course'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Organizer'),
        ],
      ),
    );
  }
}

class MedinowScreen extends StatelessWidget {
  const MedinowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF039EA2),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text("medinow",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Meditate With Us!",
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text("Sign in with Apple",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: const Color(0xFFB2DFDB),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                        child: Text("Continue with Email or Phone",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                  ),
                  const SizedBox(height: 15),
                  const Text("Continue With Google",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                'assets/meditate.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MeditateScreen extends StatelessWidget {
  const MeditateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meditate",
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 20), child: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                _chip("All", true),
                _chip("Bible in a Year", false),
                _chip("Dailies", false),
                _chip("Minutes", false),
                _chip("November", false),
              ]),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/sun_moon.png',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text("A Song of Moon",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            const Text("Start with the basics",
                style: TextStyle(color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: const [
                  Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Text("9 Sessions",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ]),
                const Text("Start >", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(
                  child: _buildSmallCard("The Sleep Hour", "Asha Mukherjee",
                      'assets/the_sleep_hour.png')),
              const SizedBox(width: 15),
              Expanded(
                  child: _buildSmallCard("Easy on the Mission", "Peter Mach",
                      'assets/easy_on_the_mission.png')),
            ]),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(
                  child: _buildSmallCard("Relax with Me", "Amanda James",
                      'assets/relax_with_me.png')),
              const SizedBox(width: 15),
              Expanded(
                  child: _buildSmallCard("Sun and Energy", "Micheal Hiu",
                      'assets/sun_and_energy.png')),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _chip(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF039EA2) : const Color(0xFFE0F2F1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,
          style: TextStyle(
              color: isActive ? Colors.white : const Color(0xFF039EA2),
              fontSize: 12)),
    );
  }

  Widget _buildSmallCard(String title, String author, String imgPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imgPath,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text(author, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 5),
        Row(children: const [
          Icon(Icons.favorite_border, size: 12, color: Colors.grey),
          SizedBox(width: 3),
          Text("3 Sessions",
              style: TextStyle(color: Colors.grey, fontSize: 10)),
          Spacer(),
          Text("Start >", style: TextStyle(color: Colors.grey, fontSize: 10)),
        ]),
      ],
    );
  }
}

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.arrow_back_ios_new,
                        size: 18, color: Colors.blue)),
                const SizedBox(width: 15),
                const Text("3D Design Basic",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/design.png',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Row(children: [
                _badge(Icons.star, "4.569", Colors.blue[50]!, Colors.blue),
                const SizedBox(width: 10),
                _badge(Icons.star, "4.9", Colors.blue[50]!, Colors.blue),
                const SizedBox(width: 10),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        color: const Color(0xFF5C6BC0),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text("Best Seller",
                        style: TextStyle(color: Colors.white, fontSize: 12))),
              ]),
              const SizedBox(height: 20),
              const Text("3D Design Basic",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                  "In this course you will learn how to build a space to a 3-dimensional product. There are 24 premium learning videos for you.",
                  style: TextStyle(color: Colors.grey[600], height: 1.5)),
              const SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("24 Lessons (20 hours)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("See all",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  ]),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/inrtoduction.png',
                        width: 50, height: 50, fit: BoxFit.cover),
                  ),
                  const SizedBox(width: 15),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Introduction to 3D",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text("20 mins",
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ]),
                  const Spacer(),
                  const Icon(Icons.check_circle,
                      color: Color(0xFF2196F3), size: 28),
                ]),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5C6BC0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text("Enroll - \$24.99",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _badge(IconData icon, String text, Color bg, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 5),
        Text(text,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 12)),
      ]),
    );
  }
}

class OrganizerScreen extends StatelessWidget {
  const OrganizerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: const [
                      Icon(Icons.arrow_back, color: Colors.blue),
                      SizedBox(width: 15),
                      Text("Organizer",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ]),
                    Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.more_vert, color: Colors.blue)),
                  ]),
              const SizedBox(height: 30),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage('assets/man.png'), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 5))
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text("Albert Flores",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                _statItem("2.368", "Followers"),
                Container(height: 40, width: 1, color: Colors.grey[300]),
                _statItem("346", "Following"),
                Container(height: 40, width: 1, color: Colors.grey[300]),
                _statItem("13", "Events"),
              ]),
              const SizedBox(height: 30),
              Row(children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person_add, size: 18),
                    label: const Text("Follow"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5C6BC0),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(vertical: 12)),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline, size: 18),
                    label: const Text("Messages"),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF5C6BC0),
                        side: const BorderSide(color: Color(0xFF5C6BC0)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: const EdgeInsets.symmetric(vertical: 12)),
                  ),
                ),
              ]),
              const SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                _tabButton("About", true),
                _tabButton("Events", false),
                _tabButton("Reviews", false),
              ]),
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("About",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              const SizedBox(height: 10),
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  style: TextStyle(color: Colors.grey[600], height: 1.5)),
              const SizedBox(height: 10),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Read more...",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statItem(String value, String label) {
    return Column(children: [
      Text(value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      const SizedBox(height: 5),
      Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
    ]);
  }

  Widget _tabButton(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF5C6BC0) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: isActive ? null : Border.all(color: const Color(0xFF5C6BC0)),
      ),
      child: Text(text,
          style: TextStyle(
              color: isActive ? Colors.white : const Color(0xFF5C6BC0),
              fontWeight: FontWeight.bold)),
    );
  }
}