# implement this
package Sorter;

sub new{
   my $class = shift;
   my $self = {};
   @array = ();
   return bless $self,$class;
}

sub set_values{
	my $class;
	($class,@array) = @_;
}

sub get_values{
	@array;
}

sub sort{
	&Qsort(0,@array-1,@array);
}

sub Qsort{
	my $left; my $right;
	($left,$right,@array) = @_;
	
	my $i=$left;
	my $j=$right;
	my $pivot = $array[int(($left + $right) /2)];
	while(1){
		while ($array[$i] < $pivot){ $i++;}
		while ($pivot < $array[$j]){ $j--;}
		if($j <= $i){ last;}
		
		($array[$i],$array[$j])=($array[$j],$array[$i]);
		
		$i++; $j--;
	}
	if($left < $i-1) {&Qsort($left, $i-1, @array);}
	if($j+1 < $right) {&Qsort($j+1, $right, @array);}
}

1; # DO NOT FORGET THIS!!
