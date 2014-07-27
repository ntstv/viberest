module restapi.restapi;

import vibe.d;

import restapi.data;

interface OpenWeather
{
	Weather getWeather(string q);
}


class OpenWeatherImpl:OpenWeather
{
	Weather getWeather(string q)
	{
		auto client = new RestInterfaceClient!OpenWeather("http://api.openweathermap.org/data/2.5/");
	
		return client.getWeather(q);
	}
}
