extends Label

## The shortcut is shown only while F8/View can actually pause or resume a background family.


func _enter_tree() -> void:
	if not UIBackgroundMotion.state_changed.is_connected(_sync_visibility):
		UIBackgroundMotion.state_changed.connect(_sync_visibility)
	_sync_visibility()


func _exit_tree() -> void:
	if UIBackgroundMotion.state_changed.is_connected(_sync_visibility):
		UIBackgroundMotion.state_changed.disconnect(_sync_visibility)


func _sync_visibility() -> void:
	visible = UIBackgroundMotion.shortcut_available()
