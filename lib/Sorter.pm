# implement this
package Sorter;

use strict;
use warnings;

sub new{
   my $class = shift;
   my $self = {
       array => []
   };
   return bless $self, $class;
}

sub set_values{
    my $self = shift;
	@{ $self->{array} } = @_;
}

sub get_values{
    my $self = shift;
    @{ $self->{array} };
}

sub sort{
    my $self = shift;
    if ( @{ $self->{array} } == 0 ) { return; }
    $self->Qsort( 0, @{ $self->{array} } - 1);
}

sub Qsort{
	my ( $self, $left, $right ) = @_;
	$right = 0 if $right < 0;
	my $array  = $self->{array};

	my ( $i, $j ) = ( $left, $right );
	my $pivot = $array->[ int( ( $left + $right ) /2 ) ];

	while(1){
		while ( $array->[ $i ] < $pivot ){ $i++; }
		while ( $pivot < $array->[ $j ] ){ $j--; }
		
		if( $j <= $i ) { last;}
		
		( $array->[ $i ], $array->[ $j ] ) = ( $array->[ $j ], $array->[ $i ] );
		
		$i++; $j--;
	}
	if( $left < $i-1 ) { $self->Qsort( $left, $i-1 ); }
	if( $j+1 < $right ) { $self->Qsort( $j+1, $right ); }
}

1; # DO NOT FORGET THIS!!
