/* RC Car JoyStick
 *
 * 10 units = 1mm
 */

module axis() {
  height = 115;
  diameter = 42;
  translate([0, 0, -height/2]) cylinder(h=height,d=diameter);
}

module cam() {
  height = 12;
  radius = 102;
  difference() {
    translate([0, 0, -height/2]) cylinder(h=height,r=radius);
    translate([0, -radius, 0]) cube(2*radius, center=true); 
  };
}

module ridge() {
  thickness = 23;
  outer_radius = 102;
  inner_radius = outer_radius - thickness;
  height = 80;
  difference() {
    translate([0, 0, -height/2]) ring(h=height, r1=inner_radius, r2=outer_radius);
    translate([0, -outer_radius, 0]) cube(2*outer_radius, center=true);
  }
}

module ring(h, r1, r2) {
  difference() {
    cylinder(h=h, r=r2);
    translate([0, 0, -h]) cylinder(h=3*h,r=r1);
  }
}

axis();
cam();
ridge();