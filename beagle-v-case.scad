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

baseplate(84.8, 70.3, 5, 2.5, 0.6);