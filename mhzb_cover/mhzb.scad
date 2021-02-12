

// 3D
module mhz_hold(){
    difference(){
        union(){
            difference(){
                cube([24,31,7]);
                translate([2,2,2]) cube([20,27,5]);
                translate([2,2,0]) cube([9,11,2]);
                translate([17,8,1]) cylinder(d=8 ,h=1,$fn=50);
                
                translate([22,14,1]) cube([9,11,6]);
            }
            translate([-10,2,0]) cube([10,10,11]);
            translate([24,2,0]) cube([10,10,11]);
        }
        translate([-5,7,0]) cylinder(d=3,h=13,$fn=50);
        translate([29,7,0]) cylinder(d=3,h=13,$fn=50);
    }
}


mhz_hold();
