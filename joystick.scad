/* RC Car JoyStick
 *
 * 10 units = 1mm
 */

scale(1/10) print();

module print() {
  offset = 120;
  bound = 600;
  difference() {
    union() {
      translate([-offset, 0, 0]) rotate([0,   0, 0]) joystick();
      translate([ offset, 0, 0]) rotate([0, 180, 0]) joystick();
    };
    translate([0, 0, -bound/2]) cube(bound, center=true);
  }
}

module joystick() {
  union() {
    axis();
    cam();
    ridge();
    translate([0, 100, 0]) stick();
    actuators();
  }
}

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

module stick() {
  height = 158;
  diameter = 48;
  rotate([-90, 0, 0]) cylinder(h=height, d=diameter);
}

module actuators() {
  radius=85;
  union() {
    translate([radius, 0, 0]) actuator();
    translate([-radius, 0, 0]) actuator();
  }
}

module actuator() {
  height = 120;
  diameter = 30;
  translate([0, diameter/2, 0]) cylinder(h=height, d=diameter);
}
