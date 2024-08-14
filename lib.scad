module roundTaper(taperRadius, r, angle=360) {
  $fa = 1;
  $fs = 0.4;
  translate([0,0,0]) rotate_extrude(angle=angle) {
    rotate([0,0,90]) translate([0,r,0]) {
      difference() {
        #polygon(points = [ [0, 0], [0, taperRadius], [taperRadius, 0] ] );
        translate([taperRadius,taperRadius]) circle(r=taperRadius);
      }
    }
  }
}

module taper(taperRadius, height) {
  $fa = 1;
  $fs = 0.4;
  linear_extrude(height=height) {
    difference() {
      #polygon(points = [ [0, 0], [0, taperRadius], [taperRadius, 0] ] );
      translate([taperRadius,taperRadius]) circle(r=taperRadius);
    }
  }

}

module roundedCube(x,y,z,r) {
  hull() {
    translate([r,r,0]) cylinder(h=z,r=r);
    translate([x-r,r,0]) cylinder(h=z,r=r);
    translate([r,y-r,0]) cylinder(h=z,r=r);
    translate([x-r,y-r,0]) cylinder(h=z,r=r);
  }
}

module roundedCubeR(x,y,z,r,rr,fn=9) {
  minkowski() {
    translate([rr,rr,rr]) roundedCube(x-rr*2,y-rr*2,z-rr*2,r);
    sphere(r=rr,$fn=fn);
  }
}

module roundCube(x,y,z,r) {
  hull() {
    translate([r,r,r]) sphere(r=r);
    translate([x-r,r,r]) sphere(r=r);
    translate([r,y-r,r]) sphere(r=r);
    translate([x-r,y-r,r]) sphere(r=r);
    translate([r,r,z-r]) sphere(r=r);
    translate([x-r,r,z-r]) sphere(r=r);
    translate([r,y-r,z-r]) sphere(r=r);
    translate([x-r,y-r,z-r]) sphere(r=r);
  }
}

module donut(d, w) {
  $fa = 1;
  $fs = 0.4;
  translate([0,0,0]) rotate_extrude(angle=360) {
    rotate([0,0,90]) translate([0,d/2,0]) {
      circle(d=w);
    }
  }
}


