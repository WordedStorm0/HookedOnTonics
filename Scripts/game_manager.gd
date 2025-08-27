extends Node

enum GameState {PLAY, PAUSE, END}
var state: GameState = GameState.END
var current_state: GameState = GameState.END

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	if Input.is_action_just_pressed("Pause_button") and current_state != GameState.END:
		toggle_pause()
		

func set_state(new_state: GameState) -> void:
	current_state = new_state
	var existing_pauseMenu = get_node_or_null("PauseMenu")
	
	match current_state:
		GameState.PLAY:
			if existing_pauseMenu:
				existing_pauseMenu.queue_free()
			get_tree().paused = false
		
		GameState.PAUSE:
			get_tree().paused = true

		GameState.END:
			pass
				
			

func toggle_pause():
	if current_state == GameState.PLAY:
		set_state(GameState.PAUSE)
	else:
		set_state(GameState.PLAY)

func switch_to_end_scene():
	pass
	#if EnemySpawner:
		#EnemySpawner.clear_all_enemies()
	##Ragdollmanager.clear_all_ragdolls()
	#if AmmoManager:
		#AmmoManager.clear_all_ammo()
#
