extends Control
@onready var body: TextureRect = %Body
@onready var expression: TextureRect = %Expression
@onready var row_character: HBoxContainer = %RowCharacter
@onready var row_expressions: HBoxContainer = %RowExpressions


var bodies :={
	"sophia": preload("uid://copkt78vgp37i"),
	"pink" : preload("uid://vb24hfgkeyti")
}

var expressions :={
	"happy":preload("res://assets/emotion_happy.png"),
	"regular":preload("res://assets/emotion_regular.png"),
	"sad":preload("res://assets/emotion_sad.png"),
}

func _ready()->void:
	body.texture=bodies["pink"]
	expression.texture = expressions["regular"]
	create_buttons()

func create_buttons() ->void:
	for key :String in bodies:
		var button = Button.new()
		button.text = key.capitalize()
		row_character.add_child(button)
		button.pressed.connect(func()->void:
			body.texture = bodies[key]
		)
	for face : String in expressions:
		var button = Button.new()
		button.text = face.capitalize()
		row_expressions.add_child(button)
		button.pressed.connect(func()->void:
			expression.texture = expressions[face]
		)
