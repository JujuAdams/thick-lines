draw_set_colour($FF987F);

draw_line_thick(obj_point5.x, obj_point5.y,
                obj_point1.x, obj_point1.y, //Draw P1 -> P2
                obj_point2.x, obj_point2.y,
                obj_point3.x, obj_point3.y,
                15, outline);

draw_line_thick(obj_point1.x, obj_point1.y,
                obj_point2.x, obj_point2.y, //Draw P2 -> P3
                obj_point3.x, obj_point3.y,
                obj_point4.x, obj_point4.y,
                15, outline);
                
draw_line_thick(obj_point2.x, obj_point2.y,
                obj_point3.x, obj_point3.y, //Draw P3 -> P4
                obj_point4.x, obj_point4.y,
                obj_point5.x, obj_point5.y,
                15, outline);
                
draw_line_thick(obj_point3.x, obj_point3.y,
                obj_point4.x, obj_point4.y, //Draw P4 -> P5
                obj_point5.x, obj_point5.y,
                obj_point1.x, obj_point1.y,
                15, outline);

draw_line_thick(obj_point4.x, obj_point4.y,
                obj_point5.x, obj_point5.y, //Draw P5 -> P1
                obj_point1.x, obj_point1.y,
                obj_point2.x, obj_point2.y,
                15, outline);

draw_set_colour(c_black);