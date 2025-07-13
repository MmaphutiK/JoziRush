import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:lottie/lottie.dart';

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
        primaryColor: const Color(0xFF1565C0), // Strong blue
        scaffoldBackgroundColor: const Color(0xFFFCFCFC), // Light blue/white
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF1565C0),
          secondary: const Color(0xFFFFA726), // Warm orange accent
          tertiary: const Color(0xFFFF7043), // Deep orange
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onBackground: const Color(0xFF1565C0),
          onSurface: const Color(0xFF1565C0),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1565C0),
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.black54,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFFA726),
          foregroundColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFF7043),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// =================== HOME SCREEN ===================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    PricesPage(),
    AboutPage(),
    ContactPage(),
    GalleryPage(),
  ];

  final List<String> _titles = const [
    'Home',
    'Prices',
    'About',
    'Contact',
    'Gallery',
  ];

  void _onSelect(int index) {
    Navigator.pop(context); // close drawer
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // AppBar with gradient
              Container(
                height: kToolbarHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
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

              // Page content expanded
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: _pages[_selectedIndex],
                ),
              ),

              // Footer with gradient
              const Footer(),
            ],
          ),
        ),
      ),

      // Side Drawer Menu
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
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
                    colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    'JoziRush Menu',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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

// =================== FOOTER ===================
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
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
    );
  }
}

// =================== HOME PAGE ===================
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
    )
      ..initialize().then((_) {
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
    return ListView(
      key: const ValueKey('HomePage'),
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Image.asset(
            'assets/logo.png',
            height: 100,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Discover Jozi like never before!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1565C0),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'From rooftop bars to historic landmarks, JoziRush brings the city to your fingertips.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Color(0xFF1565C0)),
        ),
        const SizedBox(height: 20),
        const Text(
          '🎥 Experience the vibe',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1565C0)),
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
              fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1565C0)),
        ),
        Lottie.asset('assets/fun_city.json', height: 150),
        const SizedBox(height: 20),
        FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFA726).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Explore Johannesburg’s vibrant culture and exciting events.',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1565C0)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

// =================== PRICES PAGE ===================
class PricesPage extends StatefulWidget {
  const PricesPage({super.key});

  @override
  State<PricesPage> createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  final List<Map<String, String>> packages = [
    {'title': 'City Tour', 'price': 'R500', 'description': 'Explore Johannesburg city highlights.'},
    {'title': 'Cultural Experience', 'price': 'R750', 'description': 'Museums, galleries, and local culture.'},
    {'title': 'Nature & Parks', 'price': 'R600', 'description': 'Nature reserves, zoo, botanical gardens.'},
    {'title': 'Full JoziRush', 'price': 'R1500', 'description': 'Everything in one epic journey!'},
    {'title': 'Gold Reef City', 'price': 'R400', 'description': 'Theme park & heritage tour.'},
    {'title': 'Soweto Towers Adventure', 'price': 'R350', 'description': 'Bungee jumping & street art.'},
    {'title': 'Neighbourgoods Market', 'price': 'R250', 'description': 'Trendy food and culture spot.'},
    {'title': 'Maboneng Street Art Walk', 'price': 'R300', 'description': 'Urban art and culture trail.'},
    {'title': 'Lion & Safari Park', 'price': 'R700', 'description': 'Wildlife experience with lions, cheetahs & more.'},
    {'title': 'Vilakazi Street Tour', 'price': 'R400', 'description': 'Explore the famous street in Soweto.'},
    {'title': 'Johannesburg Nightlife Tour', 'price': 'R550', 'description': 'Live music, bars, and night eats.'},
    {'title': 'Apartheid Museum Experience', 'price': 'R350', 'description': 'Deep dive into South African history.'},
    {'title': 'Johannesburg Botanical Gardens', 'price': 'R200', 'description': 'Picnic and nature walk day.'},
    {'title': 'Joburg Zoo Family Package', 'price': 'R300', 'description': 'Animal fun for the whole family.'},
    {'title': 'Sandton Rooftop Movie Night', 'price': 'R450', 'description': 'Explore Africa’s richest square mile and get night out experience with food , in the comfort of your vehicle .'},
    {'title': 'Montecasino Day Out', 'price': 'R500', 'description': 'Games, shows, and Italian vibes.'},
    {'title': 'Constitution Hill Tour', 'price': 'R350', 'description': 'Heritage and justice in Joburg.'},
    {'title': 'Jozi Night Market', 'price': 'R250', 'description': 'Live music, food, handmade goods.'},
    {'title': 'Cradle of Humankind Tour', 'price': 'R800', 'description': 'World heritage site adventure.'},
    {'title': 'Braamfontein Food Crawl', 'price': 'R300', 'description': 'Trendy restaurants and local bites.'},
  ];

