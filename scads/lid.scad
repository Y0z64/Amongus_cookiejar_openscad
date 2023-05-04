include <hinge.scad>

$fn=80;

//hinge
baseWidth=11.55;
hingeLength=80;
baseThickness=3;
pivotRadius=6;
pinRadius=3.5;
pinTaper=0;
clearance=0.2;
tiny=0.005;
// calculated values
hingeHalfExtrudeLength=hingeLength/2-clearance/2;


scale([10,10,10]){
    //lid
    translate([0,0,2]) {
        union() {
            difference() {
                //Base
                union() {
                    difference() { 
                        color("red") 
                        resize([24,24,16])
                        sphere(r = 12);

                        translate([0,0,-14]) { 
                            cube([28,28,28], center=true);
                        }
                    }
                    translate([0,11.6,1.2]){ 
                    color("red") cube([8,1.5,1.2], center=true);
                    };
                    translate([-4,12.05,-0.005]){
                            scale([0.1,0.1,0.1]) {
                            rotate([0,90,0]){ 
                                color("red") hingeHalfMale();
                            }
                        }
                    };
                };
                //Diference
                translate([0,0,-1]) {
                    union() {
                        difference() {
                            resize([23,23.5,15.5]) 
                            color("red") 
                            sphere(r = 11.5);

                            translate([0,0,-14]) { 
                                cube([28,28,28], center=true);
                            }
                        }
                    }
                };
            };
        }
    }
}
