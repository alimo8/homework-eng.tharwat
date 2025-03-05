// 4. Weather Report:
// Use Map and List to create a program that stores weather data for different cities (temperature,
// humidity, etc.). Write a function that can retrieve and print weather details using a city name.

void main() {
  Map<String, Map<String, dynamic>> weatherData = {
    'Cairo': {'temperature': 35, 'humidity': 40},
    'London': {'temperature': 18, 'humidity': 70},
    'New York': {'temperature': 25, 'humidity': 60},
  };

  void getWeatherDetails(String city) {
    if (weatherData.containsKey(city)) {
      print('Weather in $city:');
      print('Temperature: ${weatherData[city]!['temperature']}°C');
      print('Humidity: ${weatherData[city]!['humidity']}%');
    } else {
      print('Weather data for $city is not available.');
    }
  }

  getWeatherDetails('Cairo');
  getWeatherDetails('London');
  getWeatherDetails('Paris');
}
