import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_assets.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'popular_malls_screen.dart';
import 'retail_offers_screen.dart';
import 'retail_favorites_screen.dart';
import 'retail_nearby_screen.dart';
import 'retail_category_screen.dart';
import '../wholesale/profile_screen.dart';

class RetailCategoryItem {
  final String title;
  final String svgAsset;

  const RetailCategoryItem({
    required this.title,
    required this.svgAsset,
  });
}

class RetailHomeScreen extends StatefulWidget {
  final String userName;

  const RetailHomeScreen({
    super.key,
    this.userName = 'David Thomas',
  });

  @override
  State<RetailHomeScreen> createState() => _RetailHomeScreenState();
}

class _RetailHomeScreenState extends State<RetailHomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<RetailCategoryItem> _categories = const [
    RetailCategoryItem(
      title: 'Popular Brands',
      svgAsset: 'assets/icons/wholesale_categories/popular_brands.svg',
    ),
    RetailCategoryItem(
      title: 'Recommended',
      svgAsset: 'assets/icons/wholesale_categories/recommended.svg',
    ),
    RetailCategoryItem(
      title: 'Popular Malls',
      svgAsset: 'assets/icons/wholesale_categories/market_int.svg',
    ),
    RetailCategoryItem(
      title: 'Indian Brands',
      svgAsset: 'assets/icons/wholesale_categories/indian_brands.svg',
    ),
    RetailCategoryItem(
      title: 'International Brands',
      svgAsset: 'assets/icons/wholesale_categories/intl_brands.svg',
    ),
    RetailCategoryItem(
      title: 'Branded Mall',
      svgAsset: 'assets/icons/wholesale_categories/market_int.svg',
    ),
    RetailCategoryItem(
      title: 'Offer Mall',
      svgAsset: 'assets/icons/wholesale_categories/market_ind.svg',
    ),
    RetailCategoryItem(
      title: 'Celebrity Brands(Ind)',
      svgAsset: 'assets/icons/wholesale_categories/popular_brands.svg',
    ),
    RetailCategoryItem(
      title: 'Celebrity Brands(Int)',
      svgAsset: 'assets/icons/wholesale_categories/popular_brands.svg',
    ),
    RetailCategoryItem(
      title: 'Crackers',
      svgAsset: 'assets/icons/wholesale_categories/crackers.svg',
    ),
    RetailCategoryItem(
      title: 'veg & Non-Veg',
      svgAsset: 'assets/icons/wholesale_categories/veg_nonveg.svg',
    ),
    RetailCategoryItem(
      title: 'Organic Stores',
      svgAsset: 'assets/icons/wholesale_categories/recommended.svg',
    ),
    RetailCategoryItem(
      title: 'Kids Section',
      svgAsset: 'assets/icons/wholesale_categories/spices.svg',
    ),
    RetailCategoryItem(
      title: 'Ladies Choice',
      svgAsset: 'assets/icons/wholesale_categories/spices.svg',
    ),
    RetailCategoryItem(
      title: 'Men\'s Fashion',
      svgAsset: 'assets/icons/wholesale_categories/spices.svg',
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
      backgroundColor: AppColors.periwinkleBg,
      body: SafeArea(
        child: ResponsiveBuilder(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),

                      // Top App Bar Header
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brand Purple Logo Badge
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4F29CD),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              AppAssets.brandLogo,
                              colorFilter: const ColorFilter.mode(
                                AppColors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),

                          // User Greeting
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hai,',
                                style: AppTypography.inputHint.copyWith(
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Text(
                                widget.userName,
                                style: AppTypography.headingTitle.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          // Hamburger Menu Button
                          IconButton(
                            icon: const Icon(
                              Icons.menu_rounded,
                              color: AppColors.darkSlate,
                              size: 26,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Action Pills Bar (QR Code + Retail Badge)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Purple QR Code Button
                          Container(
                            height: 38,
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4F29CD),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.qr_code_2_rounded,
                                  color: AppColors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),

                          // Retail Role Badge
                          Container(
                            height: 34,
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              color: const Color(0xFF86E89B),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Retail',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F5025),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      // Pill Search Bar
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
                            hintText: 'Search',
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

                      const SizedBox(height: 14),

                      // Tagline
                      Text(
                        'Step inside No shoes',
                        style: AppTypography.inputText.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkSlate.withValues(alpha: 0.8),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 3-Column Retail Category Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (context, index) {
                          final category = _categories[index];
                          return GestureDetector(
                            onTap: () {
                              if (category.title
                                  .toLowerCase()
                                  .contains('popular malls')) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PopularMallsScreen(),
                                  ),
                                );
                              } else if (category.title
                                  .toLowerCase()
                                  .contains('offer')) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RetailOffersScreen(),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RetailCategoryScreen(
                                      categoryName: category.title,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Column(
                              children: [
                                // Category graphic card container
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: AppColors.inputBorder
                                            .withValues(alpha: 0.5),
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withValues(alpha: 0.06),
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      category.svgAsset,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Category Title Label
                                Text(
                                  category.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
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

              // Bottom Navigation Bar
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      index: 0,
                      icon: Icons.campaign_outlined,
                      label: 'Offers',
                    ),
                    _buildNavItem(
                      index: 1,
                      icon: Icons.favorite_border_rounded,
                      label: 'Favorites',
                    ),
                    _buildNavItem(
                      index: 2,
                      icon: Icons.near_me_outlined,
                      label: 'Near By',
                    ),
                    _buildNavItem(
                      index: 3,
                      icon: Icons.grid_view_rounded,
                      label: 'Category',
                    ),
                    _buildNavItem(
                      index: 4,
                      icon: Icons.person_outline_rounded,
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        if (index == 0 || label.toLowerCase() == 'offers') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RetailOffersScreen(),
            ),
          );
        } else if (index == 1 || label.toLowerCase() == 'favorites') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RetailFavoritesScreen(),
            ),
          );
        } else if (index == 2 || label.toLowerCase().contains('near')) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RetailNearbyScreen(),
            ),
          );
        } else if (index == 3 || label.toLowerCase() == 'category') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RetailCategoryScreen(),
            ),
          );
        } else if (index == 4 || label.toLowerCase() == 'profile') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfileScreen(),
            ),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.darkSlate : AppColors.textSecondary,
            size: 22,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              color:
                  isSelected ? AppColors.darkSlate : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
