// Beagle-V case
// Kieran Bingham <kieran.bingham@ideasonboard.com>

// roundedcube sourced from : https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;

// Provide the dimensions of the base board to fit
module baseplate(width, length, height, radius, margin) {
    difference() {
        // Outer shell
        roundedcube([width+margin*2, length+margin*2, height+margin],
                    radius=radius, apply_to="zmin");

        // Inner cutout
        translate([margin, margin, margin])
            roundedcube([width, length, height+margin*3], radius=radius);
    }
}


margin = 0.6;
radius = 2.5;
height = 5;

difference() {
    baseplate(85.0, 70.5, height, radius, margin);

    // SD card hole
    sdWidth=14.0;
    sdHeight=2.5;
    sdY = 27.8 + margin;
    sdZ = 2.5 + margin;
    translate([-0.01,sdY,sdZ]) cube([margin*3, sdWidth, sdHeight+0.01]);
}