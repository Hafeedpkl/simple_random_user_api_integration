class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;

  UserLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.coordinates,
      required this.timezone,
      required this.postcode,
      required this.street});
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({
    required this.number,
    required this.name,
  });
}

class LocationCoordinates {
  final String longitude;
  final String latitude;

  LocationCoordinates({required this.longitude, required this.latitude});
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({required this.offset, required this.description});
}
