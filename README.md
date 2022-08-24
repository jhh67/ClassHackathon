# ClassHackathon

The goal for this activity is to experiment with different ways one might program a data structure with potential cycles in Chapel.

API

var graph = new Graph();

nodeId1 = addNode(val1); nodeId2 = addNode(val2);

graph.addEdge(nodeId1, nodeId2, val);

graph.toDot(); FIXME: show an example of what that looks like

Implementation notes

Start with a graph that is storing a string on each node and edge.
Extra credit if add functionality to graph that enables deleting edges and/or changing the values on nodes or edges.
Interesting if do something more general like a generic graph, but only if it helps answer some of the questions being asked about class usages in today's hackathon. (IOW, stay on target)
