extends Node3D

func _ready() -> void:
    _setup_environment()
    _setup_lighting()
    _setup_ground()
    _setup_player()
    _setup_hud()

func _setup_environment() -> void:
    var sky_material := ProceduralSkyMaterial.new()
    sky_material.sky_top_color = Color(0.35, 0.55, 0.85)
    sky_material.sky_horizon_color = Color(0.65, 0.75, 0.85)
    sky_material.ground_bottom_color = Color(0.15, 0.18, 0.2)

    var sky := Sky.new()
    sky.sky_material = sky_material

    var environment := Environment.new()
    environment.background_mode = Environment.BG_SKY
    environment.sky = sky
    environment.ambient_light_source = Environment.AMBIENT_SOURCE_SKY
    environment.tonemap_mode = Environment.TONE_MAPPER_ACES

    var world_env := WorldEnvironment.new()
    world_env.environment = environment
    add_child(world_env)

func _setup_lighting() -> void:
    var sun := DirectionalLight3D.new()
    sun.rotation = Vector3(deg_to_rad(-45.0), deg_to_rad(-30.0), 0.0)
    sun.shadow_enabled = true
    sun.light_energy = 1.2
    add_child(sun)

func _setup_ground() -> void:
    var ground_body := StaticBody3D.new()
    ground_body.name = "Ground"

    var mesh_instance := MeshInstance3D.new()
    var plane := PlaneMesh.new()
    plane.size = Vector2(120.0, 120.0)
    mesh_instance.mesh = plane

    var material := StandardMaterial3D.new()
    material.albedo_color = Color(0.28, 0.45, 0.22)
    material.roughness = 0.9
    mesh_instance.material_override = material

    var collision := CollisionShape3D.new()
    var box := BoxShape3D.new()
    box.size = Vector3(120.0, 0.2, 120.0)
    collision.shape = box
    collision.position = Vector3(0.0, -0.1, 0.0)

    ground_body.add_child(mesh_instance)
    ground_body.add_child(collision)
    add_child(ground_body)

func _setup_player() -> void:
    var player_scene: PackedScene = load("res://scenes/player.tscn")
    var player := player_scene.instantiate()
    player.position = Vector3(0.0, 1.0, 0.0)
    add_child(player)

func _setup_hud() -> void:
    var layer := CanvasLayer.new()
    var label := Label.new()
    label.text = "WASD move  |  Click to look  |  Space jump  |  Esc release cursor"
    label.anchor_left = 0.5
    label.anchor_top = 1.0
    label.offset_left = -260.0
    label.offset_top = -40.0
    label.offset_right = 260.0
    label.offset_bottom = -10.0
    label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    layer.add_child(label)
    add_child(layer)
