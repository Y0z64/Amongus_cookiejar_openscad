// modules
module hingeBaseProfile() {
  translate([pivotRadius,0,0]){
    square([baseWidth,baseThickness]);
  }
}

module hingeBodyHalf() {
  difference() {
    union() {
      linear_extrude(hingeHalfExtrudeLength){
        offset(1)offset(-2)offset(1){
          translate([0,pivotRadius,0]){
            circle(pivotRadius);
          }
          square([pivotRadius,pivotRadius]);
          hingeBaseProfile();
        }
      }
      linear_extrude(hingeLength){
        offset(1)offset(-1)hingeBaseProfile();
      }
    }
  }
}

module pin(rotateY, radiusOffset) {
  translate([0,pivotRadius,hingeHalfExtrudeLength+tiny]){
    rotate([0,rotateY,0]) {
      cylinder(
        h=hingeLength/2+clearance/2,
        r1=pinRadius+radiusOffset,
        r2=pinRadius+radiusOffset //Removed +pinTaper
      );
    }
  }
}

module hingeHalfFemale() {
  difference() {
        hingeBodyHalf();
        pin(rotateY=180, radiusOffset=clearance);
    }
}

module hingeHalfMale() {
  translate([0,0,hingeLength]) {
    rotate([0,180,0]) {
      hingeBodyHalf();
      pin(rotateY=0, radiusOffset=0);
    }
  }
}