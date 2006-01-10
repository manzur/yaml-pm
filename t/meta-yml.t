use t::TestYAML tests => 1;

my $node_from_yaml = LoadFile('./META.yml');
my $node_from_perl = eval(join '', <DATA>);
die $@ if $@;

$node_from_yaml->{version} =
$node_from_perl->{version} =
$YAML::VERSION;

is_deeply $node_from_yaml, $node_from_perl,
    'Make sure we can load META.yml files used by CPAN';

__DATA__
{
  'no_index' => {
                  'directory' => [
                                   'inc'
                                 ]
                },
  'generated_by' => 'Module::Install version 0.47',
  'distribution_type' => 'module',
  'version' => '0.49_70',
  'name' => 'YAML',
  'author' => 'Ingy döt Net <ingy@cpan.org>',
  'license' => 'perl',
  'requires' => {
                  'Test::Base' => '0.45',
                  'Test::More' => '0.62',
                  'perl' => '5.6.1',
                  'Spiffy' => '0.25'
                },
  'abstract' => 'YAML Ain\'t Markup Language (tm)'
};
