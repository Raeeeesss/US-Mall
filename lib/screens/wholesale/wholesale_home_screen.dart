import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_assets.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'wholesale_market_int_screen.dart';

class CategoryItem {
  final String title;
  final String svgAsset;

  const CategoryItem({
    required this.title,
    required this.svgAsset,
  });
}

class WholesaleHomeScreen extends StatefulWidget {
  final String userName;

  const WholesaleHomeScreen({
    super.key,
    this.userName = 'David Thomas',
  });

  @override
  State<WholesaleHomeScreen> createState() => _WholesaleHomeScreenState();
}

class _WholesaleHomeScreenState extends State<WholesaleHomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<CategoryItem> _categories = const [
    CategoryItem(
      title: 'Wholesale Market(ind)',
      svgAsset: 'assets/icons/wholesale_categories/market_ind.svg',
    ),
    CategoryItem(
      title: 'Recommended',
      svgAsset: 'assets/icons/wholesale_categories/recommended.svg',
    ),
    CategoryItem(
      title: 'Wholesale Market(int)',
      svgAsset: 'assets/icons/wholesale_categories/market_int.svg',
    ),
    CategoryItem(
      title: 'Popular Brands',
      svgAsset: 'assets/icons/wholesale_categories/popular_brands.svg',
    ),
    CategoryItem(
      title: 'Spices and Dry Fruits',
      svgAsset: 'assets/icons/wholesale_categories/spices.svg',
    ),
    CategoryItem(
      title: 'Indian Brands',
      svgAsset: 'assets/icons/wholesale_categories/indian_brands.svg',
    ),
    CategoryItem(
      title: 'International Brands',
      svgAsset: 'assets/icons/wholesale_categories/intl_brands.svg',
    ),
    CategoryItem(
      title: 'veg & Non-Veg',
      svgAsset: 'assets/icons/wholesale_categories/veg_nonveg.svg',
    ),
    CategoryItem(
      title: 'Crackers',
      svgAsset: 'assets/icons/wholesale_categories/crackers.svg',
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
                          SvgPicture.asset(
                            AppAssets.brandLogo,
                            width: 42,
                            height: 42,
                          ),
                          const SizedBox(width: 10),

                          // Greeting Text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hai,',
                                style: AppTypography.headingSub.copyWith(
                                  fontSize: 13,
                                  color: AppColors.textSecondary,
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

                          // Right Controls (Hamburger menu + Wholesale pill badge)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.menu_rounded,
                                  color: AppColors.darkSlate,
                                  size: 28,
                                ),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  // Menu action
                                },
                              ),
                              const SizedBox(height: 12),

                              // Wholesale Green Pill Chip
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.wholesaleGreen,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.08),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'Wholesale',
                                  style: AppTypography.buttonPrimary.copyWith(
                                    color: AppColors.darkSlate,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 22),

                      // Pill Search Bar
                      Container(
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            color: AppColors.white,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 8,
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

                      const SizedBox(height: 18),

                      // Announcement Sub-header Text
                      Text(
                        'Step inside No shoes',
                        style: AppTypography.headingSub.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary.withValues(alpha: 0.8),
                        ),
                      ),

                      const SizedBox(height: 22),

                      // 3-Column Category Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 18,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (context, index) {
                          final item = _categories[index];
                          return GestureDetector(
                            onTap: () {
                              if (item.title.contains('Market(int)') ||
                                  item.title.contains('int')) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WholesaleMarketIntScreen(),
                                  ),
                                );
                              }
                            },
                            child: Column(
                              children: [
                                // Card container with graphic asset
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withValues(alpha: 0.05),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      item.svgAsset,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Item Title Label
                                Text(
                                  item.title,
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

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              // Bottom Navigation Bar
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(0, Icons.home_rounded),
                    _buildNavItem(1, Icons.favorite_border_rounded),
                    _buildNavItem(2, Icons.location_on_outlined),
                    _buildNavItem(3, Icons.grid_view_rounded),
                    _buildNavItem(4, Icons.person_outline_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.darkSlate : AppColors.textSecondary,
            size: 26,
          ),
          if (isSelected) ...[
            const SizedBox(height: 4),
            Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: AppColors.darkSlate,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
