# # News App

This is a Flutter-based news app that allows users to stay updated with the latest news in various categories such as business, sports, and science. The app utilizes an API to fetch news data and presents it in a user-friendly layout.

## Features

- **Multiple Categories**: The app provides news articles in different categories, including business, sports, and science, allowing users to browse news based on their interests.

- **Real-time Updates**: The news articles are fetched from a reliable API, ensuring that users receive the most up-to-date information.

- **Search Functionality**: Users can search for specific news articles using keywords, making it easy to find relevant information.

- **Dark Mode Support**: The app offers a dark mode option, providing a visually comfortable reading experience in low-light environments.

## Architecture

The app follows the Cubit architecture pattern, which separates the business logic from the UI. It utilizes the Flutter Bloc package to manage the app's state and handle user interactions efficiently.

The key components of the app's architecture are:

- **Cubits**: The app implements different Cubits to handle specific functionalities such as fetching news data, managing the theme mode, and handling navigation.

- **API Integration**: The app integrates with a news API using the Dio package to retrieve news articles based on different categories and search queries.

- **Local Cache**: The app utilizes the CacheHelper class to store and retrieve data locally, allowing for optimized performance and offline access to previously fetched news articles.

## Getting Started

To run the app locally, follow these steps:

1. Ensure that you have Flutter and Dart SDK installed on your machine.

2. Clone this repository to your local machine using the following command:
   ```
   git clone <repository-url>
   ```

3. Navigate to the project directory and install the required dependencies by running:
   ```
   flutter pub get
   ```

4. Update the API key in the `news_cubit.dart` file with your own API key. You can obtain an API key from the news API provider.

5. Run the app on an emulator or a connected device using the following command:
   ```
   flutter run
   ```


## License

This project is licensed under the [MIT License](LICENSE). Feel free to modify and use the code according to your needs.

## Acknowledgements

- The app utilizes the [Dio](https://pub.dev/packages/dio) package for making network requests.
- The [Flutter Bloc](https://pub.dev/packages/flutter_bloc) package is used for managing the app's state.
- The [Hexcolor](https://pub.dev/packages/hexcolor) package is used for handling color conversions.
- Special thanks to the creators of the news API used in this app for providing reliable news data.

## Screenshots

![Screenshot 1](https://github.com/MostafaRadian/News-App/assets/46004434/1267b761-256e-48fb-9bef-413476415289)![Screenshot 2](https://github.com/MostafaRadian/News-App/assets/46004434/990625fa-c313-41ed-9492-b2d49f160141)![Screenshot 3](https://github.com/MostafaRadian/News-App/assets/46004434/67ef0fc7-76fc-4af0-ad27-173a4950f1ed)![Screenshot 4](https://github.com/MostafaRadian/News-App/assets/46004434/bb31620a-f502-4c10-8d83-5348d0036bf3)![Screenshot 5](https://github.com/MostafaRadian/News-App/assets/46004434/918335ee-f4b6-4f6e-968e-8874e482a3e8)![Screenshot 6](https://github.com/MostafaRadian/News-App/assets/46004434/cbe89798-4c96-43bd-82aa-5299385e209a)*Note: The screenshots are for illustrative purposes and may not represent the actual news articles displayed in the app.*
