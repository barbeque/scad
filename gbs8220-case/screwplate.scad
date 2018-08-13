width = 40;
height = 30;
screwhole_dia = 3; // m3 screw
screw_off = (screwhole_dia / 2) + 0.4;

translate([-width/2, -height/2, 0]) {
    difference() {
        cube([width, height, 1]);
        translate([screw_off, screw_off, 0]) {
            cylinder(h = 10, r = screwhole_dia/2, center = true, $fn = 100);
        }
        translate([screw_off, height - screw_off, 0]) {
            cylinder(h = 10, r = screwhole_dia/2, center = true, $fn = 100);
        }
        translate([width - screw_off, screw_off, 0]) {
            cylinder(h = 10, r = screwhole_dia/2, center = true, $fn = 100);
        }
        translate([width - screw_off, height - screw_off, 0]) {
            cylinder(h = 10, r = screwhole_dia/2, center = true, $fn = 100);
        }
    }
}