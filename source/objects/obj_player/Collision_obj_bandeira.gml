if !other.triggered && other.active && grounded {
	other.triggered = true
	changeState("levelend")
}