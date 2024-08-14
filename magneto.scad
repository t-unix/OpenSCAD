use <lib.scad>;

$fn = $preview ? 25 : 200;

d=22;

md=20.2;
mh=2.2;

w=0.48;

t=10;

difference() {
  th=mh+2*w;
  union() {
    cylinder(d=d,h=th);
    translate([0,0,th]) roundTaper(t, d/2-t);
    translate([0,0,th+t]) sphere(d=t/3);
    translate([0,0,th]) cylinder(d=2, h=t);
  }
  translate([0,0,w]) cylinder(d=md,h=mh);
}
