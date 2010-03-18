#!/usr/bin/perl

use WWW::Curl::Easy;

sub checkZero
{
    $number = shift;
	if($number<10)
	{
		$zero = "0";
		return "$zero$number";
	}
	else
	{ 
		return $number;
	}
}

for($i=0; $i<11; $i++)
{
	$a = checkZero($i);
	
	for($j=1; $j<13; $j++)
	{
	$b = checkZero($j);
	my $curl = new WWW::Curl::Easy;

	$curl->setopt(CURLOPT_URL, "http://packetstormsecurity.org/$a$b-exploits/$a$b-exploits.tgz");
	open($download, ">$a$b-exploits.tgz");
	$curl->setopt(CURLOPT_WRITEDATA, $download);
	$curl->perform;
	close($download);
	undef $curl;
	}
}
