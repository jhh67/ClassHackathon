
module GraphModule {
    use List;
    var id = 0;

    class Node {
        var id: int;
        var value:string;
        var edges: list(unmanaged Edge) = new list(unmanaged Edge);

        proc init(val) {
            this.id = GraphModule.id;
            GraphModule.id += 1;
            this.value = val;
        }
        proc addEdge(edge: unmanaged Edge) {
            this.edges.append(edge);
        }
        proc getName() {
            return "n" + this.id:string;
        }
        proc writeThis(ch): void throws {
            ch.writef("%s [label=\"%s\"];", this.getName(), this.value);
        }
    }

    class Edge {
        var value: string;
        var ends: [0..1] unmanaged Node;
        proc init(node0, node1, val) {
            this.value = val;
            //this.ends = [node0, node1];
            this.ends = new unmanaged Node("");
            this.ends[0] = node0;
            this.ends[1] = node1;
        }
        proc writeThis(ch): void throws {
            ch.writef("%s -- %s;\n", this.ends[0].getName(),
                      this.ends[1].getName());
        }

    }

    class Graph {
        var nodes: list(unmanaged Node) = new list(unmanaged Node);
        var edges: list(unmanaged Edge) = new list(unmanaged Edge);

        proc addNode(val) : unmanaged Node {
            var node = new unmanaged Node(val);
            this.nodes.append(node);
            return node;
        }

        proc addEdge(node1, node2, val) {
            var edge = new unmanaged Edge(node1, node2, val);
            node1.addEdge(edge);
            node2.addEdge(edge);
            this.edges.append(edge);
        }
        proc writeThis(ch) : void throws {
            ch.writeln("graph Foo {");
            for edge in this.edges {
                ch.writeln(edge);
            }
            for node in this.nodes {
                ch.writeln(node);
            }
            ch.writeln("}");
        }
    }

    var g = new Graph();
    var n1 = g.addNode("Hello World!");
    var n2 = g.addNode("Happy to be here!!");
    g.addEdge(n1, n2, "This is an edge.");
    writeln(g);
}