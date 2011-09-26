package Dist::Zilla::PluginBundle::LEONT::XS;
{
  $Dist::Zilla::PluginBundle::LEONT::XS::VERSION = '0.001';
}
use Moose;
use Dist::Zilla;
with 'Dist::Zilla::Role::PluginBundle::Easy';

has use_modern => (
	is => 'ro',
	isa => 'Bool',
	default => 0,
);

sub configure {
	my $self = shift;

	$self->add_bundle('@Filter' => {
		-bundle => '@Basic',
		-remove => ['MakeMaker'],
	});
	$self->add_plugins('ModuleBuild');
	$self->add_bundle('@LEONT::Base');
	return;
}

1;



=pod

=head1 NAME

Dist::Zilla::PluginBundle::LEONT::XS - Plugins LeonT uses for XS modules

=head1 VERSION

version 0.001

=head1 DESCRIPTION

This is currently identical to the following setup:

    [@Filter]
    -bundle = @Basic
    -remove = MakeMaker
    [ModuleBuild]
    [@LEONT::Base]

=for Pod::Coverage configure

=head1 AUTHOR

Leon Timmermans <leont@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Leon Timmermans.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

#ABSTRACT: Plugins LeonT uses for XS modules


1;
