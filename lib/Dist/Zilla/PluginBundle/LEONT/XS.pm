package Dist::Zilla::PluginBundle::LEONT::XS;
{
  $Dist::Zilla::PluginBundle::LEONT::XS::VERSION = '0.003';
}
use Moose;
use Dist::Zilla;
extends 'Dist::Zilla::PluginBundle::LEONT::Base';
with qw/Dist::Zilla::Role::PluginBundle::Easy Dist::Zilla::Role::PluginBundle::Config::Slicer/;

has use_modern => (
	is => 'ro',
	isa => 'Bool',
	default => 0,
);

my @basic = qw/GatherDir PruneCruft ManifestSkip MetaYAML License Readme ExtraTests ExecDir ShareDir Manifest TestRelease ConfirmRelease UploadToCPAN/; # left out MakeMaker

sub configure {
	my $self = shift;

	$self->add_plugins(@basic);

	if ($self->payload->{use_custom}) {
		$self->add_plugins('ModuleBuild::Custom');
		$self->add_plugins('Meta::Dynamic::Config');
	}
	else {
		$self->add_plugins('ModuleBuild');
	}
	$self->SUPER::configure;
	return;
}

1;



=pod

=head1 NAME

Dist::Zilla::PluginBundle::LEONT::XS

=head1 VERSION

version 0.003

=head1 DESCRIPTION

This is currently identical to the following setup:

    [@Filter]
    -bundle = @Basic
    -remove = MakeMaker
    [ModuleBuild]
    [@LEONT::Base]

Unless the C<use_custom> option is set in dist.ini, in which case it's equal to 

    [@Filter]
    -bundle = @Basic
    -remove = MakeMaker
    [ModuleBuild::Custom]
    [Meta::Dynamic::Config]
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


