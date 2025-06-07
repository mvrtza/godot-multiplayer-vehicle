extends Node3D

@export var local_player_scene: PackedScene


func _ready() -> void:
	multiplayer.connected_to_server.connect(create_local_player)
	multiplayer.connection_failed.connect(
		func ():
			var enet_multiplayer_peer = ENetMultiplayerPeer.new()
			
			var check: Error = enet_multiplayer_peer.create_client("127.0.0.1", 9001)
			if check == OK:
				# Allows the MultiplayerAPI to use this ENetMultiplayerPeer to send/recieve RPCs and synchronizations.
				multiplayer.multiplayer_peer = enet_multiplayer_peer
	)


func create_local_player() -> void:
	var player: Node3D = local_player_scene.instantiate()
	var peer_id: int = multiplayer.get_unique_id()
	player.name = str(peer_id)
	add_child(player)
	if( player.get_node("ClientSync").is_inside_tree()):
		var client_sync: MultiplayerSynchronizer = player.get_node("ClientSync")
		client_sync.set_multiplayer_authority(peer_id)
		client_sync.set_visibility_for(1, true)


func _on_player_spawner_spawned(node: Node) -> void:
	%Debug.add_visible_peer(node.name)


func _on_player_spawner_despawned(node: Node) -> void:
	%Debug.remove_visible_peer(node.name)

