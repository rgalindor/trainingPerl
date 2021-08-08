
open(RED,$ARGV[0])or die "No se abrio la red\n";
@red=<RED>;
close(RED);

foreach $conex(@red){
	chomp($conex);
	@inte=split("\t",$conex);
	$arhijo{$inte[0]}=$inte[1];
	$arpadre{$inte[1]}=$inte[0];
}

$antiguo=scalar(@red);
for($i=0;$i<scalar(@red);$i++){
	$j=scalar(keys(%arhijo));
	print "it $i  escalar $j\n";
	if(($j==1)||($j==0)){
		print"No se han encontrado ciclos\n";
		last;
	}
	foreach $hijo(keys(%arhijo)){
		#print"$hijo - > $arhijo{$hijo}\t";
		$flag=0;
#		foreach $padre(keys(%arpadre)){
#			print"$hijo  $padre\t";
#			if($hijo eq $padre){
#				$flag=1;
#				last;
#			}
#		}
		foreach $padre(keys(%arpadre)){
			if($padre eq $hijo){
				$flag=1;
				last;
			}
		}
		print"$hijo\t\$flag = $flag\n";
		if($flag==0){
			$scal=scalar(keys(%arhijo));
			print"$scal\t";
			delete($arhijo{$hijo});
			foreach $k(keys(%arpadre)){
				if($arpadre{$k} eq $hijo){
					delete($arpadre{$k});
				}			
			}
			#delete($arpadre{$padre});
			$scal=scalar(keys(%arhijo));
			print"se ha borrado\t$scal\n";
		}
	print"\n";
	}
	$actual=scalar(keys(%arhijo));	
	if(($actual==$antiguo)&&($actual>1)){
		print"Hay ciclos\t$actual\t$antiguo\n";
		last;
	}
	elsif($actual!=$antiguo){
		$antiguo=$actual;
	}
}
