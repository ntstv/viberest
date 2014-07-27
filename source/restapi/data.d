module restapi.data;

import util;

import vibe.d;

struct Weather
{
	@Label("City identification")
	long id;
	
	@Label("Data receiving time, unix time, GMT")
	ulong dt;
	
	@Label("City name")
	string name;
	
	WCoord coord;
	
	WSys sys;
	
	WMain main;
	
	WWind wind;
	
	WClouds clouds;
	
	//@optional()
	//WConditions[] weather;
	
	@optional()
	WRain rain;
	
	@optional()
	WSnow snow;
}

struct WCoord
{
	@Label("City geo location, lat")
	double lat;
	
	@Label("City geo location, lon")
	double lon;
}

struct WSys
{
	@Label("System parameter, do not use it")
	double message;
	
	@Label("Country (GB, JP etc.)")
	string country;
	
	@Label("Sunrise time, unix, UTC")
	ulong sunrise;
	
	@Label("Sunset time, unix, UTC")
	ulong sunset;
}

struct WMain
{
	@Label("Temperature, Kelvin (subtract 273.15 to convert to Celsius)")
	double temp;
	
	@Label("Humidity, %")
	double humidity;
	
	@Label("Minimum temperature at the moment. This is deviation from current temp that is possible for large cities and megalopolises geographically expanded (use these parameter optionally)")
	double temp_min;

	@Label("Maximum temperature at the moment. This is deviation from current temp that is possible for large cities and megalopolises geographically expanded (use these parameter optionally)")
	double temp_max;
	
	@Label("Atmospheric pressure, hPa ")
	double pressure;
	
	@Label("Atmospheric pressure on the sea level, hPa") @optional()
	double sea_level;
	
	@Label("Atmospheric pressure on the ground level, hPa") @optional()
	double grnd_level;	
}

struct WWind
{
	@Label("Wind speed, mps")
	double speed;
	
	@Label("Wind direction, degrees (meteorological)")
	double deg;
	
	@Label("Wind gust, mps") @optional()
	double gust;
}

struct WClouds
{
	@Label("Cloudiness, %")
	double all;
}

struct WConditions
{
	@Label("Weather condition id")
	long id;
	
	@Label("Group of weather parameters (Rain, Snow, Extreme etc.)")
	Weather main;
	
	@Label("Weather condition within the group")
	string description;
	
	@Label("Weather icon id")
	string icon;
}

struct WRain
{
	@Label("Precipitation volume for last 3 hours, mm") @optional()
	double _3h;
	
}

struct WSnow
{
	@Label("Snow volume for last 3 hours, mm") @optional()
	double _3h;
}