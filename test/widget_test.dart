import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:usmall/main.dart';
import 'package:usmall/models/user_type.dart';
import 'package:usmall/screens/login/login_screen.dart';
import 'package:usmall/screens/register/register_screen.dart';
import 'package:usmall/widgets/primary_button.dart';

void main() {
  testWidgets('Retail Home -> Profile navigation opens existing ProfileScreen and back returns to Retail', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegisterScreen(userType: UserType.retail),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Register button to enter RetailHomeScreen
    final registerButton = find.widgetWithText(PrimaryButton, 'Register');
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    // Tap Profile bottom navigation item
    await tester.tap(find.text('Profile').first);
    await tester.pumpAndSettle();

    // Verify ProfileScreen opens
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('johnode'), findsOneWidget);
    expect(find.text('johnode@gmail.com'), findsOneWidget);
    expect(find.text('99989873738'), findsOneWidget);
    expect(find.text('Orders'), findsOneWidget);

    // Tap Back button to return to RetailHomeScreen
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    await tester.pumpAndSettle();

    // Verify back on RetailHomeScreen
    expect(find.text('Retail'), findsOneWidget);
    expect(find.text('Popular Malls'), findsOneWidget);
  });

  testWidgets('Retail Category -> First Restaurant opens RetailRestaurantScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegisterScreen(userType: UserType.retail),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Register button to enter RetailHomeScreen
    final registerButton = find.widgetWithText(PrimaryButton, 'Register');
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    // Tap Category bottom navigation item
    await tester.tap(find.text('Category').first);
    await tester.pumpAndSettle();

    // Tap First Category Item (index 0)
    await tester.tap(find.text('Category 1').first);
    await tester.pumpAndSettle();

    // Verify RetailRestaurantScreen opens
    expect(find.text('Restaurant'), findsOneWidget);
    expect(find.text('Nearby'), findsOneWidget);
    expect(find.text('Search  by Category'), findsOneWidget);
    expect(find.text('All Restaurant'), findsOneWidget);
    expect(find.text('Restaurant 1'), findsWidgets);
    expect(find.text('Restaurant 2'), findsWidgets);
    expect(find.text('Restaurant 3'), findsWidgets);
  });

  testWidgets('Retail Home -> Category navigation opens RetailCategoryScreen for ANY category', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegisterScreen(userType: UserType.retail),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Register button to enter RetailHomeScreen
    final registerButton = find.widgetWithText(PrimaryButton, 'Register');
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    // Tap Category bottom navigation item
    await tester.tap(find.text('Category').first);
    await tester.pumpAndSettle();

    // Verify RetailCategoryScreen opens
    expect(find.text('Category'), findsOneWidget);
    expect(find.text('Search  by Category'), findsOneWidget);
    expect(find.text('All Category'), findsOneWidget);
    expect(find.text('Category 1'), findsWidgets);

    // Pop back to RetailHomeScreen
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    await tester.pumpAndSettle();

    // Tap Popular Brands category card
    final popularBrandsCard = find.text('Popular Brands');
    await tester.ensureVisible(popularBrandsCard);
    await tester.tap(popularBrandsCard);
    await tester.pumpAndSettle();

    // Verify RetailCategoryScreen opens again
    expect(find.text('Category'), findsOneWidget);
    expect(find.text('All Category'), findsOneWidget);
  });

  testWidgets('Retail Home -> Near By navigation opens RetailNearbyScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegisterScreen(userType: UserType.retail),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Register button to enter RetailHomeScreen
    final registerButton = find.widgetWithText(PrimaryButton, 'Register');
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    // Tap Near By bottom navigation item
    await tester.tap(find.text('Near By').first);
    await tester.pumpAndSettle();

    // Verify RetailNearbyScreen opens
    expect(find.text('Near By'), findsOneWidget);
    expect(find.text('Kozhikode'), findsOneWidget);
    expect(find.text('Search  by pincode'), findsOneWidget);
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Cosmetics'), findsOneWidget);
    expect(find.text('Toys'), findsOneWidget);
    expect(find.text('Shop 1'), findsOneWidget);
    expect(find.text('shop2'), findsOneWidget);
    expect(find.text('shop 3'), findsOneWidget);
  });

  testWidgets('Retail Home -> Favorites navigation opens RetailFavoritesScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegisterScreen(userType: UserType.retail),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Register button to enter RetailHomeScreen
    final registerButton = find.widgetWithText(PrimaryButton, 'Register');
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    // Tap Favorites bottom navigation item
    await tester.tap(find.text('Favorites').first);
    await tester.pumpAndSettle();

    // Verify RetailFavoritesScreen opens
    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('Search Fav'), findsOneWidget);
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Cosmetics'), findsOneWidget);
    expect(find.text('Toys'), findsOneWidget);
    expect(find.text('Shop 1'), findsOneWidget);
    expect(find.text('shop2'), findsOneWidget);
    expect(find.text('shop 3'), findsOneWidget);
  });

  testWidgets('Retail Home -> Offers navigation opens RetailOffersScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegisterScreen(userType: UserType.retail),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Register button to enter RetailHomeScreen
    final registerButton = find.widgetWithText(PrimaryButton, 'Register');
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    // Tap Offers bottom navigation item
    await tester.tap(find.text('Offers').first);
    await tester.pumpAndSettle();

    // Verify RetailOffersScreen opens
    expect(find.text('Offers'), findsOneWidget);
    expect(find.text('Kerala'), findsOneWidget);
    expect(find.text('Nearby'), findsOneWidget);
    expect(find.text('Search Categories'), findsOneWidget);
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Cosmetics'), findsOneWidget);
    expect(find.text('Toys'), findsOneWidget);
    expect(find.text('Shop 1'), findsOneWidget);
    expect(find.text('Shop 2'), findsOneWidget);
    expect(find.text('Shop 3'), findsOneWidget);
  });

  testWidgets('Retail Registration -> Popular Malls opens PopularMallsScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegisterScreen(userType: UserType.retail),
      ),
    );
    await tester.pumpAndSettle();

    // Tap Register button
    final registerButton = find.widgetWithText(PrimaryButton, 'Register');
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();

    // Verify RetailHomeScreen opens
    expect(find.text('Retail'), findsOneWidget);
    expect(find.text('Popular Malls'), findsOneWidget);

    // Tap Popular Malls category card
    await tester.tap(find.text('Popular Malls'));
    await tester.pumpAndSettle();

    // Verify PopularMallsScreen opens
    expect(find.text('Popular Malls'), findsOneWidget);
    // Tap Lulu Mall card
    await tester.tap(find.text('Lulu Mall').first);
    await tester.pumpAndSettle();

    // Verify LuluMallScreen opens
    expect(find.text('Lulu Malls'), findsOneWidget);
    expect(find.text('Kochi'), findsOneWidget);
    expect(find.text('All'), findsOneWidget);
    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Cosmetics'), findsOneWidget);
    expect(find.text('Toys'), findsOneWidget);
    expect(find.text('Shop 1'), findsOneWidget);
    expect(find.text('shop2'), findsOneWidget);
    expect(find.text('shop 3'), findsOneWidget);

    // Tap Shop 1 in LuluMallScreen to open Shop1Page ("Zend")
    await tester.tap(find.text('Shop 1'));
    await tester.pumpAndSettle();

    expect(find.text('Zend'), findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);

    // Tap category "Jeans" inside Shop 1 page to open CategoryProductsScreen
    await tester.tap(find.text('Jeans'));
    await tester.pumpAndSettle();

    expect(find.text('Jeans'), findsOneWidget);
    expect(find.textContaining('Outfit', findRichText: true), findsWidgets);
    expect(find.text('Join Now'), findsOneWidget);
  });

  testWidgets('Wholesale Login -> Register Now preserves Wholesale role', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(userType: UserType.wholesale),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Welcome back! Glad\nto see you, Again!'), findsOneWidget);

    // Tap Register Now
    await tester.tap(find.text('Register Now'));
    await tester.pumpAndSettle();

    // Verify Wholesale Registration page opens
    expect(find.text('Hello! Register as a\nwholesaler'), findsOneWidget);
  });

  testWidgets('Retail Login -> Register Now preserves Retail role', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(userType: UserType.retail),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Welcome back! Glad\nto see you, Again!'), findsOneWidget);

    // Tap Register Now
    await tester.tap(find.text('Register Now'));
    await tester.pumpAndSettle();

    // Verify Retail Registration page opens
    expect(find.text('Hello! Register as a\nretailer'), findsOneWidget);
  });

  testWidgets('USmallApp full Wholesale flow including Zend Shop 1 Profile Icon', (WidgetTester tester) async {
    await tester.pumpWidget(const USmallApp());
    await tester.pumpAndSettle();

    expect(find.text('US Mall Business'), findsOneWidget);
    expect(find.text('Wholesale'), findsOneWidget);
    expect(find.text('Retail'), findsOneWidget);

    // 1. Tap Wholesale on Main Screen
    await tester.tap(find.text('Wholesale'));
    await tester.pumpAndSettle();
    expect(find.text('Hello! Register as a\nwholesaler'), findsOneWidget);

    // 2. Tap Register
    final registerButton = find.widgetWithText(PrimaryButton, 'Register');
    await tester.ensureVisible(registerButton);
    await tester.tap(registerButton);
    await tester.pumpAndSettle();
    expect(find.text('David Thomas'), findsOneWidget);

    // 3. Tap Wholesale Market(int) card
    await tester.tap(find.text('Wholesale Market(int)'));
    await tester.pumpAndSettle();
    expect(find.text('Wholesale Market(INT)'), findsOneWidget);

    // 4. Select Delhi in location selector (verify no auto-navigation occurs)
    await tester.tap(find.text('India'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delhi').last);
    await tester.pumpAndSettle();
    expect(find.text('Wholesale Market(INT)'), findsOneWidget);

    // 4b. Tap first Market Card ("Chandini Chowk") to open ChandiniChowkScreen
    await tester.tap(find.text('Chandini Chowk').first);
    await tester.pumpAndSettle();
    expect(find.text('Chandini Chowk'), findsOneWidget);

    // 5. Tap Zend shop item
    await tester.tap(find.text('Zend').first);
    await tester.pumpAndSettle();

    // 6. Verify Shop1Page is displayed and Profile Avatar opens ProfileScreen directly
    expect(find.text('Zend'), findsOneWidget);
    expect(find.text('Categories'), findsOneWidget);

    await tester.tap(find.byKey(const Key('zendProfileIconKey')));
    await tester.pumpAndSettle();

    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('johnode'), findsOneWidget);

    // Pop back to Shop 1
    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    await tester.pumpAndSettle();

    // 7. Tap Category "Jeans"
    await tester.tap(find.text('Jeans'));
    await tester.pumpAndSettle();

    // 8. Verify CategoryProductsScreen is displayed with category title
    expect(find.text('Jeans'), findsOneWidget);
    expect(find.textContaining('Outfit', findRichText: true), findsWidgets);
    expect(find.text('Join Now'), findsOneWidget);

    // 9. Tap Product Card to open ProductDetailScreen
    await tester.tap(find.text('Lorem ipsum dolor').first);
    await tester.pumpAndSettle();

    // 10. Verify ProductDetailScreen layout elements
    expect(find.text('Shirt & pants'), findsOneWidget);
    expect(find.text('\$200'), findsWidgets);
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Day Returns'), findsOneWidget);
    expect(find.text('Add to cart'), findsOneWidget);

    // 11. Tap Add to cart to open MyCartScreen
    await tester.tap(find.text('Add to cart'));
    await tester.pumpAndSettle();

    // 12. Verify MyCartScreen layout elements
    expect(find.text('My Cart'), findsOneWidget);
    expect(find.text('Lorem ipsum dolor sit amet'), findsOneWidget);
    expect(find.text('\$200'), findsWidgets);
    expect(find.text('Price details'), findsOneWidget);
    expect(find.text('Total amount:'), findsOneWidget);
    expect(find.text('Check out'), findsOneWidget);

    // 13. Tap Check out to open CheckoutScreen
    await tester.tap(find.text('Check out'));
    await tester.pumpAndSettle();

    // 14. Verify CheckoutScreen layout elements
    expect(find.text('Check Out'), findsOneWidget);
    expect(find.text('Shipping address'), findsOneWidget);
    expect(find.text('Johndoe'), findsOneWidget);
    expect(find.text('Order Details'), findsOneWidget);

    // 15. Tap Edit icon on CheckoutScreen to open ShippingAddressScreen
    await tester.tap(find.byIcon(Icons.edit_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Shipping Address'), findsOneWidget);

    // 16. Tap Profile Icon on ShippingAddressScreen to open ProfileScreen
    await tester.tap(find.byKey(const Key('profileIconKey')));
    await tester.pumpAndSettle();

    // 17. Verify ProfileScreen layout elements
    expect(find.text('Profile'), findsOneWidget);
    expect(find.text('johnode'), findsOneWidget);
    expect(find.text('johnode@gmail.com'), findsOneWidget);
    expect(find.text('99989873738'), findsOneWidget);
    expect(find.text('Orders'), findsOneWidget);
    expect(find.text('My address'), findsOneWidget);
    expect(find.text('Wishlist'), findsOneWidget);
    expect(find.text('Customer Support'), findsOneWidget);

    // 18. Tap Orders option on ProfileScreen to open OrdersScreen
    await tester.tap(find.text('Orders'));
    await tester.pumpAndSettle();

    // 19. Verify OrdersScreen layout elements
    expect(find.text('Orders'), findsOneWidget);
    expect(find.text('Order ID :#121212456'), findsWidgets);
    expect(find.text('Placed on may 12 2025'), findsWidgets);
    expect(find.text('Items 2'), findsWidgets);
    expect(find.text('Shirts & pants'), findsWidgets);
    expect(find.text('Summer Outfits'), findsOneWidget);
    expect(find.text('Payment method'), findsWidgets);
    expect(find.text('Cash'), findsOneWidget);
    expect(find.text('online'), findsOneWidget);
  });
}
