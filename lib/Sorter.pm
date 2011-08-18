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
	( @{ $self->{array} } )= @_;
}

sub get_values{
    my ( $self ) = @_; 
    @{ $self->{array} };
}

sub sort{
    my ( $self ) = @_;
    if ( @{ $self->{array} } == 0 ) { return; }
    warn "要素数-1: " . @{ $self->{array} }-1;
    $self->Qsort( 0, @{ $self->{array} }-1 );
}

sub Qsort{
	my ( $self, $left, $right ) = @_;
	my ( @array ) = ( @{ $self->{array} } );

	my $i = $left;
	warn "i: " . $i;
	$right = 0 if $right < 0;
	my $j = $right;
	warn $j;
	my $pivot = $array[ int( ( $left + $right ) /2 ) ];
	warn $array[ int( ( $left + $right ) /2 ) ];
	while(1){
		while ( $array[ $i ] < $pivot ){ $i++; }
		while ( $pivot < $array[ $j ] ){ $j--; }
		if ( $j <= $i ) { last; }
		
		( $array[ $i ], $array[ $j ] ) = ( $array[ $j ], $array[ $i ] );
		
		$i++; $j--;
	}
	if( $left < $i-1 ) { $self->Qsort( $left, $i-1 ); }
	if( $j+1 < $right ) { $self->Qsort( $j+1, $right ); }
}

1; # DO NOT FORGET THIS!!
