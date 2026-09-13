extends Control
@onready var next_button: Button = %NextButton
@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var back_button: Button = %BackButton
@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer

var dialogue_items :Array[String]=[
	"eh chico llama el ascensor",
	"*se hacerca al ascensor*",
	"ASCENSOR",
	"no hombre pero con el boton...",
	"*se hacerca al boton*",
	"ASCENSOOOOOOOR"
]
var current_item_index:= 0

func _ready()->void:
	show_text()
	next_button.pressed.connect(advance)
	back_button.pressed.connect(go_back)

func go_back()->void:
	current_item_index-=1
	if current_item_index<=0:
		current_item_index=0
	show_text()

func advance()->void:
	current_item_index+=1
	if current_item_index == dialogue_items.size():
		current_item_index=0
	show_text()

func show_text() ->void:
	var current_item := dialogue_items[current_item_index]
	rich_text_label.visible_ratio=0
	var text_apperaing_duration :=current_item.length()/20.0
	var tween = create_tween()
	tween.tween_property(rich_text_label,"visible_ratio", 1.0,text_apperaing_duration)
	rich_text_label.text=current_item
	var sound_max_offeset:= audio_stream_player.stream.get_length() - text_apperaing_duration
	var sound_start_position := randf()*sound_max_offeset
	audio_stream_player.play(sound_start_position)
	tween.finished.connect(audio_stream_player.stop)
