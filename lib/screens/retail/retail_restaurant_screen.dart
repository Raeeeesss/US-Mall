import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'retail_nearby_screen.dart';

class RestaurantGridItem {
  final String title;
  final String imagePath;

  const RestaurantGridItem({
    required this.title,
    required this.imagePath,
  });
}

class RetailRestaurantScreen extends StatefulWidget {
  const RetailRestaurantScreen({super.key});

  @override
  State<RetailRestaurantScreen> createState() => _RetailRestaurantScreenState();
}

class _RetailRestaurantScreenState extends State<RetailRestaurantScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<RestaurantGridItem> _restaurants = const [
    RestaurantGridItem(title: 'Restaurant 1', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 2', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 3', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 1', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 2', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 3', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 1', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 2', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 3', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 1', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 2', imagePath: 'assets/images/mall_bg.png'),
    RestaurantGridItem(title: 'Restaurant 3', imagePath: 'assets/images/mall_bg.png'),
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
              // Top Header Bar
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 18.0,
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: Row(
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
                        'Restaurant',
                        style: AppTypography.headingTitle.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    // Nearby Pill Button
                    GestureDetector(
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
                          vertical: 6,
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
                  ],
                ),
              ),

              // Search Bar & Main Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),

                      // Pill Search Bar (Search  by Category)
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
                            hintText: 'Search  by Category',
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

                      const SizedBox(height: 20),

                      // Section Title: "All Restaurant"
                      Text(
                        'All Restaurant',
                        style: AppTypography.headingTitle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 3-Column Restaurant Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _restaurants.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.76,
                        ),
                        itemBuilder: (context, index) {
                          final item = _restaurants[index];
                          return GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                // Restaurant Photo Container
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFC8AA82),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withValues(alpha: 0.08),
                                          blurRadius: 6,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.asset(
                                            item.imagePath,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                color: const Color(0xFF9E8464),
                                                child: const Icon(
                                                  Icons.storefront_rounded,
                                                  color: Colors.white,
                                                  size: 32,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Title Label: "Restaurant 1", etc.
                                Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.inputText.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
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
