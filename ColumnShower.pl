#!perl
print"$ARGV[0]\t$ARGV[1]\n";
if($ARGV[1]==0){
	$sep=" ";
}
elsif($ARGV[1]==1){
	$sep="\t";
}
elsif($ARGV[1]==2){
	$sep=";";
}
elsif($ARGV[1]==3){
	$sep=",";
}
else{
die"bye\n";
}
for($i=2;$i<length(@ARGV);$i++){
	open(ACT, $ARGV[$i]) or die"abriendo\n";
	@act=<ACT>;
	close(ACT);
	print"abriendo: $ARGV[$i]\n";
	foreach $linea (@act){
		@li=split($sep,$linea);
		if($ARGV[0]<=length(@li)){
			print "$li[$ARGV[0]]\n";
		}
		else{
			next;
		}
	}
}

