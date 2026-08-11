import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../wholesale/shop1_page.dart';

class RetailShopItem {
  final String title;
  final String svgAsset;

  const RetailShopItem({
    required this.title,
    required this.svgAsset,
  });
}

class LuluMallScreen extends StatefulWidget {
  const LuluMallScreen({super.key});

  @override
  State<LuluMallScreen> createState() => _LuluMallScreenState();
}

class _LuluMallScreenState extends State<LuluMallScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedCategoryIndex = 0;
  String _selectedCity = 'Kochi';

  final List<String> _categories = const [
    'All',
    'Food',
    'Cosmetics',
    'Toys',
  ];

  final List<String> _cities = const [
    'Kochi',
    'Trivandrum',
    'Calicut',
    'Kottayam',
    'Thrissur',
  ];

  final List<RetailShopItem> _shops = const [
    RetailShopItem(title: 'Shop 1', svgAsset: 'assets/icons/shops/shop_1.svg'),
    RetailShopItem(title: 'shop2', svgAsset: 'assets/icons/shops/shop_2.svg'),
    RetailShopItem(title: 'shop 3', svgAsset: 'assets/icons/shops/shop_3.svg'),
    RetailShopItem(title: 'shop 4', svgAsset: 'assets/icons/shops/shop_4.svg'),
    RetailShopItem(title: 'shop 5', svgAsset: 'assets/icons/shops/shop_5.svg'),
    RetailShopItem(title: 'shop 6', svgAsset: 'assets/icons/shops/shop_6.svg'),
    RetailShopItem(title: 'shop 7', svgAsset: 'assets/icons/shops/shop_7.svg'),
    RetailShopItem(title: 'shop 8', svgAsset: 'assets/icons/shops/shop_8.svg'),
    RetailShopItem(title: 'shop 9', svgAsset: 'assets/icons/shops/shop_9.svg'),
    RetailShopItem(title: 'shop 10', svgAsset: 'assets/icons/shops/shop_10.svg'),
    RetailShopItem(title: 'shop 11', svgAsset: 'assets/icons/shops/shop_11.svg'),
    RetailShopItem(title: 'shop 12', svgAsset: 'assets/icons/shops/shop_12.svg'),
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
                        'Lulu Malls',
                        style: AppTypography.headingTitle.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    // Location / City Dropdown Pill Button (Kochi)
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        setState(() {
                          _selectedCity = value;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      itemBuilder: (context) {
                        return _cities.map((city) {
                          return PopupMenuItem<String>(
                            value: city,
                            child: Text(
                              city,
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
                              _selectedCity,
                              style: AppTypography.buttonSecondary.copyWith(
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
              ),

              // Search Bar & Main Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 4),

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

                      const SizedBox(height: 20),

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

                      const SizedBox(height: 24),

                      // 3-Column Shops Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _shops.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (context, index) {
                          final shop = _shops[index];
                          return GestureDetector(
                            onTap: () {
                              if (index == 0 ||
                                  shop.title.toLowerCase() == 'shop 1') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Shop1Page(),
                                  ),
                                );
                              }
                            },
                            child: Column(
                              children: [
                                // Shop graphic card container
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: AppColors.inputBorder
                                            .withValues(alpha: 0.4),
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
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(
                                      shop.svgAsset,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Shop Title Label
                                Text(
                                  shop.title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTypography.inputText.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
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
