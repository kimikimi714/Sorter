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
    &quick_sort($self->{array}, 0, @{ $self->{array} } - 1);
}

sub quick_sort {
    my ($list, $lo, $hi) = @_;
    if ( $hi <= $lo ) {
        return;
    }

    # Pick the value at the last of the list as a pivot
    my $pivot_value = $list->[$hi];

    my $smaller_pos = $lo;
    my $larger_pos = $hi - 1; # last one taken as a pivot

    while ($smaller_pos < $larger_pos) {

        # check if the value should be swapped
        my $swap_left = $list->[$smaller_pos] >= $pivot_value? 1 : 0;
        my $swap_right = $list->[$larger_pos] < $pivot_value? 1 : 0;

        # if we found two values to be swapped, swap them.
        if ($swap_left && $swap_right) {
            &swap($list, $smaller_pos, $larger_pos);
            $swap_left = $swap_right = 0;
        }

        # if the value needs not be swapped, we move on.
        $smaller_pos++ unless $swap_left;
        $larger_pos-- unless $swap_right;
    }

    # pivot needs to be inserted at the appropriate pos.
    if ( $list->[$smaller_pos] < $pivot_value ) {
        $smaller_pos++;
    }
    &swap($list, $hi, $smaller_pos);

    # recursively apply quick_sort
    quick_sort($list, $lo, $smaller_pos - 1);
    quick_sort($list, $smaller_pos + 1, $hi);
}

# スワップ関数
# - $list[i] と $list[j] を入れ替える
# input: $i, $j
# pre: $i, $j ∈ integer and 0 ≦ $i, $j < @lst - 1,
# post: $list[i] = $list[j] and $list[j] = $list[i]
sub swap{
    my ($list, $i, $j) = @_;
    my $temp = $list->[$i];
    $list->[$i] = $list->[$j];
    $list->[$j] = $temp;
}

sub Qsort{
	my ( $self, $left, $right ) = @_;
	$right = 0 if $right < 0;
	my ( @array ) =( @{ $self->{array} } );

	my ( $i, $j ) = ( $left, $right );
#	warn "i: " . $i;
#	warn "j: " . $j;
	my $pivot = $array[ int( ( $left + $right ) /2 ) ];
#	warn "pivot: " . $pivot;
	while(1){
		while ( $array[ $i ] < $pivot ){ $i++; }
		while ( $pivot < $array[ $j ] ){ $j--; }
		
		if( $j <= $i ) { last;}
		
		( $array[ $i ], $array[ $j ] ) = ( $array[ $j ], $array[ $i ] );
		
		$i++; $j--;
	}
	if( $left < $i-1 ) { $self->Qsort( $left, $i-1 ); }
	if( $j+1 < $right ) { $self->Qsort( $j+1, $right ); }
}

1; # DO NOT FORGET THIS!!
