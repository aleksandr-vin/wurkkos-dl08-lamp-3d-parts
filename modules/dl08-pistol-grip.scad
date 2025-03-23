$fn = 30;

ball_dia = 25;
ball_thickness_delta = 1;
mount_pole_dia = 9;

module bare_grip()
{
	eraser_cub_size = 100;
	difference()
	{
		// translate([ -6.0, -21.65, 0 ]) // Center to hole
		// translate([ -11, -40, 0 ]) // Center to front
		union()
		{
			translate([ 15, -20, 0 ]) // Center to compact size
			import("grip.stl");       // Creds to https://www.thingiverse.com/thing:1966894/files
			translate([ 41, 0, 0 ])
			cube([ 50, 20, 25 ], center = true); // Covering the holes
		}
		translate([ eraser_cub_size / 2 + 25, 0, 0 ])
		cube(eraser_cub_size, center = true);
	}
}

module bolt_assembly()
{
	total_outer_h = 25;
	cap_h = 5;
	nut_h = 5;

	union()
	{
		cylinder(h = 100, d = 5.1, center = true, $fn = 50); // hole

		translate([ 0, 0, total_outer_h / 2 - cap_h / 2 + .5 ])
		cylinder(h = cap_h + 1, d = 9, center = true, $fn = 50); // bolt cap place

		translate([ 0, 0, -total_outer_h / 2 + nut_h / 2 - .5 ])
		cylinder(h = nut_h + 1, d = 9.2, center = true, $fn = 6); // bolt cap place
	}
}

// Customized grip with ball and pole cuts
module grip()
{
	ball_model_dia = ball_dia - ball_thickness_delta;

	translate([ -27, -31, 0 ])
	difference()
	{
		bare_grip();
		translate([ 0, -1, 0 ])
		union()
		{
			sphere(d = ball_model_dia);
			//  cube([ 30, 30, mount_pole_dia ], center = true);
			rotate([ 0, 90, 0 ])
			translate([ 0, 0, 50 ])
			cylinder(h = 100, d = 9, center = true);
		}
		translate([ -10, -15, 0 ])
		bolt_assembly();
		translate([ 19, 8, 0 ])
		bolt_assembly();
	}
}

module right_grip_part()
{
	difference()
	{
		grip();
		translate([ 0, 0, 200 ])
		cube([ 400, 400, 400 ], center = true);
	}
}

module left_grip_part()
{
	difference()
	{
		grip();
		translate([ 0, 0, -200 ])
		cube([ 400, 400, 400 ], center = true);
	}
}
