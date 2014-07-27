import std.stdio;

import vibe.d;

import std.stdio;

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
	
	return router;
}

private void init()
{
	listenHTTP(setupSettings, setupRouter);
}