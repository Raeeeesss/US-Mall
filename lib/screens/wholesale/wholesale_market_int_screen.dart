import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/responsive/responsive_builder.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

import 'chandini_chowk_screen.dart';

class WholesaleMarketIntScreen extends StatefulWidget {
  const WholesaleMarketIntScreen({super.key});

  @override
  State<WholesaleMarketIntScreen> createState() =>
      _WholesaleMarketIntScreenState();
}

class _WholesaleMarketIntScreenState extends State<WholesaleMarketIntScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCountry = 'India';

  final List<String> _countries = const [
    'India',
    'Delhi',
    'USA',
    'UAE',
    'UK',
    'China',
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
                        'Wholesale Market(INT)',
                        style: AppTypography.headingTitle.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    // Country / City Dropdown Pill Button
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        setState(() {
                          _selectedCountry = value;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      itemBuilder: (context) {
                        return _countries.map((country) {
                          return PopupMenuItem<String>(
                            value: country,
                            child: Text(
                              country,
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
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.darkSlate,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              _selectedCountry,
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

                      const SizedBox(height: 24),

                      // 3-Column International Market Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 9,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (context, index) {
                          final isFirstItem = index == 0;
                          final itemTitle = isFirstItem
                              ? 'Chandini Chowk'
                              : 'Wholesale Market(int)';
                          return GestureDetector(
                            onTap: () {
                              if (isFirstItem) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ChandiniChowkScreen(),
                                  ),
                                );
                              }
                            },
                            child: Column(
                              children: [
                                // Card container with International Wholesale emblem
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
                                      'assets/icons/wholesale_categories/market_int.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                // Item Title Label
                                Text(
                                  itemTitle,
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
            ],
          ),
        ),
      ),
    );
  }
}
