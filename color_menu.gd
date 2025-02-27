extends NinePatchRect

var self_opened = false

@onready var Button1 = $VBoxContainer/CheckButton1
@onready var Button2 = $VBoxContainer/CheckButton2
@onready var Button3 = $VBoxContainer/CheckButton3	

@onready var BackgroundColor = get_parent().get_node("BackgroundColor")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		toggle_menu()
		
func toggle_menu():
	self_opened = ! self_opened
	if self_opened:
		self.visible=true
	else:
		self.visible = false
	


func _on_check_button_1_pressed() -> void:
	handle_button_press("1")

func _on_check_button_2_pressed() -> void:
	handle_button_press("2")

func _on_check_button_3_pressed() -> void:
	handle_button_press("3")
	
func handle_button_press(button):
	var color1 = $GridContainer/Panel1/ColorRect.color
	var color2 = $GridContainer/Panel4/ColorRect.color
	var color3 = $GridContainer/Panel7/ColorRect.color
	
	match button:
		"1":
			$"../BackgroundColor".color = color1
			Button2.set_pressed_no_signal(false)
			Button3.set_pressed_no_signal(false)
		"2":
			BackgroundColor.color = color2
			Button1.set_pressed_no_signal(false)
			Button3.set_pressed_no_signal(false)
		"3":
			BackgroundColor.color = color3
			Button1.set_pressed_no_signal(false)
			Button2.set_pressed_no_signal(false)
