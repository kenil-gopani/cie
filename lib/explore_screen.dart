import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedTab = 1; // Dog selected
  final List<String> _tabs = ['All', 'Dog', 'Cat', 'Small Animal', 'Bird'];

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Dog Food', 'color': const Color(0xFFD4F4DD), 'image': '🥘'},
    {'name': 'Dog Treats', 'color': const Color(0xFFFFE8D6), 'image': '🦴'},
    {'name': 'Dog Treatment', 'color': const Color(0xFFFFE4E8), 'image': '🐕'},
    {'name': 'Dog Grooming', 'color': const Color(0xFFEDE7F6), 'image': '🧼'},
    {'name': 'Dog Toys', 'color': const Color(0xFFFFF9E6), 'image': '🎾'},
    {'name': 'Dog Beds', 'color': const Color(0xFFE3F2FD), 'image': '🛏️'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 16),
          // Title
          Text(
            'Explore Categories',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey.shade500, size: 22),
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
          const SizedBox(height: 20),
          // Category Tabs
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _tabs.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedTab == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTab = index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFFFD4BD)
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFFFFB894)
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _tabs[index],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w500,
                          color: isSelected
                              ? Colors.black87
                              : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          // Category Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.95,
              ),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final category = _categories[index];
                return Container(
                  decoration: BoxDecoration(
                    color: category['color'] as Color,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            category['image'] as String,
                            style: const TextStyle(fontSize: 50),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        category['name'] as String,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
