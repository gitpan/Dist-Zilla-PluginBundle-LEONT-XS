
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Plugins LeonT uses for XS modules",
  "dist_author" => [
    "Leon Timmermans <leont\@cpan.org>"
  ],
  "dist_name" => "Dist-Zilla-PluginBundle-LEONT-XS",
  "dist_version" => "0.002",
  "license" => "perl",
  "module_name" => "Dist::Zilla::PluginBundle::LEONT::XS",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dist::Zilla" => 0,
    "Dist::Zilla::Plugin::Meta::Dynamic::Config" => 0,
    "Dist::Zilla::Plugin::ModuleBuild" => 0,
    "Dist::Zilla::Plugin::ModuleBuild::Custom" => 0,
    "Dist::Zilla::PluginBundle::Basic" => 0,
    "Dist::Zilla::PluginBundle::Filter" => 0,
    "Dist::Zilla::PluginBundle::LEONT::Base" => "0.003",
    "Dist::Zilla::Role::PluginBundle::Easy" => 0,
    "Moose" => 0,
    "perl" => "5.006"
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
