inner_length = 79;
inner_width = 52;


waku_width = 10;
//
length = inner_length + waku_width * 2;
width =  inner_width + waku_width * 2;

module base(){
    r_corner = 3;
    union(){
        difference(){
            square([length,width]);
            square([r_corner,r_corner]);
            translate([length - r_corner,0,0]) square([r_corner,r_corner]);
            translate([0 ,width - r_corner,0]) square([r_corner,r_corner]);
            translate([length - r_corner,width - r_corner,0]) square([r_corner,r_corner]);
        }
        translate([r_corner,r_corner,0]) circle(r=r_corner);
        translate([length - r_corner,r_corner,0]) circle(r=r_corner);
        translate([r_corner,width - r_corner,0]) circle(r=r_corner);
        translate([length - r_corner,width - r_corner,0]) circle(r=r_corner);
    }
}

module m4bolt(){
    m4 = 4;
    circle(d=m4,$fn=50);
}

module bolt(){
    m3 = 3;
    circle(d=m3,$fn=50);
}

module screw(){
    circle(d=2,$fn=50);
}

slit_width = 3;
slit_length = 10;
module slit(){
    square([slit_width,slit_length]);
}

module yoko_slit(){
    rotate([0,0,90]) translate([0,-slit_length,0]) square([slit_width,slit_length]);
}

module univ_hole(){
    univhole_length = 71;
    univhole_width =  44;
    bolt();
    translate([univhole_length,0,0]) bolt();
    translate([0,univhole_width,0]) bolt();
    translate([univhole_length,univhole_width,0]) bolt();
}

module air_hole(){
    for ( i = [0 : 5] ){for(j=[0:5]){
        translate([i*4,j*4]) circle(d=2);
    }}
}

module slit_hole(){
    egge_offset = waku_width/2;
    
    union(){
        translate([egge_offset,slit_length,0]) slit();
        translate([egge_offset, width - slit_length - waku_width ,0]) slit();
        translate([length - egge_offset - slit_width,slit_length,0]) slit();
        translate([length - egge_offset - slit_width, width - slit_length - waku_width ,0]) slit();

        translate([waku_width,egge_offset,0]) yoko_slit();
        translate([length - slit_length - waku_width ,egge_offset,0]) yoko_slit();
        translate([waku_width,width - egge_offset - slit_width,0]) yoko_slit();
        translate([length - slit_length - waku_width ,width - egge_offset - slit_width,0]) yoko_slit();
    }
}



module mhzb_hole(){
    union(){
        square([3.3,12.2]);
        translate([29.8,0]) square([3.3,15.5]);
    }
}

module bottom(){
    difference(){
        base();
        // univ
        offset = 10 + 3;
        translate([offset,offset,0]) univ_hole();
        slit_hole();
        translate([30,30])air_hole();
        translate([60,30])air_hole();
   }
}

module top(){
    difference(){
        base();
        
        offset = 10 + 3;
        translate([offset,offset,0]) univ_hole();
        slit_hole();
        
        translate([20,15])air_hole();
        translate([33,47,0]) circle(r=2);
   }
}

height = 20;
nejisukima = 1.5;
slit_offset = waku_width/2 - nejisukima;
module side(){
    side_width = width - (waku_width * 2) + (slit_offset * 2);
    
    union(){
        square([height,side_width]);
        translate([-3,slit_offset]) slit();
        translate([-3,side_width - slit_offset - slit_length]) slit();
        translate([height,slit_offset]) slit();
        translate([height,side_width - slit_offset - slit_length]) slit();
   }
}

module side2(){
    difference(){
        side();
        translate([5,33]) square([12,16]);
    }
}

module front(){
    front_length = length - (waku_width *2)  + (slit_offset * 2) -3;
    
    union(){
        square([front_length,height]);
        translate([slit_offset-1.5,-3]) yoko_slit();
        translate([front_length  - slit_offset - slit_length+1.5,-3]) yoko_slit();
        translate([slit_offset-1.5,height]) yoko_slit();
        translate([front_length  - slit_offset - slit_length+1.5,height]) yoko_slit();
   }
}


// 簡易版
s_waku_width = 3;
module s_base(){

    length = inner_length + s_waku_width * 2;
    width =  inner_width + s_waku_width * 2;
    
    r_corner = 3;
    union(){
        difference(){
            square([length,width]);
            square([r_corner,r_corner]);
            translate([length - r_corner,0,0]) square([r_corner,r_corner]);
            translate([0 ,width - r_corner,0]) square([r_corner,r_corner]);
            translate([length - r_corner,width - r_corner,0]) square([r_corner,r_corner]);
        }
        translate([r_corner,r_corner,0]) circle(r=r_corner);
        translate([length - r_corner,r_corner,0]) circle(r=r_corner);
        translate([r_corner,width - r_corner,0]) circle(r=r_corner);
        translate([length - r_corner,width - r_corner,0]) circle(r=r_corner);
    }
}

module simple_cover(){
    difference(){
        s_base();
        // univ
        offset = s_waku_width + 3;
        translate([offset,offset,0]) univ_hole();
   }
}

// 3mmのアクリル想定 レーザーカッター加工用
// これのコメントアウトを解除してSVGでエクスポート　
//simple_cover();
//bottom();
//translate([5+3,75,2]) front();
//translate([5+3,-55,2]) front();
//translate([-60,10-slit_offset,2]) side2();
//translate([100,10-slit_offset,2]) side();
//translate([0,0,3]) color([0,0,0]) top();
