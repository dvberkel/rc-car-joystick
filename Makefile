all: joystick.stl
	@echo "prepared stl"


%.stl: %.scad
	openscad -o $@ $<
