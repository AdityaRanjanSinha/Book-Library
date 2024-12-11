Project README

Project Overview :-

This project is a Flutter-based book browsing application that allows users to:

View books categorized by genres.

Search for books by title or author.

View detailed information about a selected book.

The application integrates with the Gutenberg Project API (Gutendex) to fetch book data dynamically, providing an interactive and visually appealing user experience.

Features :-

- Category-Based Browsing:

- Users can select a genre/category to view books related to that genre.

- Categories are displayed in a grid layout.

- Search Functionality: A search bar is available at the top of the category screen.Users can search for books by title or author.

- Results are dynamically fetched and displayed in the same UI format as category-based browsing.

- Book Details Screen: Users can view detailed information about a selected book, including title, author, subjects, and languages. A cover image is displayed.

Code Structure :-

The project follows a clean and modular structure for maintainability and scalability:

Key Directories and Files :-

1. models/

Contains data models for the application.

Example:

Book.dart: Represents the structure of a book.

Category.dart: Represents book categories.

2. data/

Contains hardcoded data or initializations for categories and books.

Example:

book_data.dart: Stores and manages fetched book data.

category_data.dart: Defines available categories.

3. screens/

Contains UI screens for various parts of the application.

Example:

CategoriesScreen.dart: Displays the categories and search bar.

BooksScreen.dart: Displays the books in a list format.

BookDetailsScreen.dart: Displays detailed information about a selected book.

4. widgets/

Contains reusable UI components.

Example:

CategoryGridItem.dart: UI for individual category items.

BookItem.dart: UI for individual book items in the list.

5. services/

Contains logic to interact with external APIs.

Example:

GutendexService.dart: Handles API calls to fetch book data based on categories or search queries.

Design Choices:-

Themeing and Styling:

The app uses ThemeData with Material 3 and a custom dark theme derived from a seed color.

Fonts are styled using GoogleFonts.latoTextTheme() for a clean and modern look.

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

Modularity:

Each feature is encapsulated in its own widget or screen, making the application easier to debug and extend.

State Management:

Screens use local state (StatefulWidget) where necessary, with methods for asynchronous data fetching and UI updates.

Responsiveness:

Layouts adapt to different screen sizes using Flutter’s built-in GridView and ListView widgets.

API Integration:

The GutendexService class handles API integration, ensuring a clear separation of concerns between data fetching and UI rendering.

Credits :-

- API Used: Gutenberg Project API (Gutendex)

- Developed Using: Flutter, Dart

