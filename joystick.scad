/* RC Car JoyStick
 *
 * 10 units = 1mm
 */

module axis() {
  height = 115;
  diameter = 42;
  rotate([90, 0, 0]) translate([0, 0, -height/2]) cylinder(h=height,d=diameter);
}

axis();