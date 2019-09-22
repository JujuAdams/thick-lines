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

var _x1 = argument0;
var _y1 = argument1;
var _x2 = argument2;
var _y2 = argument3;
var _x3 = argument4;
var _y3 = argument5;
var _w  = argument6;

//Find vector P2->P1, we'll call this vector A
var _dx21 = _x1 - _x2;
var _dy21 = _y1 - _y2;

//Find vector P2->P3, we'll call this vector B
var _dx23 = _x3 - _x2;
var _dy23 = _y3 - _y2;

//Find the normalised vector for P2->P1, we'll call this vector An
//Normalised vectors have length of exactly 1
var _length21 = sqrt(_dx21*_dx21 + _dy21*_dy21);
//(We'd also normally want to check for a div-by-zero here)
var _nx21     = _dx21 / _length21;
var _ny21     = _dy21 / _length21;

//Find the normalised vector for P2->P3, we'll call this vector Bn
//Normalised vectors have length of exactly 1
var _length23 = sqrt(_dx23*_dx23 + _dy23*_dy23);
//(We'd also normally want to check for a div-by-zero here)
var _nx23     = _dx23 / _length23;
var _ny23     = _dy23 / _length23;

//Find the cosine of the angle between An and Bn. We'll call this angle "Theta"
//We're using the dot product, which has the property that:
//  An.Bn = |An||Bn| cos(Theta)
//If the length of A and B are exactly 1 (which is the case here since we normalised them) then:
//  An.Bn = cos(Theta)
var _cos_theta = _nx21*_nx23 + _ny21*_ny23;

//Find the sine of the angle between An and Bn
//The cross product is a bit more complex than the dot product
//  An x Bn = |An| |Bn| sin(Theta) N
//"N" is a vector that is at 90 degrees to both vector A and B
//An and Bn have a length of 1 so, much like the dot product:
//  An x Bn = sin(Theta) N
//Since both An and Bn lie only on the XY plane, vector N can only extend into the Z axis
//This means sin(Theta) is just the length of vector N, and we can figure that out with a single equation:
var _sin_theta = _nx21*_ny23 - _ny21*_nx23;

//The distance backwards along An to the point of intersection is:
//  distance = 1/tan(Theta/2)
//It turns out that:
//    tan(Theta/2) = sin(Theta) / [1 + cos(Theta)]
//  1/tan(Theta/2) = [1 + cos(Theta)] / sin(Theta)
//...And we can express our distance in terms of values we've already computed:
var _distance = (1 + _cos_theta) / _sin_theta;
//(We'd also normally want to check for a div-by-zero here)

//So, putting it all together, we push out perpendicular to vector An, then move backwards along An using the distance
//We also need to multiple by the desired thickness
return [_w*( _ny21 - _distance*_nx21),
        _w*(-_nx21 - _distance*_ny21)];