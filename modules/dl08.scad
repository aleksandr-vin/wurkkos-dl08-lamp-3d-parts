// Caps for Wurkkos DL08 lamp

$fn = 100;

height = 17;
outer_dia = 40;
inner_dia = 30;

thickness = 2;           // Wall thickness
inner_cut_thickness = 2; // Extra cut (from the radius) of inner diameter (visible glass dia)

placement_distance = 10; // Distance between parts

module transport_cap()
{
    cap_base_h = height + thickness;
    translate([ 0, 0, cap_base_h / 2 ]) union()
    {
        difference()
        {
            cylinder(h = cap_base_h, d = outer_dia + 2 * thickness, center = true);
            translate([ 0, 0, thickness ]) cylinder(h = height++ thickness, d = outer_dia, center = true);
        }
        translate([ 0, 0, (cap_base_h + thickness) / 2 ]) difference()
        {
            cylinder(h = thickness, d1 = outer_dia + 2 * thickness, d2 = outer_dia + thickness, center = true);
            translate([ 0, 0, thickness / 2 - 0.01 ])
                cylinder(h = thickness * 2, d1 = outer_dia, d2 = outer_dia - 2 * thickness, center = true);
        }
    }
}

module cap()
{
    difference()
    {
        transport_cap();
        cylinder(h = thickness * 3, d = inner_dia + 2 * inner_cut_thickness, center = true);
        // # cylinder(h=thickness*3, d=inner_dia, center=true); // Uncomment to see where glass is
    }
}