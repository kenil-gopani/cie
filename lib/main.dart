import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';
import 'cart_screen.dart';
import 'explore_screen.dart';
import 'favorite_screen.dart';
import 'account_screen.dart';
import 'dashboard_screen.dart';

void main() {
  runApp(const PetShopApp());
}

// Data Models
class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String image;
  final double rating;
  final String weight;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    required this.rating,
    required this.weight,
    required this.stock,
  });
}

class Pet {
  final String id;
  final String name;
  final String breed;
  final int age;
  final String gender;
  final double price;
  final String image;
  final double rating;

  Pet({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.gender,
    required this.price,
    required this.image,
    required this.rating,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

// Dummy Data
class AppData {
  static final List<Product> products = [
    Product(
        id: '1',
        name: 'Symply Dog Adult Chicken',
        category: 'Dog Food',
        price: 199.00,
        image: '🥩',
        rating: 4.5,
        weight: '395g',
        stock: 50),
    Product(
        id: '2',
        name: 'Premium Cat Food',
        category: 'Cat Food',
        price: 249.00,
        image: '🐟',
        rating: 4.8,
        weight: '400g',
        stock: 35),
    Product(
        id: '3',
        name: 'Dog Chew Treats',
        category: 'Dog Treats',
        price: 399.00,
        image: '🦴',
        rating: 4.7,
        weight: '250g',
        stock: 42),
    Product(
        id: '4',
        name: 'Cat Litter Premium',
        category: 'Cat Accessories',
        price: 1299.00,
        image: '🧼',
        rating: 4.6,
        weight: '5kg',
        stock: 28),
    Product(
        id: '5',
        name: 'Pet Grooming Kit',
        category: 'Grooming',
        price: 2499.00,
        image: '✂️',
        rating: 4.9,
        weight: '1kg',
        stock: 15),
    Product(
        id: '6',
        name: 'Bird Seed Mix',
        category: 'Bird Food',
        price: 599.00,
        image: '🌾',
        rating: 4.5,
        weight: '1kg',
        stock: 60),
  ];

  static final List<Pet> pets = [
    Pet(
        id: 'p1',
        name: 'Buddy',
        breed: 'Golden Retriever',
        age: 2,
        gender: 'Male',
        price: 850.0,
        image: '🐕',
        rating: 4.9),
    Pet(
        id: 'p2',
        name: 'Luna',
        breed: 'Persian Cat',
        age: 1,
        gender: 'Female',
        price: 650.0,
        image: '🐱',
        rating: 4.8),
    Pet(
        id: 'p3',
        name: 'Max',
        breed: 'German Shepherd',
        age: 3,
        gender: 'Male',
        price: 1200.0,
        image: '🐕‍🦺',
        rating: 5.0),
    Pet(
        id: 'p4',
        name: 'Whiskers',
        breed: 'Siamese',
        age: 2,
        gender: 'Male',
        price: 550.0,
        image: '😺',
        rating: 4.7),
  ];

  static List<CartItem> cart = [];
}

class PetShopApp extends StatelessWidget {
  const PetShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B35),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => const MainScreen(),
      },
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
    const DashboardScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_outlined, 'Home'),
                _buildNavItem(1, Icons.explore_outlined, 'Explore'),
                _buildNavItem(2, Icons.shopping_cart_outlined, 'Cart'),
                _buildNavItem(3, Icons.favorite_border, 'Favourite'),
                _buildNavItem(4, Icons.person_outline, 'Account'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color:
                  isSelected ? const Color(0xFFFF6B35) : Colors.grey.shade600,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color:
                    isSelected ? const Color(0xFFFF6B35) : Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildTopBar(),
            const SizedBox(height: 20),
            _buildPromoBanner(),
            const SizedBox(height: 32),
            _buildTrendingSection(),
            const SizedBox(height: 32),
            _buildBrowsePetTypes(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Logo
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF8B4513),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.pets,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Search Bar
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey.shade500, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    'Search Product or Brand',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF4FD1C5), Color(0xFF38B2AC)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // Product Image Placeholder (left side)
            Positioned(
              left: 16,
              top: 20,
              bottom: 20,
              child: Row(
                children: [
                  _buildProductBag(),
                  const SizedBox(width: 8),
                  _buildProductBag(),
                ],
              ),
            ),
            // Text Content (right side)
            Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Canagan Dental',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Get Up To 40% OFF',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductBag() {
    return Container(
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF2D3748),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending now',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'See all',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFFFF6B35),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildTrendingCard(
                image: 'puppy',
                title: 'Free puppy socialisation in store',
                subtitle: 'FREE',
                badgeText: 'Join us at\npuppy hour',
                badgeColor: const Color(0xFF60A5FA),
              ),
              const SizedBox(width: 16),
              _buildTrendingCard(
                image: 'toys',
                title: 'Eco-friendly toys your dog will love',
                subtitle: 'Shop Green Elk',
                badgeText: null,
                badgeColor: null,
              ),
              const SizedBox(width: 16),
              _buildTrendingCard(
                image: 'safety',
                title: 'Pet proofing made easy',
                subtitle: 'Safety Tips',
                badgeText: null,
                badgeColor: null,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrendingCard({
    required String image,
    required String title,
    required String subtitle,
    String? badgeText,
    Color? badgeColor,
  }) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _getImageGradient(image),
              ),
            ),
            child: Stack(
              children: [
                // Simulate photo with patterns
                Center(
                  child: _getImageContent(image),
                ),
                // Badge overlay
                if (badgeText != null)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: badgeColor,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          badgeText,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Text Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Color> _getImageGradient(String image) {
    switch (image) {
      case 'puppy':
        return [const Color(0xFFD4A574), const Color(0xFFB8956A)];
      case 'toys':
        return [const Color(0xFFE8D5C4), const Color(0xFFD4BFA8)];
      case 'safety':
        return [const Color(0xFFFBB040), const Color(0xFFF89C1C)];
      default:
        return [Colors.grey.shade300, Colors.grey.shade400];
    }
  }

  Widget _getImageContent(String image) {
    switch (image) {
      case 'puppy':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPuppyFace(Colors.brown.shade800),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 8),
            _buildPuppyFace(Colors.brown.shade700),
          ],
        );
      case 'toys':
        return Stack(
          children: [
            Positioned(
              top: 20,
              left: 30,
              child:
                  Icon(Icons.category, color: Colors.green.shade700, size: 30),
            ),
            Positioned(
              top: 50,
              right: 30,
              child: Icon(Icons.star, color: Colors.red.shade400, size: 25),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.teal.shade600,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 25,
              child: Icon(Icons.circle, color: Colors.pink.shade300, size: 20),
            ),
          ],
        );
      case 'safety':
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home_rounded,
                size: 50, color: Colors.white.withOpacity(0.9)),
            const SizedBox(height: 8),
            Icon(Icons.shield, size: 30, color: Colors.white.withOpacity(0.8)),
          ],
        );
      default:
        return const Icon(Icons.image, size: 50, color: Colors.white);
    }
  }

  Widget _buildPuppyFace(Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            width: 20,
            height: 12,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrowsePetTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Browse pet types',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'See all',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFFFF6B35),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                  child: _buildPetTypeCard(
                      'Dog', const Color(0xFFFFF5E6), Colors.orange.shade300)),
              const SizedBox(width: 16),
              Expanded(
                  child: _buildPetTypeCard(
                      'Cat', const Color(0xFFE8F4F8), Colors.blue.shade200)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPetTypeCard(String type, Color bgColor, Color imgColor) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Pet photo simulation
          Positioned(
            left: 12,
            top: 12,
            bottom: 12,
            child: Container(
              width: 70,
              decoration: BoxDecoration(
                color: imgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  type == 'Dog' ? Icons.pets : Icons.pets,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Label
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: Text(
                type,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Products',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: AppData.products.length,
              itemBuilder: (context, index) {
                final product = AppData.products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF5E6),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              product.image,
                              style: const TextStyle(fontSize: 50),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                product.weight,
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '£${product.price}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Color(0xFFFF6B35),
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        '${product.rating}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                  ),
                  IconButton(
                    onPressed: () => setState(() => isFavorite = !isFavorite),
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Center(
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF5E6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            widget.product.image,
                            style: const TextStyle(fontSize: 120),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Name and Price
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  widget.product.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Text(
                                '£${widget.product.price}',
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Weight
                          Text(
                            widget.product.weight,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          // Rating
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                index < widget.product.rating.floor()
                                    ? Icons.star
                                    : Icons.star_border,
                                color: const Color(0xFFFF6B35),
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Quantity Selector
                          Row(
                            children: [
                              _buildQuantityButton(
                                Icons.remove,
                                () {
                                  if (quantity > 1) {
                                    setState(() => quantity--);
                                  }
                                },
                              ),
                              Container(
                                width: 60,
                                height: 50,
                                alignment: Alignment.center,
                                child: Text(
                                  '$quantity',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              _buildQuantityButton(
                                Icons.add,
                                () => setState(() => quantity++),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Action Buttons
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    side:
                                        BorderSide(color: Colors.grey.shade300),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Repeat Order',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    side:
                                        BorderSide(color: Colors.grey.shade300),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Calculate',
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: const Color(0xFFFF6B35),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 16,
                                  ),
                                  side: BorderSide(color: Colors.grey.shade300),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'No thanks',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 18,
                                      color: Colors.black87,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Expandable Sections
                          _buildExpandableSection('Product Detail'),
                          const Divider(height: 1),
                          _buildExpandableSection('Composition'),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            // Add to cart logic
            final existingIndex = AppData.cart.indexWhere(
              (item) => item.product.id == widget.product.id,
            );
            if (existingIndex >= 0) {
              AppData.cart[existingIndex].quantity += quantity;
            } else {
              AppData.cart.add(CartItem(
                product: widget.product,
                quantity: quantity,
              ));
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Added to cart!',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                ),
                backgroundColor: const Color(0xFF10B981),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: Text(
            'ADD TO CART',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.black87, size: 20),
      ),
    );
  }

  Widget _buildExpandableSection(String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.black87),
      onTap: () {},
    );
  }
}
