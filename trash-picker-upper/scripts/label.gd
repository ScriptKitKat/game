extends Label
var coin_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signalbus.trash_collected.connect(count)

func count() -> void:
	coin_count += 1
	$".".text = "Score: " + str(coin_count)
