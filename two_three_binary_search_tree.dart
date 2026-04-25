import "dart:io";

class NodeTwo {
  int? data;
  NodeTwo? left;
  NodeTwo? right;

  NodeTwo() {
    this.data = 0;
    this.left = null;
    this.right = null;
  }

  NodeTwo.withValue(int? data) {
    this.data = data;
    this.left = null;
    this.right = null;
  }

  NodeTwo.withGeneral(int? data, NodeTwo? left, NodeTwo? right) {
    this.data = data;
    this.left = left;
    this.right = right;
  }
}

void main(List<String> args) {
  print("Lets go 2-3 b-trees!!");
}
