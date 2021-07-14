tool # for test purposes
extends Node

# Useful functions globally available
# Should be used as an autoload singleton

# checks if the node has a signal named signal_name
func checkIfHasSignal(node,signal_name):
	for el in node.get_signal_list():
		if(el["name"] == signal_name):
			return true
	return false
