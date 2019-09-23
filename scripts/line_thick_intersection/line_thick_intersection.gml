/// Returns the intersection point of two thick lines (P1->P2 and P2->P3)
/// This script returns the *outer* coordinate if P1->P2->P3 is orientated counter-clockwise
/// 
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param width

var _ax = argument0 - argument2;
var _ay = argument1 - argument3;
var _bx = argument4 - argument2;
var _by = argument5 - argument3;
var _w  = argument6;

var _a_length = sqrt(_ax*_ax + _ay*_ay);
var _b_length = sqrt(_bx*_bx + _by*_by);

if (_a_length == 0)
{
    //If P1 == P2...
    
    if (_b_length == 0)
    {
        //If P1 == P2 == P3 then return 0,0 because something is suuuuper broken
        return [0, 0];
    }
    else
    {
        //Otherwise return the perpendicular to P2->P3
        _b_length = _w / _b_length;
        return [-_by*_b_length, _bx*_b_length];
    }
}

_a_length = _w / _a_length;
_ax *= _a_length;
_ay *= _a_length;

if (_b_length == 0)
{
    //If P2 == P3 then return the perpendicular to P1->P2
    return [_ay, -_ax];
}

//The distance, parallel to An, from the perpendicular point (adjacent to P2) to the point of intersection is 1/tan(Theta/2)
//Additionally, 1/tan(Theta/2) = [1 + cos(Theta)] / sin(Theta)
//We use the dot product and cross product to compute cos(Theta) and sin(Theta)
var _distance = (_w*_b_length + _ax*_bx + _ay*_by) / (_ax*_by - _ay*_bx);

//Push out perpendicular to vector A, then move backwards along A using the distance
return [_ay - _distance*_ax, -_ax - _distance*_ay];