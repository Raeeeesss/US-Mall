import 'package:flutter/material.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class OrderItem {
  final String title;
  final String price;
  final String quantity;

  const OrderItem({
    required this.title,
    required this.price,
    required this.quantity,
  });
}

class OrderData {
  final String orderId;
  final String date;
  final String itemsCount;
  final String totalAmount;
  final List<OrderItem> items;
  final String paymentMethod;

  const OrderData({
    required this.orderId,
    required this.date,
    required this.itemsCount,
    required this.totalAmount,
    required this.items,
    required this.paymentMethod,
  });
}

class OrdersScreen extends StatelessWidget {
  final List<OrderData> orders;

  const OrdersScreen({
    super.key,
    this.orders = const [
      OrderData(
        orderId: 'Order ID :#121212456',
        date: 'Placed on may 12 2025',
        itemsCount: 'Items 2',
        totalAmount: '\$600',
        items: [
          OrderItem(
            title: 'Shirts & pants',
            price: '\$400',
            quantity: 'qty 2',
          ),
          OrderItem(
            title: 'Summer Outfits',
            price: '\$200',
            quantity: 'qty 1',
          ),
        ],
        paymentMethod: 'Cash',
      ),
      OrderData(
        orderId: 'Order ID :#121212456',
        date: 'Placed on may 12 2025',
        itemsCount: 'Items 2',
        totalAmount: '\$600',
        items: [
          OrderItem(
            title: 'Shirts & pants',
            price: '\$400',
            quantity: 'qty 2',
          ),
          OrderItem(
            title: 'Shirts & pants',
            price: '\$200',
            quantity: 'qty 1',
          ),
        ],
        paymentMethod: 'online',
      ),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar / Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.white,
                      size: 22,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  Text(
                    'Orders',
                    style: AppTypography.headingTitle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 48), // Balance spacing
                ],
              ),
            ),

            // Scrollable List of Order Cards
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                itemCount: orders.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return ResponsiveBuilder(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F1F1F),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFF333333),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Order ID
                          Text(
                            order.orderId,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 4),

                          // Date Placed
                          Text(
                            order.date,
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.white.withValues(alpha: 0.7),
                            ),
                          ),

                          const SizedBox(height: 18),

                          // Items Header Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                order.itemsCount,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                              Text(
                                order.totalAmount,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          // Product List
                          ...order.items.map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            item.quantity,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.white
                                                  .withValues(alpha: 0.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
                              )),

                          const SizedBox(height: 4),
                          const Divider(
                            color: Color(0xFF333333),
                            height: 1,
                          ),
                          const SizedBox(height: 14),

                          // Payment Method Footer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payment method',
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      AppColors.white.withValues(alpha: 0.8),
                                ),
                              ),
                              Text(
                                order.paymentMethod,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
