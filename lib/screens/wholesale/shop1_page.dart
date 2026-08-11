import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'category_products_screen.dart';
import 'profile_screen.dart';

class ShopProduct {
  final String title;
  final String price;
  final String? discount;
  final String imageAsset;

  const ShopProduct({
    required this.title,
    required this.price,
    this.discount,
    required this.imageAsset,
  });
}

class Shop1Page extends StatefulWidget {
  const Shop1Page({super.key});

  @override
  State<Shop1Page> createState() => _Shop1PageState();
}

class _Shop1PageState extends State<Shop1Page> {
  final TextEditingController _searchController = TextEditingController();

  final List<ShopProduct> _popularProducts = const [
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      discount: '20% off',
      imageAsset: 'assets/images/shop1/prod_red_jacket.jpg',
    ),
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_brown_shirt.jpg',
    ),
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      discount: '10% off',
      imageAsset: 'assets/images/shop1/prod_navy_polo.jpg',
    ),
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_beige_top.jpg',
    ),
  ];

  final List<ShopProduct> _newArrivals = const [
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_navy_polo.jpg',
    ),
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_red_jacket.jpg',
    ),
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_city_models.jpg',
    ),
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_denim_models.jpg',
    ),
  ];

  final List<ShopProduct> _bestsellers = const [
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_pink_tank.jpg',
    ),
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_navy_polo.jpg',
    ),
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_brown_shirt.jpg',
    ),
    ShopProduct(
      title: 'Lorem ipsum dolor sit amet',
      price: '\$344',
      imageAsset: 'assets/images/shop1/prod_red_jacket.jpg',
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
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: ResponsiveBuilder(
          child: Column(
            children: [
              // Top Header Bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    // Back Arrow Button
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.white,
                        size: 22,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),

                    // "Zend" Brand Title
                    Text(
                      'Zend',
                      style: AppTypography.headingTitle.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: AppColors.white,
                        letterSpacing: 0.5,
                      ),
                    ),

                    const Spacer(),

                    // Cart Icon with Badge
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: AppColors.white,
                            size: 26,
                          ),
                          onPressed: () {},
                        ),
                        Positioned(
                          right: 6,
                          top: 6,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: Color(0xFF4CD9A4),
                              shape: BoxShape.circle,
                            ),
                            child: const Text(
                              '2',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),

                    // User Profile Avatar - Navigates to ProfileScreen
                    GestureDetector(
                      key: const Key('zendProfileIconKey'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey[800],
                        child: const Icon(
                          Icons.person,
                          size: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Main Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),

                      // Search Input
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFF282828),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(color: AppColors.white),
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: AppColors.white.withValues(alpha: 0.5),
                              fontSize: 15,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.white.withValues(alpha: 0.5),
                              size: 22,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Hero Fashion Banner
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image:
                                AssetImage('assets/images/shop1/hero_banner.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withValues(alpha: 0.2),
                                Colors.black.withValues(alpha: 0.75),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Discover premium digital and acoustic at unbeatable prices. Limited-time offer!',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.white.withValues(alpha: 0.9),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Shop Now Mint Button
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF4CD9A4),
                                      foregroundColor: Colors.black,
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text(
                                      'Shop Now',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),

                                  // Promo Title
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        alignment: Alignment.centerRight,
                                        child: RichText(
                                          text: const TextSpan(
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white,
                                            ),
                                            children: [
                                              TextSpan(text: 'Up to '),
                                              TextSpan(
                                                text: '30% ',
                                                style: TextStyle(
                                                  color: Color(0xFF4CD9A4),
                                                ),
                                              ),
                                              TextSpan(text: 'Off Outfit..!'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Categories Heading
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Categories Horizontal Row
                      Row(
                        children: [
                          _buildCategoryCircle('Jeans',
                              'assets/images/shop1/cat_jeans.jpg'),
                          const SizedBox(width: 20),
                          _buildCategoryCircle('Shirts',
                              'assets/images/shop1/prod_red_jacket.jpg'),
                          const SizedBox(width: 20),
                          _buildCategoryCircle('T Shirts',
                              'assets/images/shop1/prod_beige_top.jpg'),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // Popular Products Section
                      _buildSectionHeader('Popular products'),
                      const SizedBox(height: 14),
                      _buildProductGrid(_popularProducts),

                      const SizedBox(height: 28),

                      // "Watch Our Video" Section
                      const Text(
                        'Watch Our Video',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        height: 210,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/shop1/video_banner.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // "Discover the Joy of Outfits" Promo Box
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF282828),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.white,
                                      ),
                                      children: [
                                        TextSpan(text: 'Discover the Joy of\n'),
                                        TextSpan(
                                          text: 'Outfits',
                                          style: TextStyle(
                                            color: Color(0xFF4CD9A4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Begin your outfit journey with zend fashion— perfect for beginners and pros alike.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          AppColors.white.withValues(alpha: 0.7),
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF4CD9A4),
                                      foregroundColor: Colors.black,
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Text(
                                      'Join Now',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 14),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/shop1/promo_banner.jpg',
                                width: 125,
                                height: 135,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // New Arrivals Section
                      _buildSectionHeader('New Arrivals'),
                      const SizedBox(height: 14),
                      _buildProductGrid(_newArrivals),

                      const SizedBox(height: 28),

                      // Bestsellers Section
                      _buildSectionHeader('Bestsellers'),
                      const SizedBox(height: 14),
                      _buildProductGrid(_bestsellers),

                      const SizedBox(height: 28),
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

  Widget _buildCategoryCircle(String title, String imageAsset) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryProductsScreen(categoryName: title),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF282828),
              border: Border.all(
                color: AppColors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.white.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        Text(
          'see all',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.white.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildProductGrid(List<ShopProduct> products) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 16,
        childAspectRatio: 0.76,
      ),
      itemBuilder: (context, index) {
        final item = products[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Product Photo Container
              Positioned.fill(
                child: Image.asset(
                  item.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),

              // Gradient Overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.1),
                        Colors.black.withValues(alpha: 0.75),
                      ],
                    ),
                  ),
                ),
              ),

              // Top Discount Badge (if present)
              if (item.discount != null)
                Positioned(
                  left: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      item.discount!,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),

              // Favorite Heart Icon
              Positioned(
                right: 10,
                top: 10,
                child: Icon(
                  Icons.favorite_border_rounded,
                  color: AppColors.white.withValues(alpha: 0.9),
                  size: 20,
                ),
              ),

              // Bottom Product Info (Title & Price)
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.price,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
