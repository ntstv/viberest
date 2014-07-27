module restapi.restapi;

import vibe.d;

import restapi.data;

interface OpenWeather
{
	Weather getWeather(string q);
}

