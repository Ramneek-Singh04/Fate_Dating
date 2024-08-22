# Fate_Dating


This Flutter application displays a list of restaurants, allowing users to search and filter by name. It uses the Riverpod package for efficient state management, making the app responsive and easy to scale.

The application starts with necessary imports, including flutter/material.dart for UI components and flutter_riverpod/flutter_riverpod.dart for state management. The custom files restaurant.dart and restaurant_provider.dart hold the restaurant data model and logic for fetching data.

In the main function, the app initializes by wrapping the MyApp widget in a ProviderScope, which enables the use of Riverpod throughout the app.

The MyApp class is the root of the application. It sets up the basic structure and design, using the MaterialApp widget to apply a consistent theme and define the home screen. The home property points to RestaurantListPage, the main screen that users interact with.

The RestaurantListPage class, which extends ConsumerWidget, is where the restaurant list is displayed. It listens to two providers: one that fetches the list of restaurants (restaurantProvider), and another that manages the search input (searchQueryProvider).

The interface includes an AppBar with a customized title and a body with a TextField for search input. Below the search bar, a list of restaurants is shown, which updates in real-time as the user types in the search box. Each restaurant is listed with its name and type of cuisine.

The app handles different states like loading, displaying a spinner, and showing an error message if something goes wrong. This ensures a smooth user experience.

In summary, this documentation explains the structure and key components of the Flutter app, focusing on how it displays and filters a list of restaurants using state management with Riverpod.
