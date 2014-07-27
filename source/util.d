module util;

import std.traits;
import std.conv;

struct Label
{
	string text;
}

struct A
{
	string name;
	
	string value;
	
	string label;
}

string getLabel(alias ST, alias mem)()
{
		
	foreach (attr; __traits(getAttributes, __traits(getMember,ST,mem)))
	{
		if (is(typeof(attr) == Label))
		{
			return attr.text;
		}
	}
	
	return "";

}

A[] respond(ST)(ST st)
{
	A[] ret = new A[0];
	
	foreach(mem; __traits(derivedMembers, ST))
	{
		static if(is(typeof(__traits(getMember,ST,mem)) == struct))
		{
			ret ~= A(mem,"","");
			
			ret ~= respond!(typeof(__traits(getMember,ST,mem)))(__traits(getMember,st, mem));
		}
		else
		{
			ret ~= A(mem, to!string(__traits(getMember,st, mem)), getLabel!(ST,mem) ); 
		}
	}
	
	return ret;
	
}