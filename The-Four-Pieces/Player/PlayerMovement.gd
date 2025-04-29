extends CharacterBody3D

const SPEED = 4.0
const JUMP_VELOCITY = 4.5

var collected_pieces: int = 0
@onready var sound = $AudioStreamPlayer3D

@onready var timer = $"/root/Main/Timer"
var time_left: int = 20

func _ready():
	timer.wait_time = 1
	timer.start()
	timer.timeout.connect(update_timer_label)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
func collect_piece():
	sound.play()
	collected_pieces += 1
	update_label()
	if collected_pieces == 4:
		win_game()

func update_label():
	var label = get_node("/root/Main/CanvasLayer/Label")
	if label:
		label.text = "Collected Items: " + str(collected_pieces)

func win_game():
	call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://UI/GameWin/GameWin.tscn")
	
func update_timer_label():
	var label = get_node("/root/Main/CanvasLayer2/Label")
	if time_left > 0:
		time_left -= 1
		label.text = "Time Left: " + str(time_left)
	if time_left == 0:
		game_over()
	
func game_over():
	call_deferred("game_over_scene")

func game_over_scene():
	get_tree().change_scene_to_file("res://UI/GameOver/Game_Over.tscn")
