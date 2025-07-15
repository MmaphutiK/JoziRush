// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:lottie/lottie.dart';
import 'login.dart';
import 'gallery.dart';
import 'contact.dart';
import 'prices.dart';
import 'package:untitled/about.dart';

void main() {
  runApp(const JoziRushApp());
}

class JoziRushApp extends StatelessWidget {
  const JoziRushApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JoziRush',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFA97458), // light brown
        scaffoldBackgroundColor: const Color(0xFFFAF7F0), // off-white
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFA97458),
          secondary: const Color(0xFFFF6D00),
          tertiary: const Color(0xFF6A1B9A),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onBackground: const Color(0xFF4E342E),
          onSurface: const Color(0xFF4E342E),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: null,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.black54,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const PricesPage(),
    const AboutPage(),
    const ContactPage(),
    const GalleryPage(),
  ];

  final List<String> _titles = const [
    'Home',
    'Prices',
    'About',
    'Contact',
    'Gallery',
  ];

  void _onSelect(int index) {
    Navigator.pop(context);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFAF7F0), Color(0xFFA97458)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: kToolbarHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFA97458), Color(0xFF6A1B9A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    Text(
                      _titles[_selectedIndex],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            color: Colors.orangeAccent,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: _pages[_selectedIndex],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6A1B9A), Color(0xFFFF6D00)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '© 2025 JoziRush. All rights reserved.',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A1B9A), Color(0xFFA97458)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6A1B9A), Color(0xFFA97458)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    'JoziRush Menu',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...List.generate(_titles.length, (index) {
                return ListTile(
                  leading: _getIconForIndex(index),
                  title: Text(
                    _titles[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                  selected: index == _selectedIndex,
                  selectedTileColor: Colors.white24,
                  onTap: () => _onSelect(index),
                );
              }),
              const Divider(color: Colors.white54),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text('Sign Out', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                        (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Icon _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return const Icon(Icons.home, color: Colors.white);
      case 1:
        return const Icon(Icons.attach_money, color: Colors.white);
      case 2:
        return const Icon(Icons.info, color: Colors.white);
      case 3:
        return const Icon(Icons.contact_mail, color: Colors.white);
      case 4:
        return const Icon(Icons.photo_library, color: Colors.white);
      default:
        return const Icon(Icons.help, color: Colors.white);
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://videos.pexels.com/video-files/3121459/3121459-uhd_2560_1440_24fps.mp4',
    )..initialize().then((_) {
      setState(() {});
      _controller.play();
      _controller.setLooping(true);
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const lightBrown = Color(0xFFA97458);
    const orange = Color(0xFFFF6D00);
    const purple = Color(0xFF6A1B9A);

    return ListView(
      key: const ValueKey('HomePage'),
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Image.asset(
            'logo-removebg-preview.png',
            height: 300,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Discover Jozi like never before!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: lightBrown,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'From rooftop bars to historic landmarks, JoziRush brings the city to your fingertips.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: lightBrown),
        ),
        const SizedBox(height: 20),
        const Text(
          '🎥 Experience the vibe',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: orange,
          ),
        ),
        const SizedBox(height: 8),
        _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : const Center(child: CircularProgressIndicator()),
        const SizedBox(height: 20),
        const Text(
          '✨ JoziRush in Motion',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: purple,
          ),
        ),
        Lottie.asset('assets/fun_city.json', height: 150),
        const SizedBox(height: 20),
        FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: orange.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Explore Johannesburg’s vibrant culture and exciting events.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: lightBrown,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
