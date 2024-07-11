module h_bridge(side_length, crossbeam_height, thiccness, movement_freedom){
    union(){
        // beams:
        translate([-(side_length-thiccness)/2, 0, 0]){
            cube([thiccness, side_length, thiccness-movement_freedom], true);
            translate([side_length - thiccness, 0, 0]){
                cube([thiccness, side_length, thiccness-movement_freedom], true);
            }
        }
        //cross beam:
        translate([0, 0, (thiccness-crossbeam_height)/2-movement_freedom/2]){
            cube([side_length, thiccness, crossbeam_height], true);
        }
        // support pillar
        if  (crossbeam_height != 0){
            translate([0, 0, -movement_freedom]){
                cube([thiccness, thiccness, thiccness], true);
            }
        }
        // edge blocks
        translate([side_length/2-thiccness/2, side_length/2-thiccness/2, -movement_freedom]){
            cube([thiccness, thiccness, thiccness], true);
        }
        translate([-side_length/2+thiccness/2, -side_length/2+thiccness/2, -movement_freedom]){
            cube([thiccness, thiccness, thiccness], true);
        }
        translate([-side_length/2+thiccness/2, side_length/2-thiccness/2, -movement_freedom]){
            cube([thiccness, thiccness, thiccness], true);
        }
        translate([+side_length/2-thiccness/2, -side_length/2+thiccness/2, -movement_freedom]){
            cube([thiccness, thiccness, thiccness], true);
        }
    }
}

module h_link(side_length, crossbeam_height, thiccness, movement_freedom){
    union(){
        translate([0, 0, thiccness/2]){
            h_bridge(side_length, crossbeam_height, thiccness, movement_freedom);
        }
        rotate([180, 0, 90]){
            translate([0, 0, thiccness/2]){
            h_bridge(side_length, crossbeam_height, thiccness, movement_freedom);
            }
        }
    }
}

module h_mesh (width, height, side_length, crossbeam_height, thiccness, movement_freedom){
    for (x=[0:width]) {
        for (y=[0:height]) {
            translate([x*2*3/4*(side_length-thiccness), y*2*3/4*(side_length-thiccness), 0]){
                h_link(side_length, crossbeam_height, thiccness, movement_freedom);
                translate([3/4*(side_length-thiccness), 3/4*(side_length-thiccness), 0]){

                    h_link(side_length, crossbeam_height, thiccness, movement_freedom);
                }
            }
        }
    }
}

module h_mesh_smooth (width, height, side_length, crossbeam_height, thiccness, movement_freedom){
    for (x=[0:width]) {
        for (y=[0:height]) {
            translate([x*2*3/4*(side_length-thiccness), y*2*3/4*(side_length-thiccness), 0]){
                h_link(side_length, crossbeam_height, thiccness, movement_freedom);
                if (x < width && y < height) {
                    translate([3/4*(side_length-thiccness), 3/4*(side_length-thiccness), 0]){

                        h_link(side_length, crossbeam_height, thiccness, movement_freedom);
                    }
                }
            }
        }
    }
}

module h_mesh_but_better_just_use_this_one_frfr_trust_no_cap_like_honestly_just_ignore_the_other_h_mesh_modules (width, height, side_length, crossbeam_height, thiccness, movement_freedom){
    for (x=[0:width]) {
        for (y=[0:height]) {
            translate([x*(sqrt(side_length^2 / 2)+sqrt(2*thiccness^2)), y*(sqrt(side_length^2 / 2)+sqrt(2*thiccness^2)), 0]){
                rotate([0, 0, 45]){
                    h_link(side_length, crossbeam_height, thiccness, movement_freedom);
                }
            }
        }
    }
}

// module h_mesh_smooth_2 (width, height, side_length, crossbeam_height, thiccness, movement_freedom){
//     for (x=[0:width]) {
//         for (y=[0:height]) {
//             translate([x*2*2/3*(side_length-thiccness), y*2*2/3*(side_length-thiccness), 0]){
//                 h_link(side_length, crossbeam_height, thiccness, movement_freedom);
//                 if (x < width && y < height) {
//                     translate([2/3*(side_length-thiccness), 2/3*(side_length-thiccness), 0]){
//                         h_link(side_length, crossbeam_height, thiccness, movement_freedom);
//                     }
//                 }
//             }
//         }
//     }
// }

//h_bridge(10, 1, 1.5, 0);
//h_link(10, 1, 1.5, 0);
h_mesh_but_better_just_use_this_one_frfr_trust_no_cap_like_honestly_just_ignore_the_other_h_mesh_modules(6, 6, 15, 0.9, 2, 0.3);
