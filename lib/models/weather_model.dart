class WeatherModel {
  final String cityName;
  final String date;
  final String? image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json /*primary map*/) {
    //named constructor
    return WeatherModel(
      image:  json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        cityName: json["location"]["name"],
        date: json["current"]["last_updated"],
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]['text']);
  }
}
