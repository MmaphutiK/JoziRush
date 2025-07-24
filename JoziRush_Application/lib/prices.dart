import 'package:flutter/material.dart';


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