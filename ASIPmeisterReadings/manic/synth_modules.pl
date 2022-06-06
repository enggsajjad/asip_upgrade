#!/usr/bin/perl


while(<>){
    if(/^-ofn/){
	($ngcfile)=/-ofn (.*)\n/;
	$ngc = checkngc($ngcfile);
    }

    if(/^run/){
	print @cmds unless $ngc;
	@cmds=();	
    }

    push @cmds, $_;



}

print @cmds unless $ngc;


sub checkngc {
    my ($ngc)=@_;
    return (-r $ngc);
}
