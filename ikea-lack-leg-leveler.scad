use <lib/threads-scad/threads.scad>;

$fn=50;

// IKEA Lack table leg footprint is 50x50 mm
leg_side = 50;

// how "tall" the leveler should be - the actual adjust range is somewhat less
adjust_range = 20;

// diameter of the screw thread
screw_diam = 25;



// NUT
hole_pos = sqrt(pow((sqrt(2*leg_side*leg_side)-screw_diam)/4, 2)/2);
difference() {
  cube([leg_side, leg_side, adjust_range]);
  ScrewHole(screw_diam, adjust_range, position=[leg_side/2, leg_side/2, 0]);
  
  translate([hole_pos, hole_pos, 0]) {
    translate([0, 0, -1]) cylinder(adjust_range+2, d=5);
    translate([0, 0, 3]) cylinder(adjust_range, d=11);
  }
  
  translate([leg_side-hole_pos, hole_pos, 0]) {
    translate([0, 0, -1]) cylinder(adjust_range+2, d=5);
    translate([0, 0, 3]) cylinder(adjust_range, d=11);
  }
  
  translate([hole_pos, leg_side-hole_pos, 0]) {
    translate([0, 0, -1]) cylinder(adjust_range+2, d=5);
    translate([0, 0, 3]) cylinder(adjust_range, d=11);
  }
  
  translate([leg_side-hole_pos, leg_side-hole_pos, 0]) {
    translate([0, 0, -1]) cylinder(adjust_range+2, d=5);
    translate([0, 0, 3]) cylinder(adjust_range, d=11);
  }
}



// BOLT
translate([leg_side*1.6, leg_side/2, 0]) {
  difference() {
    cylinder(10, d=leg_side);
    
  }
  translate([0, 0, 10]) ScrewThread(screw_diam, adjust_range);
}