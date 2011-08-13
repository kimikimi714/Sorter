package test::Sorter;
BEGIN {
push(@INC, '../lib');
}
use strict;
use warnings;
use base qw(Test::Class);
use Test::More;
use Sorter;

sub init : Test(1) {
    new_ok 'Sorter'; #test1つ目 Sorterモジュールが読み込めているかの確認
}

sub values : Tests { # valuesサブルーチンを「 : Tests」でテストにかける
    my $sorter = Sorter->new; #Sorterモジュールのサブルーチンnewの呼び出し
    is_deeply [$sorter->get_values], []; #13番目

    $sorter->set_values;
    is_deeply [$sorter->get_values], []; #14番目

    $sorter->set_values(1);
    is_deeply [$sorter->get_values], [1]; #15番目

    $sorter->set_values(1,2,3,4,5);
    is_deeply [$sorter->get_values], [1,2,3,4,5]; #16番目
}

sub sort : Tests { # sortサブルーチンを「 : Tests」でテストにかける
    my $sorter = Sorter->new;
    $sorter->sort;
    is_deeply [$sorter->get_values], []; #2番目

    $sorter->set_values(1);
    $sorter->sort;
    is_deeply [$sorter->get_values], [1]; #3番目

    $sorter->set_values(5,4,3,2,1);
    $sorter->sort;
    is_deeply [$sorter->get_values], [1,2,3,4,5]; #4番目

    $sorter->set_values(-1,-2,-3,-4,-5);
    $sorter->sort;
    is_deeply [$sorter->get_values], [-5,-4,-3,-2,-1]; #5番目

    $sorter->set_values(1,2,3,4,5);
    $sorter->sort;
    is_deeply [$sorter->get_values], [1,2,3,4,5]; #6番目

    $sorter->set_values(5,5,4,4,4,3,2,1);
    $sorter->sort;
    is_deeply [$sorter->get_values], [1,2,3,4,4,4,5,5]; #7番目

    for (0..4) {
        my @random_values = ();
        push(@random_values, int(rand() * 100) - 50)  for 0..99;
        $sorter->set_values(@random_values);
        $sorter->sort;
        is_deeply [$sorter->get_values], [sort { $a <=> $b } @random_values]; #8から12番目
    }
}

__PACKAGE__->runtests; # テストがいくつ通ったかを出力

1;