  final List<Map<String, String>> cart = [];

  void _addToCart(Map<String, String> pkg) {
    setState(() => cart.add(pkg));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${pkg['title']} added to cart.'),
        backgroundColor: const Color(0xFFAB7D63),
      ),
    );
  }

  void _goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CartPage(cartItems: cart)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: const ValueKey('PricesPage'),
      children: [
        ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: packages.length,
          itemBuilder: (context, index) {
            final pkg = packages[index];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6),
                ],
              ),
              child: ListTile(
                title: Text(pkg['title']!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0))),
                subtitle: Text(pkg['description']!,
                    style: const TextStyle(color: Colors.black54)),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(pkg['price']!,
                        style: const TextStyle(
                            color: Color(0xFF4B3327),
                            fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add_shopping_cart,
                          color: Color(0xFFFFA726)),
                      onPressed: () => _addToCart(pkg),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton.extended(
            onPressed: _goToCart,
            label: const Text('View Cart'),
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
      ],
    );
  }
}

// =================== CART PAGE ===================
class CartPage extends StatefulWidget {
  final List<Map<String, String>> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, String>> _cartItems;

  @override
  void initState() {
    super.initState();
    _cartItems = List.from(widget.cartItems);
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = _cartItems.fold(0, (sum, item) {
      final price = double.tryParse(item['price']!.replaceAll('R', '')) ?? 0;
      return sum + price;
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _cartItems.isEmpty
                  ? const Expanded(
                child: Center(
                  child: Text('Your cart is empty.',
                      style: TextStyle(color: Colors.black54)),
                ),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: _cartItems.length,
                  itemBuilder: (context, index) {
                    final item = _cartItems[index];
                    return ListTile(
                      title: Text(item['title']!,
                          style: const TextStyle(color: Color(0xFF1565C0))),
                      subtitle: Text(item['price']!,
                          style: const TextStyle(color: Colors.black54)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeItem(index),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              Text('Total: R${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1565C0))),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.payment),
                label: const Text('Proceed to Payment'),
                onPressed: _cartItems.isEmpty
                    ? null
                    : () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const PaymentPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// =================== PAYMENT PAGE ===================
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _submitPayment() {
    if (_formKey.currentState!.validate()) {
      // In real app, here would be payment processing logic
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Payment Successful'),
          content: const Text('Thank you for your payment!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                  ..pop()
                  ..pop(); // Close payment and cart pages
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String? _validateCardNumber(String? value) {
    if (value == null || value.isEmpty) return 'Please enter card number';
    final cleaned = value.replaceAll(' ', '');
    if (cleaned.length != 16 || !RegExp(r'^[0-9]+$').hasMatch(cleaned)) {
      return 'Enter a valid 16-digit card number';
    }
    return null;
  }

  String? _validateExpiry(String? value) {
    if (value == null || value.isEmpty) return 'Enter expiry date';
    if (!RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$').hasMatch(value)) {
      return 'Expiry must be MM/YY';
    }
    return null;
  }

  String? _validateCVV(String? value) {
    if (value == null || value.isEmpty) return 'Enter CVV';
    if (!RegExp(r'^[0-9]{3}$').hasMatch(value)) {
      return 'CVV must be 3 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Enter your payment details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Cardholder Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter cardholder name' : null,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                  hintText: '1234 5678 9012 3456',
                ),
                keyboardType: TextInputType.number,
                maxLength: 19,
                validator: _validateCardNumber,
                onChanged: (value) {
                  // Add spaces every 4 digits
                  var newValue = value.replaceAll(' ', '');
                  final buffer = StringBuffer();
                  for (int i = 0; i < newValue.length; i++) {
                    if (i % 4 == 0 && i != 0) buffer.write(' ');
                    buffer.write(newValue[i]);
                  }
                  if (buffer.toString() != value) {
                    _cardNumberController.value = TextEditingValue(
                      text: buffer.toString(),
                      selection: TextSelection.collapsed(offset: buffer.length),
                    );
                  }
                },
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expiryController,
                      decoration: const InputDecoration(
                        labelText: 'Expiry Date',
                        hintText: 'MM/YY',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.datetime,
                      maxLength: 5,
                      validator: _validateExpiry,
                      onChanged: (value) {
                        var cleaned = value.replaceAll('/', '');
                        if (cleaned.length >= 3 && !value.contains('/')) {
                          var formatted =
                              '${cleaned.substring(0, 2)}/${cleaned.substring(2)}';
                          _expiryController.value = TextEditingValue(
                            text: formatted,
                            selection: TextSelection.collapsed(offset: formatted.length),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _cvvController,
                      decoration: const InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                        hintText: '123',
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      obscureText: true,
                      validator: _validateCVV,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA97458),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: _submitPayment,
                child: const Text('Pay Now', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =================== ABOUT PAGE ===================

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.deepPurple.shade700;
    final Color accentColor = Colors.deepPurpleAccent;

    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            aboutCard(
              title: 'My Story',
              content:
              'Hi, I am a passionate software developer dedicated to creating innovative and user-friendly applications. '
                  'My journey into development started with curiosity and has grown into a full-fledged career where I love solving real-world problems with code.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),
            aboutCard(
              title: 'The Idea',
              content:
              'JoziRush was born from the desire to showcase Johannesburg\'s rich culture, events, and hidden gems in a way that is accessible and engaging for both locals and tourists. '
                  'The app combines curated tours, restaurant guides, events, and exclusive deals all in one place.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),
            aboutCard(
              title: 'Vision & Mission',
              content:
              'Our vision is to become the leading digital companion for discovering Johannesburg, enriching visitor experiences and supporting local businesses.\n\n'
                  'Our mission is to provide a seamless, interactive, and visually appealing platform that connects people with what Johannesburg truly has to offer.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),
            aboutCard(
              title: 'What We\'re Trying to Achieve',
              content:
              'We aim to empower tourists and locals alike to explore the city confidently and conveniently, discovering new places, events, and special offers. '
                  'By partnering with local businesses, we provide exclusive deals and promote economic growth within the community.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),
            aboutCard(
              title: 'How It Solves a Problem',
              content:
              'Johannesburg has an abundance of attractions and events, but information is often scattered across many sources. This fragmentation makes it difficult for visitors to plan and enjoy their trips fully.\n\n'
                  'JoziRush centralizes all essential information in one app, offering curated tours, event updates, restaurant guides, and easy navigation. '
                  'This simplifies trip planning, saves time, and enhances the overall experience.',
              primaryColor: primaryColor,
              accentColor: accentColor,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget aboutCard({
    required String title,
    required String content,
    required Color primaryColor,
    required Color accentColor,
  }) {
    return Card(
      elevation: 5,
      shadowColor: primaryColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Big heading with underline accent
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// =================== CONTACT PAGE ===================
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _message = '';

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Here you could send the message to a backend or email service
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thank you for contacting us!')),
      );
      // Clear form fields
      _formKey.currentState?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: const ValueKey('ContactPage'),
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Contact Us',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1565C0)),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your name' : null,
              onSaved: (value) => _name = value ?? '',
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegEx = RegExp(r'^\S+@\S+\.\S+$');
                if (!emailRegEx.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (value) => _email = value ?? '',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.message),
              ),
              maxLines: 4,
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter a message' : null,
              onSaved: (value) => _message = value ?? '',
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _submitForm,
              icon: const Icon(Icons.send),
              label: const Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}

// =================== GALLERY PAGE ===================
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  final List<String> _images = const [
    'https://images.pexels.com/photos/1403653/pexels-photo-1403653.jpeg',
    'https://images.pexels.com/photos/69903/pexels-photo-69903.jpeg',
    'https://images.pexels.com/photos/9789494/pexels-photo-9789494.jpeg',
    'https://images.pexels.com/photos/169677/pexels-photo-169677.jpeg',
    'https://images.pexels.com/photos/32632143/pexels-photo-32632143.jpeg',
    'https://images.pexels.com/photos/1190297/pexels-photo-1190297.jpeg',
    'https://images.pexels.com/photos/868110/pexels-photo-868110.jpeg',
    'https://images.pexels.com/photos/1293265/pexels-photo-1293265.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const ValueKey('GalleryPage'),
      padding: const EdgeInsets.all(16),
      itemCount: _images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            _images[index],
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) =>
            const Center(child: Icon(Icons.broken_image, size: 50)),
          ),
        );
      },
    );
  }
}
