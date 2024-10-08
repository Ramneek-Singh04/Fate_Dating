import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'restaurant.dart';
import 'restaurant_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant List',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE2E2B6),
      ),
      home: RestaurantListPage(),
      debugShowCheckedModeBanner: false, // This removes the debug banner
    );
  }
}

class RestaurantListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantListAsyncValue = ref.watch(restaurantProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant List',
          style: TextStyle(
            color: Colors.white, // Change to your desired color
            fontFamily: 'CursiveFont', // Use your custom cursive font
            fontWeight: FontWeight.bold, // Makes the text bold
            fontSize: 20, // Adjust font size if needed
          ),
        ),
        backgroundColor: Color(0xFF6EACDA),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: restaurantListAsyncValue.when(
              data: (restaurants) {
                final filteredRestaurants = restaurants.where((restaurant) {
                  return restaurant.name.toLowerCase().contains(searchQuery.toLowerCase());
                }).toList();

                return ListView.builder(
                  itemCount: filteredRestaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = filteredRestaurants[index];
                    return ListTile(
                      title: Text(
                        '${restaurant.name} (${restaurant.cuisine})',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
