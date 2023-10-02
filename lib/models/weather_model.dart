class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;
  final double wind;
  final double humididty;
  final List hoursWeather;
  final double visibility;
  final List nextDays;

  WeatherModel(
      {required this.cityName,
      required this.nextDays,
      required this.humididty,
      required this.hoursWeather,
      required this.visibility,
      required this.wind,
      required this.date,
      this.image,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json /*primary map*/) {
    //named constructor
    return WeatherModel(
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        cityName: json["location"]["name"],
        date: DateTime.parse(json["current"]["last_updated"]),
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]
            ['text'],
        wind: json["forecast"]["forecastday"][0]["day"]["maxwind_kph"],
        humididty: json["forecast"]["forecastday"][0]["day"]["avghumidity"],
        visibility: json["forecast"]["forecastday"][0]["day"]["avgvis_km"],
        hoursWeather: json["forecast"]["forecastday"][0]["hour"],
        nextDays:  json["forecast"]["forecastday"]
        );
  }
}
