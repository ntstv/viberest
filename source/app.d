module app;

import std.string;

import vibe.d;

import restapi.restapi;
import restapi.data;

import util;

void main(string[] args)
{	
	init();
	
	lowerPrivileges();

	runEventLoop();
}

private HTTPServerSettings setupSettings()
{
	auto settings = new HTTPServerSettings;
	
	settings.bindAddresses = ["127.0.0.1"];
	
	settings.port = 80;
	
	return settings;
}

private URLRouter setupRouter()
{
	auto router = new URLRouter;
	
	router.get("*", serveStaticFiles("./public/"));
	
	router.get("/", &index);
	
	router.registerRestInterface(new OpenWeatherImpl);
	
	return router;
}

private void init()
{
	listenHTTP(setupSettings, setupRouter);
}

void index(HTTPServerRequest req, HTTPServerResponse res)
{
	auto client = new RestInterfaceClient!OpenWeather("http://api.openweathermap.org/data/2.5/");
	
	auto weather = client.getWeather("Moscow");
	
	string result = "<html>";
	
	foreach(each; respond(weather))
	{
		auto writer = res.bodyWriter();
		
		if (!each.label.empty)
		{
			result ~=format("<b>%s</b>:<br/>\"%s\" = %s<br/>", each.label, each.name, each.value);
		}
		else
		{
			result ~= format("<i>%s</i><br/>", each.name);
		}
	}
	
	result ~= "</html>";
	
	res.writeBody(result);
}