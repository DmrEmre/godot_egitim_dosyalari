class_name CardPile
extends Resource

signal card_pile_size_changed(cards_amount: int) #elimizdeki kart sayısı değişti mi

@export var cards: Array[Card] = []


func empty() -> bool: 
	return cards.is_empty()


func draw_card() -> Card: #kartı çektiğinde kart öne gelsin
	var card = cards.pop_front()
	card_pile_size_changed.emit(cards.size())
	return card


func add_card(card: Card) -> void: #kartı geri ekleme
	cards.append(card)
	card_pile_size_changed.emit(cards.size())


func shuffle() -> void:
	cards.shuffle()


func clear() -> void:
	cards.clear()
	card_pile_size_changed.emit(cards.size())


func _to_string() -> String: #hata bulmak için
	var _card_strings: PackedStringArray = []
	for i in range(cards.size()):
		_card_strings.append("%s: %s" % [i+1, cards[i].id])
	return "\n".join(_card_strings)
