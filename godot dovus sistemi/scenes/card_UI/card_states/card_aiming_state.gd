extends CardState

const MOUSE_Y_SNAPBACK_THRESHOLD := 138      #fareyi en aşağı götürünce geri bırak


func enter() -> void:
	card_ui.targets.clear() #kart kullanıldığında cardui kısmında targetarray kısmını temizle çünkü bir daha düşmana vurabiilriz
	var offset := Vector2(card_ui.parent.size.x / 2, -card_ui.size.y / 2) #çıkan okun animasyonu
	offset.x -= card_ui.size.x / 2
	card_ui.animate_to_position(card_ui.parent.global_position + offset, 0.2)
	card_ui.drop_point_detector.monitoring = false #kart düşmanın üzerindeyken hareketi izleme
	Events.card_aim_started.emit(card_ui)


func exit() -> void:
	Events.card_aim_ended.emit(card_ui)


func on_input(event: InputEvent) -> void:	
	var mouse_motion := event is InputEventMouseMotion #belirlediğimiz threshold değerinin altında olup olmadığını kontrol
	var mouse_at_bottom := card_ui.get_global_mouse_position().y > MOUSE_Y_SNAPBACK_THRESHOLD
	
	if (mouse_motion and mouse_at_bottom) or event.is_action_pressed("right_mouse"): #fare hareket ediyor mu,sağ click tıklandı mı?
		transition_requested.emit(self, CardState.State.BASE)
	elif event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse"): #atak yapıldıysa kartı kullan
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.RELEASED)
