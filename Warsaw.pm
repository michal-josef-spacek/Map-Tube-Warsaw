package Map::Tube::Warsaw;

# Pragmas.
use strict;
use warnings;
use 5.006;

# Modules.
use File::Share ':all';
use Moo;
use namespace::clean;

# Version.
our $VERSION = 0.02;

# Get XML.
has xml => (
	'is' => 'ro',
	'default' => sub {
		return dist_file('Map-Tube-Warsaw', 'warsaw-map.xml');
	},
);

with 'Map::Tube';

1;

__END__

=encoding utf8

=head1 NAME

Map::Tube::Warsaw - Interface to the Warsaw Tube Map.

=head1 SYNOPSIS

 use Map::Tube::Warsaw;
 my $obj = Map::Tube::Warsaw->new;
 my $routes_ar = $obj->get_all_routes($from, $to);
 my $station = $obj->get_node_by_id($station_id);
 my $station = $obj->get_node_by_name($station_name);
 my $route = $obj->get_shortest_route($from, $to);
 my $metro_name = $obj->name;
 my $xml_file = $obj->xml;

=head1 DESCRIPTION

It currently provides functionality to find the shortest route between the two
given nodes.

For more information about Warsaw Map, click L<here|https://en.wikipedia.org/wiki/Warsaw_Metro>.

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<get_all_routes($from, $to)> [EXPERIMENTAL]

 Get all routes from station to station.
 Returns reference to array with Map::Tube::Route objects.

=item C<get_node_by_id($station_id)>

 Get station node by id.
 Returns Map::Tube::Node object.

=item C<get_node_by_name($station_name)>

 Get station node by name.
 Returns Map::Tube::Node object.

=item C<get_shortest_route($from, $to)>

 Get shortest route between $from and $to node names. Node names in $from and $to are case insensitive. 
 Returns Map::Tube::Route object.

=item C<name()>

 Get metro name.
 Returns string with metro name.

=item C<xml()>

 Get XML specification of Warsaw metro.
 Returns string with XML.

=back

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Encode qw(decode_utf8 encode_utf8);
 use Map::Tube::Warsaw;

 # Object.
 my $obj = Map::Tube::Warsaw->new;

 # Get route.
 my $route = $obj->get_shortest_route(decode_utf8('Imielin'), decode_utf8('Świętokrzyska'));

 # Print out type.
 print "Route: ".encode_utf8($route)."\n";

 # Output:
 # Route: Imielin (Linia M1), Stokłosy (Linia M1), Ursynów (Linia M1), Służew (Linia M1), Wilanowska (Linia M1), Wierzbno (Linia M1), Racławicka (Linia M1), Pole Mokotowskie (Linia M1), Politechnika (Linia M1), Centrum (Linia M1), Świętokrzyska (Linia M1)

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use utf8;
 use warnings;

 # Modules.
 use Map::Tube::Warsaw;

 # Object.
 my $obj = Map::Tube::Warsaw->new;

 # Get XML file.
 my $xml_file = $obj->xml;

 # Print out XML file.
 print "XML file: $xml_file\n";

 # Output like:
 # XML file: .*/warsaw-map.xml

=head1 DEPENDENCIES

L<File::Share>,
L<Map::Tube>,
L<Moo>,
L<namespace::clean>.

=head1 SEE ALSO

L<Map::Tube>,
L<Map::Tube::Barcelona>,
L<Map::Tube::Berlin>,
L<Map::Tube::Delhi>,
L<Map::Tube::London>,
L<Map::Tube::Minsk>,
L<Map::Tube::NYC>,
L<Map::Tube::Prague>,
L<Map::Tube::Sofia>,
L<Map::Tube::Tokyo>.

=head1 REPOSITORY

L<https://github.com/Manwar/Map-Tube-Warsaw>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © Michal Špaček 2014
 Artistic License
 BSD 2-Clause License

=head1 VERSION

0.02

=cut
