draw_set_colour($FF987F);

var _string  = "Thick Lines   @jujuadams 2019/09/22";
    _string += "\nHold 1/2/3/4/5 to move points";
    _string += "\nPress O to toggle outline";

draw_rectangle(10, 10, 30+string_width(_string), 30+string_height(_string), false);
draw_set_colour($4C2726);
draw_text(20, 20, _string);

draw_set_colour(c_black);