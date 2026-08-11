import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../models/cart_item.dart';
import 'my_cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final String title;
  final String price;
  final String imageAsset;

  const ProductDetailScreen({
    super.key,
    this.title = 'Shirt & pants',
    this.price = '\$200',
    this.imageAsset = 'assets/images/shop1/prod_brown_shirt.jpg',
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Column(
        children: [
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Image Carousel Header
                  Stack(
                    children: [
                      // Photo Header
                      SizedBox(
                        height: 360,
                        width: double.infinity,
                        child: Image.asset(
                          widget.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Floating Top Back Button
                      Positioned(
                        left: 16,
                        top: MediaQuery.of(context).padding.top + 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withValues(alpha: 0.4),
                          radius: 18,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: AppColors.white,
                              size: 18,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),

                      // Carousel Page Indicator Dots
                      Positioned(
                        bottom: 14,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.4),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Content Body
                  ResponsiveBuilder(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 18),

                          // Product Title & Heart Icon
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border_rounded,
                                color: AppColors.white,
                                size: 22,
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          // Price Display
                          Text(
                            widget.price,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Star Rating Row
                          Row(
                            children: [
                              const Text(
                                '4.6',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < 4
                                        ? Icons.star_rounded
                                        : Icons.star_border_rounded,
                                    color: const Color(0xFFFFD700),
                                    size: 18,
                                  );
                                }),
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),

                          // Description Heading & Paragraph
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'adipiscing elit. Morbi libero erat, cursus at mattis et, tempor porta magna. Aliquam sed metus euismod sem con gue gravida. Donec congue ante elit, in maximus erat lacinia commodo',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.white.withValues(alpha: 0.7),
                              height: 1.4,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Feature Highlights Divider & Row
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFF333333),
                                  width: 1,
                                ),
                                bottom: BorderSide(
                                  color: Color(0xFF333333),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                // Column 1: Returns
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text(
                                        '7',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        'Day Returns',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.white
                                              .withValues(alpha: 0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Column 2: Cash on Delivery
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Cashh On',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      const Text(
                                        'Delivery',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        'Available',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.white
                                              .withValues(alpha: 0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Column 3: Warranty
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text(
                                        '1',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text(
                                        'Year Waranty',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.white
                                              .withValues(alpha: 0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Bulk Discounts Available Box
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF282828),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Bulk Discounts Available',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          AppColors.white.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.white,
                                    foregroundColor: Colors.black,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 6,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: const Text(
                                    'View',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Reviews Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Reviews',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                'see more',
                                style: TextStyle(
                                  fontSize: 13,
                                  color:
                                      AppColors.white.withValues(alpha: 0.5),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          // Review 1
                          _buildReviewItem(),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Divider(
                              color: Color(0xFF333333),
                              height: 1,
                            ),
                          ),

                          // Review 2
                          _buildReviewItem(),

                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Fixed Bottom Action Bar / Add to Cart Bar
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF282828),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: SafeArea(
              top: false,
              child: ResponsiveBuilder(
                child: Row(
                  children: [
                    // Quantity Selector Pill
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 16,
                            ),
                            onPressed: () {
                              if (_quantity > 1) {
                                setState(() {
                                  _quantity--;
                                });
                              }
                            },
                          ),
                          Text(
                            '$_quantity',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 16,
                            ),
                            onPressed: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // Price Display
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),

                    const Spacer(),

                    // Add to Cart Button
                    ElevatedButton(
                      onPressed: () {
                        final item = CartItem(
                          title: widget.title == 'Shirt & pants'
                              ? 'Lorem ipsum dolor sit amet'
                              : widget.title,
                          price: widget.price,
                          originalPrice: '\$300',
                          imageAsset: widget.imageAsset,
                          quantity: _quantity,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyCartScreen(cartItem: item),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: Colors.black,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 14,
              backgroundColor: Color(0xFF4CD9A4),
              child: Icon(
                Icons.person,
                size: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'kennaaaa@gmail.com',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const Spacer(),
            Text(
              '2 day ago',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.white.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "I recently purchased this digital piano, and I'm beyond impressed. The weighted keys feel very....",
          style: TextStyle(
            fontSize: 13,
            color: AppColors.white.withValues(alpha: 0.8),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.thumb_up_alt_outlined,
              color: AppColors.white.withValues(alpha: 0.6),
              size: 16,
            ),
            const SizedBox(width: 14),
            Icon(
              Icons.thumb_down_alt_outlined,
              color: AppColors.white.withValues(alpha: 0.6),
              size: 16,
            ),
          ],
        ),
      ],
    );
  }
}
