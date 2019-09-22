/// Draws a thick line from x2,y2 to x3,y3
/// x1,y1 and x4,y4 are specified to ensure cap offsets are correct
/// 
/// If P1 == P2 then the start cap will be perpendicular to P2->P3
/// If P3 == P4 then the end cap will be perpendicular to P2->P3
/// 
/// Modes:
/// <= 0 - Filled
///    1 - Outline
///    2 - Outline + start cap (at P2)
///    3 - Outline + end cap (at P3)
/// >= 4 - Outline + both caps
/// 
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param x4
/// @param y4
/// @param width
/// @param mode

var _x1    = argument0;
var _y1    = argument1;
var _x2    = argument2;
var _y2    = argument3;
var _x3    = argument4;
var _y3    = argument5;
var _x4    = argument6;
var _y4    = argument7;
var _width = argument8;
var _mode  = argument9;

var _a  = line_thick_intersection(_x1, _y1, _x2, _y2, _x3, _y3, _width);
var _ax = _a[0];
var _ay = _a[1];
var _b  = line_thick_intersection(_x2, _y2, _x3, _y3, _x4, _y4, _width);
var _bx = _b[0];
var _by = _b[1];

if (_mode <= 0)
{
    draw_triangle(_x2 + _ax, _y2 + _ay,
                  _x2 - _ax, _y2 - _ay,
                  _x3 + _bx, _y3 + _by, false);
    
    draw_triangle(_x2 - _ax, _y2 - _ay,
                  _x3 + _bx, _y3 + _by,
                  _x3 - _bx, _y3 - _by, false);
}
else
{
    draw_line(_x2 + _ax, _y2 + _ay, _x3 + _bx, _y3 + _by);
    draw_line(_x2 - _ax, _y2 - _ay, _x3 - _bx, _y3 - _by);
    
    if (_mode >= 2)
    {
        if (_mode != 3) draw_line(_x2 + _ax, _y2 + _ay, _x2 - _ax, _y2 - _ay);
        if (_mode >= 3) draw_line(_x3 + _bx, _y3 + _by, _x3 - _bx, _y3 - _by);
    }
}