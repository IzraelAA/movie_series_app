Great! Below is the updated README file with your GitHub repository link included.

---

# Movie/Series Listing Application

This Flutter application displays a list of movies/series fetched from an API. It allows users to filter the list by category and search for specific titles. The application uses BLoC for state management and follows clean architecture principles.

## Features

1. **Display List of Movies/Series:**
    - Fetch movie/series data from an API endpoint.
    - Display the fetched data in a list format.

2. **Filter by Rating:**
    - Implement a scrollable container to filter the list by rating categories (e.g., Bad, Good, Recommend).

3. **Search Feature:**
    - Implement a search bar to allow users to search for movies/series by title.


## API Endpoint

- **API Key:** `b031ecd04177e1c9aae4efcb44b3f301`
- **Endpoint:**
  ```
  https://api.themoviedb.org/3/discover/movie?api_key=b031ecd04177e1c9aae4efcb44b3f301&include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc
  ```

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Comes with Flutter installation

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/IzraelAA/movie_series_app.git
   cd movie_series_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

## Project Structure

```plaintext
lib/
├── data/
│   ├── data_sources/
│   │   └── movie_remote_data_source.dart
│   ├── models/
│   │   └── movie_model.dart
│   ├── repositories/
│   │   └── movie_repository_impl.dart
├── domain/
│   ├── entities/
│   │   └── movie.dart
│   ├── repositories/
│   │   └── movie_repository.dart
│   ├── use_cases/
│   │   └── get_movies.dart
├── presentation/
│   ├── blocs/
│   │   ├── movie/
│   │   │   ├── movie_bloc.dart
│   │   │   ├── movie_event.dart
│   │   │   └── movie_state.dart
│   ├── pages/
│   │   └── movie_list_page.dart
│   ├── widgets/
│   │   ├── movie_list_item.dart
│   │   └── category_filter.dart
├── main.dart
```

## Usage

### Fetching Data

The application fetches movie data from the provided API endpoint using an HTTP request. The data is then displayed in a list format.

### Filtering by Rating

The `CategoryFilter` widget allows users to filter movies based on predefined rating categories. The selected category highlights and filters the list accordingly.

### Searching

Users can search for specific movie titles using the search bar in the AppBar. The search functionality filters the displayed list based on the input text.

## Code Quality

- **Clean Architecture:** The project follows clean architecture principles, separating concerns into different layers.
- **State Management:** The application uses BLoC for managing states efficiently.
- **Responsive UI:** The UI is responsive and adapts to different screen sizes.

## Error Handling

The application handles loading, empty, and error states gracefully, providing appropriate feedback to the user.

## Contributions

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
