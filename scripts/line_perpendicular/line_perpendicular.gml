/// @param x1
/// @param y1
/// @param x2
/// @param y2

var _x1 = argument0;
var _y1 = argument1;
var _x2 = argument2;
var _y2 = argument3;

var _dx = _x2 - _x1;
var _dy = _y2 - _y1;
var _inv_length = 1/sqrt(_dx*_dx + _dy*_dy);
_dx *= _inv_length;
_dy *= _inv_length;

return [-_dy, _dx];