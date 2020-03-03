#!/usr/bin/perl

#sudo apt-get install libwww-curl-perl
use WWW::Curl::Easy;

#https://stackoverflow.com/questions/2899367/how-can-perls-print-add-a-newline-by-default
use feature qw(say);

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

for($i=0; $i<20; $i++)
{
	$a = checkZero($i);
	
	for($j=1; $j<13; $j++)
	{
	$b = checkZero($j);
	my $curl = new WWW::Curl::Easy;
	say "https://dl.packetstormsecurity.net/$a$b-exploits/$a$b-exploits.tgz";
	$curl->setopt(CURLOPT_URL, "https://dl.packetstormsecurity.net/$a$b-exploits/$a$b-exploits.tgz");
	#follow redirect, rf: http://linuxplayer.org/2011/10/libcurl-follow-location-header-only
	$curl->setopt(CURLOPT_FOLLOWLOCATION, 1);
	open($download, ">$a$b-exploits.tgz");
	$curl->setopt(CURLOPT_WRITEDATA, $download);
	$curl->perform;
	close($download);
	undef $curl;
	}
}
