class_name Client
extends Node

@export var port: int = 9001
@export var ip: String = '127.0.0.1'

func _enter_tree() -> void:
	# This lets us use this node as the root for multiplayer. Basically, "Client" becomes the root for all NodePaths when
	# using RPCs or the MultiplayerSynchronizer/Spawner nodes. So any node above it gets ignored as far as multiplayer
	# is concerned.
	get_tree().set_multiplayer(MultiplayerAPI.create_default_interface(), self.get_path())


func _ready() -> void:
	join()


func join() -> void:
	var enet_multiplayer_peer = ENetMultiplayerPeer.new()
	var server = globalserver
	if(server.ip):
		ip = server.ip
	if(server.port):
		port = server.port
	var check: Error = enet_multiplayer_peer.create_client(ip, port)
	if check == OK:
		# Allows the MultiplayerAPI to use this ENetMultiplayerPeer to send/recieve RPCs and synchronizations.
		multiplayer.multiplayer_peer = enet_multiplayer_peer
	multiplayer.connected_to_server.connect(
		func():
			%Debug.peer_id.text = str(multiplayer.get_unique_id())
	)
	multiplayer.server_disconnected.connect(
		func():
			print("can't connect #2")
			pass
	)

