import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'retail_restaurant_screen.dart';

class RetailCategoryGridItem {
  final String title;
  final String subTitle;
  final IconData icon;

  const RetailCategoryGridItem({
    required this.title,
    required this.subTitle,
    required this.icon,
  });
}

class RetailCategoryScreen extends StatefulWidget {
  final String categoryName;

  const RetailCategoryScreen({
    super.key,
    this.categoryName = 'Category',
  });

  @override
  State<RetailCategoryScreen> createState() => _RetailCategoryScreenState();
}

class _RetailCategoryScreenState extends State<RetailCategoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<RetailCategoryGridItem> _categories = const [
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
    ),
    RetailCategoryGridItem(
      title: 'Category 1',
      subTitle: 'Restaurant\nFood & Drinks',
      icon: Icons.restaurant_rounded,
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
                        'Category',
                        style: AppTypography.headingTitle.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
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

                      // Section Title: "All Category"
                      Text(
                        'All Category',
                        style: AppTypography.headingTitle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 3-Column Category Items Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 24,
                          childAspectRatio: 0.72,
                        ),
                        itemBuilder: (context, index) {
                          final item = _categories[index];
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RetailRestaurantScreen(),
                                  ),
                                );
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Circular Emblem Container with Icon
                                Container(
                                  width: 58,
                                  height: 58,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF1E232C),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    item.icon,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                const SizedBox(height: 6),

                                // Subtitle: "Restaurant Food & Drinks"
                                Text(
                                  item.subTitle,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textPrimary,
                                    height: 1.1,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                // Title Label: "Category 1"
                                Text(
                                  item.title,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textSecondary,
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
