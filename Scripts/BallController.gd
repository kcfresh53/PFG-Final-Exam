extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

var currentdir := 1
var canStart : bool
var initfall : bool

var timerCalled : bool
var gameOverCalled : bool

var score : int
var canFollow : bool = true


func _physics_process(delta: float) -> void:
	if canStart:
		
		if !timerCalled:
			$Timer2.start()
			timerCalled = true
		
		# Add the gravity.
		if not is_on_floor():
			velocity.y -= gravity * delta
			canFollow = false
			
			if initfall:
				if !gameOverCalled:
					$Timer.start()
					gameOverCalled = true
		
		if is_on_floor():
			canFollow = true
		
		# Handle Jump.
		#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#	velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		#var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		
		var direction := (transform.basis * Vector3(currentdir, 0, -1)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
	
		move_and_slide()


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("lmb"):
		canStart = true
		currentdir *= -1


func _on_timer_timeout() -> void:
	print("Game Over")
	_gameOver()


func addScore(s):
	score += s


func _gameOver():
	%GameOver.visible = true
	%GameOver._update_scores(score)
	
	if ScoreManager.highScore <= score:
		ScoreManager.highScore = score
	


func _on_timer_2_timeout() -> void:
	initfall = true
	print("can fail")
