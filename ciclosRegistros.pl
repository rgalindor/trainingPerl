#!perl
open(RED,$ARGV[0])or die "No se abrio la red\n";
@red=<RED>;
close(RED);
$i=0;
foreach $conex(@red){
	chomp($conex);
	$conex=~s/ /\t/;
	@inte=split("\t",$conex);
	$aristas={
		NODOP=>$inte[0],
		NODOH=>$inte[1]
	};
	push(@arista,$aristas);
}
$antiguo=scalar(@red);
for($i=0;$i<scalar(@red);$i++){
	if(($antiguo==1)||($antiguo==0)){
		print"No se han encontrado ciclos\n";
		last;
	}
	$k=0;
	foreach $conex(@arista){
		$flag=0;
		foreach $conex2(@arista){
			if($conex->{NODOP} eq $conex2->{NODOH}){
				$flag=1;
				last;
			}
		}
#		print"$k : \$flag = $flag\n";
		if($flag==0){
			splice (@arista,$k,1);
		}
		$k+=1;

	}
	$actual=scalar(@arista);
	print"$i : \$antiguo = $antiguo\t\$actual = $actual\n";
	if($actual!=$antiguo){
		$antiguo=$actual;
	}
	else{
		print"Se han encontrado ciclos\n";
		last;
	}
}
#for($i=0;$i<scalar(@arista);$i++){
$padrote=$arista[0]->{NODOP};
$hijin=$arista[0]->{NODOH};
print"$padrote -> ";
foreach $k(@arista){
	if(($k->{NODOP} eq $hijin)&&($k->{NODOH} eq $padrote)){
		print "$hijin -> $padrote\n";
	}
	elsif($k->{NODOP} eq $hijin){
		print"$hijin -> ";
		$hijin=$k->{NODOH}
	}
	
}
#}
for($i=0;$i<scalar(@arista);$i++){
print "\n\n$arista[$i]->{NODOP}\n";
$arpadre=$arista[$i];
$hij=&recorre(\$arpadre->{NODOH},\@arista);
@arhijas=@$hij;
foreach $k(@arhijas){
print"$k->{NODOP}  $k->{NODOH}\n";
}}
sub recorre{
	my($raiz, $arreglo)=@_;
	@ret=();
	foreach $reg(@$arreglo){
		if($$raiz eq $reg->{NODOP}){
			push(@ret,$reg);
		}
	}
	return(\@ret);
}

####
    %HoA = (
        flintstones    => [ "fred", "barney" ],
        jetsons        => [ "george", "jane", "elroy" ],
        simpsons       => [ "homer", "marge", "bart" ],
    );
#To add another array to the hash, you can simply say:

    $HoA{teletubbies} = [ "tinky winky", "dipsy", "laa-laa", "po" ];


####
$ari=$arista[1];     ####
#foreach $ari(@arista){
$padrote=$ari->{NODOP};
@camino=($padrote);
$hijin=$ari->{NODOH};
until($padrote eq $hijin){
	$j+=100;
	foreach $aristeo(@arista){
		$i+=1;
		print"$aristeo->{NODOP}  chacha $hijin\n";
		$camino{$i}=[$aristeo->{NODOP}];
		if($aristeo->{NODOP} eq $hijin){
			#print"";
			$hijin=$aristeo->{NODOH};
			push(@{$camino{$j.$i}}, $hijin);
		}
	}
}#}

$r=scalar(keys(%camino));
print"$r\n";
@r=keys(%camino);

foreach $ro(@r){
	print"$r0\n";
}
