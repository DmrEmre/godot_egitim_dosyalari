extends CardState


func enter() -> void:                            
	card_ui.drop_point_detector.monitoring = true      #kartın nerede bırakılacağını bilgisayarın izlemesi için


func on_input(event: InputEvent) -> void:             
	if event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.State.DRAGGING) #tıklandığında sürükleme sekmesine geçiş izni
