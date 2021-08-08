use Cwd;
$dir=getcwd;
$instruccion=" ";
while($instruccion){
	#system('pwd');
	print"$dir:# ";
	$instruccion=<STDIN>;
	if($instruccion=~/^subs$/i){&ls}
	elsif($instruccion=~/^salir$/i){&bye}
	elsif($instruccion=~/^suma (\d+) (\d+)/i){&suma($1,$2)}
	elsif($instruccion=~/^(\d+) (\+|-|\*|\/|\^) (\d+)/i){&ope($1,$2,$3)}
	elsif($instruccion=~/^lista$/i){&lista}
	else{
		chomp($instruccion);
		warn"$instruccion : comando desconocido\n";}

}
sub ls{
	print"subrutina\n";
}
sub bye{
	die"Proceso terminado\n";
}
sub suma{
	$sum=$_[0]+$_[1];
	print"$sum\n";
}
sub lista{
	system('ls');
}
sub ope{
	if($_[1] eq '+'){
		$cos=$_[0]+$_[2];
	}
	elsif($_[1] eq '-'){
		$cos=$_[0]-$_[2];
	}
	elsif($_[1] eq '*'){
		$cos=$_[0]*$_[2];
	}
	elsif($_[1] eq '/'){
		$cos=$_[0]/$_[2];
	}
	elsif($_[1] eq '^'){
		$cos=$_[0]**$_[2];
	}
	print"$cos\n";
}


