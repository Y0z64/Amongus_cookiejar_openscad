include <hinge.scad>

$fn=200;
//main body
scale([10,10,10]){
    union(){
        difference() {
            difference() {
                union() {
                    translate([0,0,1]) {
                        r1 = 11;
                        r2 = 1;
                        color("red") hull(){
                            rotate_extrude() translate([r1,22,0]) circle(r2);
                            rotate_extrude() translate([r1,0,0]) circle(r2);
                        }
                    };
                    translate([0,-10.5,16]) {
                        color("cyan")
                        resize([22.5,8,11]) 
                        sphere(r = 12);
                    };
                    translate([0,13,11]) { 
                        color("red") rounded_cube(x = 16, y = 6, z = 16);
                    };
                    //hinge support
                    translate([0,11.6,20.5]){ 
                        color("red") cube([8,1.52,2], center=true);
                    };
                };
                union () {
                    translate([0,-10.5,16]) {
                            color("cyan")
                            resize([22,7.5,10.5]) 
                            sphere(r = 12);
                    };
                    translate([0, 0, 0.7]) {
                        color("pink") cylinder(h = 22, r = 11.5);
                    };
                };
            };
            translate([0,0,27]) { 
                color("red") cube([30,30,10], center=true);
            }
        };
        //hinge
        translate([-4,12.06,21.995]){
            scale([0.1,0.1,0.1]) {
            rotate([0,90,0]){ 
                color("red") hingeHalfFemale();
                }
            };
        }
    }
}



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

// union() {
//     translate([100,200,220]){
//             rotate([0,90,0]){ 
//             hingeHalfMale();
//             hingeHalfFemale();
//         }
//     }
// }

//functions
module rounded_cube(x,y,z) {
        x = x/2;
        y = y/2;
        z = z/2;
        hull(){
        // bottom
        translate([x,-y,-z])
        sphere(1);
        translate([-x,-y,-z])
        sphere(1);   
        translate([-x,y,-z])
        sphere(1); 
        translate([x,y,-z])
        sphere(1); 
    // top
        translate([x,-y,z])
        sphere(1);
        translate([-x,-y,z])
        sphere(1);   
        translate([-x,y,z])
        sphere(1); 
        translate([x,y,z])
        sphere(1);
    }
}