width = 40;
height = 30;
screwhole_dia = 3; // m3 screw
screw_off = (screwhole_dia / 2) + 0.4;

translate([-width/2, -height/2, 0]) {
    difference() {
        union() {
            cube([width, height, 1]);
            screwed_standoff(width / 4, height / 4);
            screwed_standoff(width / 4, height - height / 4);
            screwed_standoff(width - width / 4, height - height / 4);
            screwed_standoff(width - width / 4, height / 4);
        }
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
        translate([width / 2, height/ 2, 0]) {
            linear_extrude(height = 10) {
                text("2018 leadedsolder.com", 1.5, halign="center", valign="center");
            }
        }
        
        // screw holes in the standoffs
        translate([width / 4, height / 4, 0]) {
            cylinder(h = 100, r = screwhole_dia / 2, center = true, $fn = 100);
        }
        translate([width - width / 4, height / 4, 0]) {
            cylinder(h = 100, r = screwhole_dia / 2, center = true, $fn = 100);
        }
        translate([width / 4, height - height / 4, 0]) {
            cylinder(h = 100, r = screwhole_dia / 2, center = true, $fn = 100);
        }
        translate([width - width / 4, height - height / 4, 0]) {
            cylinder(h = 100, r = screwhole_dia / 2, center = true, $fn = 100);
        }
    }
}

module screwed_standoff(x, y) {
    translate([x, y, 0]) {
        scale([0.35, 0.35, 0.35]) {
            screwstandoff();
        }
    }
}

module screwstandoff() {
    difference() {
        // pyramid first
        polyhedron(
            points=[
                [10, 10, 0], [10, -10, 0], [-10, -10, 0], [-10, 10, 0],
                [0, 0, 10]
            ],
            faces =[
                [0, 1, 4], [1, 2, 4], [2, 3, 4], [3, 0, 4], [1, 0, 3], [2, 1, 3] ]
        );
        // chop off the tip
        translate([-5, -5, 5]) { // net rise of 50%
            cube([10, 10, 10]);
        }
        // let them put a screw hole through it in 'their' scale
    }
}

    