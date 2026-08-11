import 'package:flutter/material.dart';
import '../models/user_type.dart';
import '../screens/welcome/welcome_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/register/register_screen.dart';

import '../screens/wholesale/wholesale_home_screen.dart';
import '../screens/wholesale/wholesale_market_int_screen.dart';
import '../screens/wholesale/chandini_chowk_screen.dart';
import '../screens/wholesale/shop1_page.dart';
import '../screens/wholesale/category_products_screen.dart';
import '../screens/wholesale/product_detail_screen.dart';
import '../screens/wholesale/my_cart_screen.dart';
import '../screens/wholesale/checkout_screen.dart';
import '../screens/wholesale/shipping_address_screen.dart';
import '../screens/wholesale/profile_screen.dart';
import '../screens/wholesale/orders_screen.dart';
import '../screens/retail/retail_home_screen.dart';
import '../screens/retail/popular_malls_screen.dart';
import '../screens/retail/lulu_mall_screen.dart';
import '../screens/retail/retail_offers_screen.dart';
import '../screens/retail/retail_favorites_screen.dart';
import '../screens/retail/retail_nearby_screen.dart';
import '../screens/retail/retail_category_screen.dart';
import '../screens/retail/retail_restaurant_screen.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String wholesaleHome = '/wholesale-home';
  static const String retailHome = '/retail-home';
  static const String popularMalls = '/popular-malls';
  static const String luluMall = '/lulu-mall';
  static const String retailOffers = '/retail-offers';
  static const String retailFavorites = '/retail-favorites';
  static const String retailNearby = '/retail-nearby';
  static const String retailCategory = '/retail-category';
  static const String retailRestaurant = '/retail-restaurant';
  static const String wholesaleMarketInt = '/wholesale-market-int';
  static const String chandiniChowk = '/chandini-chowk';
  static const String shop1 = '/shop-1';
  static const String categoryProducts = '/category-products';
  static const String productDetail = '/product-detail';
  static const String myCart = '/my-cart';
  static const String checkout = '/checkout';
  static const String shippingAddress = '/shipping-address';
  static const String profile = '/profile';
  static const String orders = '/orders';

  static Map<String, WidgetBuilder> get routes => {
        welcome: (context) => const WelcomeScreen(),
        login: (context) {
          final userType =
              ModalRoute.of(context)?.settings.arguments as UserType?;
          return LoginScreen(userType: userType ?? UserType.retail);
        },
        register: (context) {
          final userType =
              ModalRoute.of(context)?.settings.arguments as UserType?;
          return RegisterScreen(userType: userType ?? UserType.retail);
        },
        wholesaleHome: (context) => const WholesaleHomeScreen(),
        retailHome: (context) => const RetailHomeScreen(),
        popularMalls: (context) => const PopularMallsScreen(),
        luluMall: (context) => const LuluMallScreen(),
        retailOffers: (context) => const RetailOffersScreen(),
        retailFavorites: (context) => const RetailFavoritesScreen(),
        retailNearby: (context) => const RetailNearbyScreen(),
        retailCategory: (context) {
          final categoryName =
              ModalRoute.of(context)?.settings.arguments as String?;
          return RetailCategoryScreen(
            categoryName: categoryName ?? 'Category',
          );
        },
        retailRestaurant: (context) => const RetailRestaurantScreen(),
        wholesaleMarketInt: (context) => const WholesaleMarketIntScreen(),
        chandiniChowk: (context) => const ChandiniChowkScreen(),
        shop1: (context) => const Shop1Page(),
        categoryProducts: (context) {
          final categoryName =
              ModalRoute.of(context)?.settings.arguments as String?;
          return CategoryProductsScreen(
            categoryName: categoryName ?? 'All Categories',
          );
        },
        productDetail: (context) => const ProductDetailScreen(),
        myCart: (context) => const MyCartScreen(),
        checkout: (context) => const CheckoutScreen(),
        shippingAddress: (context) => const ShippingAddressScreen(),
        profile: (context) => const ProfileScreen(),
        orders: (context) => const OrdersScreen(),
      };
}
