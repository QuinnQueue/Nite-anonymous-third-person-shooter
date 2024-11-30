@tool
extends MeshInstance3D

@onready var hitbox_shape = %HitboxShape

@export var default_debug_color : Color = Color(0.8, 0.2, 0.2, 0.7)
@export var hitbox_visual_material : Material = StandardMaterial3D.new()


##This script basically just sets the mesh to the same color and shape as the hitbox

func _ready():
	hitbox_visual_material.albedo_color = default_debug_color
	set_visual_to_shape()




##Sets the shape of the hitbox to the mesh to equal the hitbox
func set_visual_to_shape():
	match hitbox_shape.shape.get_class():
		"SphereShape3D":
			mesh = SphereMesh.new()
			mesh.radius = hitbox_shape.shape.radius
		"BoxShape3D":
			mesh = BoxMesh.new()
			mesh.size = hitbox_shape.shape.size
		"CapsuleShape3D":
			mesh = CapsuleMesh.new()
			mesh.height = hitbox_shape.shape.height
			mesh.radius = hitbox_shape.shape.radius
		"CylinderShape3D":
			mesh = CylinderMesh.new()
			mesh.top_radius = hitbox_shape.shape.radius
			mesh.bottom_radius = hitbox_shape.shape.radius
			mesh.height = hitbox_shape.shape.height 
		_:
			printerr("The hitbox shape is not a sphere, capsule, cylinder or box.")
	mesh.material = hitbox_visual_material
