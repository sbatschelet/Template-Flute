#! perl
#
# Testing using the same iterator within a container.

use strict;
use warnings;
use Test::More tests => 1;
use Template::Flute;

my ($spec, $html, $flute, $out);

$spec = q{<specification>
<container name="exists-1" value="exists" class="show-me"/>
<value name="value_1" class="value-1" iterator="value_1"/>
<value name="value_1_target" class="value-1-target" iterator="value_1" target="id"/>
</specification>
};

$html = q{<div class="show-me">
<div class="value-1"></div>
<div class="value-1-target" id=""></div>
</div>};

$flute = Template::Flute->new(specification => $spec,
                  template => "<html>$html</html>",
                  values => { exists => '1', value_1 => 'test' },
);

$out = $flute->process();

ok ($out !~  m%<html><head></head><body><div class="show-me"><div class="value-1">3.1</div><div class="value-1-target" id="test"></div></div></body></html>%, "Using same value in container: $out.");

