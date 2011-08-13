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
    new_ok 'Sorter'; #test1�� Sorter���W���[�����ǂݍ��߂Ă��邩�̊m�F
}

sub values : Tests { # values�T�u���[�`�����u : Tests�v�Ńe�X�g�ɂ�����
    my $sorter = Sorter->new; #Sorter���W���[���̃T�u���[�`��new�̌Ăяo��
    is_deeply [$sorter->get_values], []; #13�Ԗ�

    $sorter->set_values;
    is_deeply [$sorter->get_values], []; #14�Ԗ�

    $sorter->set_values(1);
    is_deeply [$sorter->get_values], [1]; #15�Ԗ�

    $sorter->set_values(1,2,3,4,5);
    is_deeply [$sorter->get_values], [1,2,3,4,5]; #16�Ԗ�
}

sub sort : Tests { # sort�T�u���[�`�����u : Tests�v�Ńe�X�g�ɂ�����
    my $sorter = Sorter->new;
    $sorter->sort;
    is_deeply [$sorter->get_values], []; #2�Ԗ�

    $sorter->set_values(1);
    $sorter->sort;
    is_deeply [$sorter->get_values], [1]; #3�Ԗ�

    $sorter->set_values(5,4,3,2,1);
    $sorter->sort;
    is_deeply [$sorter->get_values], [1,2,3,4,5]; #4�Ԗ�

    $sorter->set_values(-1,-2,-3,-4,-5);
    $sorter->sort;
    is_deeply [$sorter->get_values], [-5,-4,-3,-2,-1]; #5�Ԗ�

    $sorter->set_values(1,2,3,4,5);
    $sorter->sort;
    is_deeply [$sorter->get_values], [1,2,3,4,5]; #6�Ԗ�

    $sorter->set_values(5,5,4,4,4,3,2,1);
    $sorter->sort;
    is_deeply [$sorter->get_values], [1,2,3,4,4,4,5,5]; #7�Ԗ�

    for (0..4) {
        my @random_values = ();
        push(@random_values, int(rand() * 100) - 50)  for 0..99;
        $sorter->set_values(@random_values);
        $sorter->sort;
        is_deeply [$sorter->get_values], [sort { $a <=> $b } @random_values]; #8����12�Ԗ�
    }
}

__PACKAGE__->runtests; # �e�X�g�������ʂ��������o��

1;
