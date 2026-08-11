import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import 'product_detail_screen.dart';

class CategoryProductItem {
  final String title;
  final String price;
  final String originalPrice;
  final String rating;
  final String imageAsset;

  const CategoryProductItem({
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.imageAsset,
  });
}

class CategoryProductsScreen extends StatefulWidget {
  final String categoryName;

  const CategoryProductsScreen({
    super.key,
    this.categoryName = 'All Categories',
  });

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<CategoryProductItem> _products = const [
    CategoryProductItem(
      title: 'Lorem ipsum dolor',
      price: '\$344',
      originalPrice: '\$400',
      rating: '4.6',
      imageAsset: 'assets/images/shop1/prod_beige_top.jpg',
    ),
    CategoryProductItem(
      title: 'Lorem ipsum dolor',
      price: '\$344',
      originalPrice: '\$400',
      rating: '4.6',
      imageAsset: 'assets/images/shop1/prod_red_jacket.jpg',
    ),
    CategoryProductItem(
      title: 'Lorem ipsum dolor',
      price: '\$344',
      originalPrice: '\$400',
      rating: '4.6',
      imageAsset: 'assets/images/shop1/prod_beige_top.jpg',
    ),
    CategoryProductItem(
      title: 'Lorem ipsum dolor',
      price: '\$344',
      originalPrice: '\$400',
      rating: '4.6',
      imageAsset: 'assets/images/shop1/prod_brown_shirt.jpg',
    ),
    CategoryProductItem(
      title: 'Lorem ipsum dolor',
      price: '\$344',
      originalPrice: '\$400',
      rating: '4.6',
      imageAsset: 'assets/images/shop1/prod_city_models.jpg',
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

                    const Spacer(),

                    // Header Title
                    Text(
                      widget.categoryName.isNotEmpty
                          ? widget.categoryName
                          : 'All Categories',
                      style: AppTypography.headingTitle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
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
                            size: 24,
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
                  ],
                ),
              ),

              // Main Content Area
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 6),

                      // Search Bar
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
                            suffixIcon: Icon(
                              Icons.search,
                              color: AppColors.white.withValues(alpha: 0.5),
                              size: 22,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Hero Banner
                      Container(
                        height: 180,
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
                                Colors.black.withValues(alpha: 0.3),
                                Colors.black.withValues(alpha: 0.8),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white,
                                  ),
                                  children: [
                                    TextSpan(text: 'Discover the Joy of\n'),
                                    TextSpan(
                                      text: 'Outfit',
                                      style: TextStyle(
                                        color: Color(0xFF4CD9A4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Discover premium digital and acoustic at unbeatable prices. Limited-time offer!',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.white.withValues(alpha: 0.8),
                                ),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4CD9A4),
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 8,
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
                      ),

                      const SizedBox(height: 20),

                      // Vertical Stack of Product Cards
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _products.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 14),
                        itemBuilder: (context, index) {
                          final product = _products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(
                                    title: product.title == 'Lorem ipsum dolor'
                                        ? 'Shirt & pants'
                                        : product.title,
                                    price: '\$200',
                                    imageAsset: product.imageAsset,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFF282828),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  // Product Photo
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      product.imageAsset,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 14),

                                  // Product Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Title & Favorite Icon
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                product.title,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.white,
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Icon(
                                              Icons.favorite_border_rounded,
                                              color: AppColors.white
                                                  .withValues(alpha: 0.7),
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),

                                        // Price Row
                                        Row(
                                          children: [
                                            Text(
                                              product.price,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              product.originalPrice,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFFE74C3C),
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    Color(0xFFE74C3C),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),

                                        // Rating Row
                                        Row(
                                          children: [
                                            Text(
                                              product.rating,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            const Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFFFFD700),
                                              size: 16,
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
