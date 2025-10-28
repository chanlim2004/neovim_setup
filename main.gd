extends Node2D

# Define a custom resource for item data
class_name ItemData extends Resource
export(String) var item_name = "Default Item"
export(Texture) var item_icon = null
export(int) var item_value = 10

# Exported variables for scene setup
export(PackedScene) var enemy_scene: PackedScene
export(PackedScene) var projectile_scene: PackedScene
export(int) var max_enemies = 10
export(float) var spawn_interval = 2.0

# Preload resources for efficiency
onready var player = get_node("Player")
onready var ui_label = get_node("CanvasLayer/UILabel")
onready var spawn_timer = Timer.new()

var enemies_spawned = 0
var score = 0
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize() # Initialize random number generator with a time-based seed

	# Connect signals
	player.connect("damaged", self, "_on_Player_damaged")
	player.connect("healed", self, "_on_Player_healed")

	# Setup and start spawn timer
	add_child(spawn_timer)
	spawn_timer.wait_time = spawn_interval
	spawn_timer.connect("timeout", self, "_on_SpawnTimer_timeout")
	spawn_timer.start()

	update_ui_label()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Example of a simple game loop update
	if Input.is_action_just_pressed("ui_accept"):
		print("Action 'ui_accept' pressed!")

# Custom function to update the UI
func update_ui_label():
	ui_label.text = "Score: %d | Enemies: %d/%d" % [score, enemies_spawned, max_enemies]

# Signal handlers
func _on_Player_damaged(amount):
	print("Player took %d damage!" % amount)
	# Additional game logic for player damage

func _on_Player_healed(amount):
	print("Player healed for %d!" % amount)
	# Additional game logic for player healing

func _on_SpawnTimer_timeout():
	if enemies_spawned < max_enemies:
		spawn_enemy()
		enemies_spawned += 1
		update_ui_label()
	else:
		spawn_timer.stop()
		print("Max enemies reached!")

func spawn_enemy():
	if enemy_scene:
		var enemy_instance = enemy_scene.instance()
		var random_pos_x = rng.randf_range(50, get_viewport_rect().size.x - 50)
		var random_pos_y = rng.randf_range(50, get_viewport_rect().size.y - 50)
		enemy_instance.position = Vector2(random_pos_x, random_pos_y)
		add_child(enemy_instance)
		enemy_instance.connect("died", self, "_on_Enemy_died")
		print("Enemy spawned at %s" % enemy_instance.position)

func _on_Enemy_died(enemy_node):
	score += 100
	enemies_spawned -= 1
	update_ui_label()
	enemy_node.queue_free()
	print("Enemy defeated! Score: %d" % score)

# Example of a function that uses a custom resource
func create_random_item():
	var new_item = ItemData.new()
	new_item.item_name = "Random Potion"
	new_item.item_value = rng.randi_range(20, 100)
	# new_item.item_icon = load("res://assets/icons/potion.png") # Assuming an icon exists
	print("Created item: %s with value %d" % [new_item.item_name, new_item.item_value])
	return new_item

# Example of a function for shooting a projectile
func shoot_projectile(start_pos: Vector2, direction: Vector2):
	if projectile_scene:
		var projectile_instance = projectile_scene.instance()
		projectile_instance.position = start_pos
		projectile_instance.linear_velocity = direction.normalized() * 500 # Example speed
		add_child(projectile_instance)
		print("Projectile fired!")

# Example of a more complex utility function
func calculate_distance_squared(pos1: Vector2, pos2: Vector2) -> float:
	return pos1.distance_squared_to(pos2)
