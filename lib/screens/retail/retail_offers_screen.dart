import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'retail_nearby_screen.dart';

class OfferPosterItem {
  final String title;
  final String discountText;
  final Color cardBgColor;
  final Color badgeBgColor;

  const OfferPosterItem({
    required this.title,
    required this.discountText,
    required this.cardBgColor,
    required this.badgeBgColor,
  });
}

class RetailOffersScreen extends StatefulWidget {
  const RetailOffersScreen({super.key});

  @override
  State<RetailOffersScreen> createState() => _RetailOffersScreenState();
}

class _RetailOffersScreenState extends State<RetailOffersScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategoryIndex = 0;
  String _selectedState = 'Kerala';

  final List<String> _categories = const [
    'All',
    'Food',
    'Cosmetics',
    'Toys',
  ];

  final List<String> _states = const [
    'Kerala',
    'Delhi',
    'Maharashtra',
    'Karnataka',
    'Tamil Nadu',
  ];

  final List<OfferPosterItem> _offers = const [
    OfferPosterItem(
      title: 'Shop 1',
      discountText: 'GET UPTO 40% OFF',
      cardBgColor: Color(0xFF00B0FF),
      badgeBgColor: Color(0xFF0288D1),
    ),
    OfferPosterItem(
      title: 'Shop 2',
      discountText: 'UP TO 50% OFF',
      cardBgColor: Color(0xFFFF6D00),
      badgeBgColor: Color(0xFFE65100),
    ),
    OfferPosterItem(
      title: 'Shop 3',
      discountText: 'SALE 30% OFF',
      cardBgColor: Color(0xFFFF1744),
      badgeBgColor: Color(0xFFD50000),
    ),
    OfferPosterItem(
      title: 'Shop 4',
      discountText: 'GET UPTO 40% OFF',
      cardBgColor: Color(0xFF00B0FF),
      badgeBgColor: Color(0xFF0288D1),
    ),
    OfferPosterItem(
      title: 'Shop 5',
      discountText: 'UP TO 50% OFF',
      cardBgColor: Color(0xFFFF6D00),
      badgeBgColor: Color(0xFFE65100),
    ),
    OfferPosterItem(
      title: 'Shop 6',
      discountText: 'SALE 30% OFF',
      cardBgColor: Color(0xFFFF1744),
      badgeBgColor: Color(0xFFD50000),
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ResponsiveBuilder(
          child: Column(
            children: [
              // Top Header Bar & Action Buttons
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 18.0,
                  top: 12.0,
                  bottom: 8.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Back Chevron Icon
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.darkSlate,
                            size: 22,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),

                        // Header Title
                        Expanded(
                          child: Text(
                            'Offers',
                            style: AppTypography.headingTitle.copyWith(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

                        // Location / State Dropdown Pill Button (Kerala)
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            setState(() {
                              _selectedState = value;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          itemBuilder: (context) {
                            return _states.map((state) {
                              return PopupMenuItem<String>(
                                value: state,
                                child: Text(
                                  state,
                                  style: AppTypography.inputText.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.periwinkleBg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.my_location_rounded,
                                  color: AppColors.darkSlate,
                                  size: 16,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  _selectedState,
                                  style: AppTypography.buttonSecondary
                                      .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 6),

                    // Nearby Pill Button (Aligned Right below location pill)
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RetailNearbyScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF86E89B),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.location_on_rounded,
                                color: Color(0xFF0F5025),
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Nearby',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F5025),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Search Bar & Main Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 4),

                      // Pill Search Bar (Search Categories)
                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            color: AppColors.inputBorder,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.03),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          style: AppTypography.inputText,
                          decoration: InputDecoration(
                            hintText: 'Search Categories',
                            hintStyle: AppTypography.inputHint.copyWith(
                              color: AppColors.textSecondary,
                              fontSize: 15,
                            ),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 16, right: 8),
                              child: Icon(
                                Icons.search_rounded,
                                color: AppColors.textSecondary,
                                size: 22,
                              ),
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Horizontal Category Filter Chips Row
                      SizedBox(
                        height: 42,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: _categories.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 12),
                          itemBuilder: (context, index) {
                            final isSelected = _selectedCategoryIndex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategoryIndex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? const Color(0xFF4CD9A4)
                                      : AppColors.white,
                                  borderRadius: BorderRadius.circular(21),
                                  border: Border.all(
                                    color: isSelected
                                        ? const Color(0xFF4CD9A4)
                                        : AppColors.inputBorder,
                                    width: 1,
                                  ),
                                  boxShadow: isSelected
                                      ? [
                                          BoxShadow(
                                            color: const Color(0xFF4CD9A4)
                                                .withValues(alpha: 0.3),
                                            blurRadius: 6,
                                            offset: const Offset(0, 2),
                                          ),
                                        ]
                                      : [],
                                ),
                                child: Text(
                                  _categories[index],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: isSelected
                                        ? FontWeight.w700
                                        : FontWeight.w600,
                                    color: isSelected
                                        ? AppColors.darkSlate
                                        : AppColors.textPrimary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 22),

                      // 3-Column Offer Poster Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _offers.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.72,
                        ),
                        itemBuilder: (context, index) {
                          final offer = _offers[index];
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                // Vibrant Offer Poster Container Card
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: offer.cardBgColor,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withValues(alpha: 0.1),
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'SALE',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        const Text(
                                          'OFFER',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.yellow,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: offer.badgeBgColor,
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            offer.discountText,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Shop Label
                                Text(
                                  offer.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.inputText.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
