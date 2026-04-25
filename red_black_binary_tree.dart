import 'dart:io';

enum ColorCondition { red, black }

class Node {
  int key;
  int? value;
  Node? left;
  Node? right;
  ColorCondition color = ColorCondition.red;

  Node({
    required this.key,
    required this.value,
    this.color = ColorCondition.red,
  });

  Node.withContent({
    required this.key,
    required this.value,
    this.color = ColorCondition.red,
    required this.left,
    required this.right,
  });

  static bool isRed(Node? x) {
    if (x == null) {
      return false;
    }
    return x.color == ColorCondition.red;
  }

  static Node rotateLeft(Node h) {
    assert(Node.isRed(h.right));

    // x is not null.
    Node x = h.right!;
    h.right = x.left;
    x.left = h;
    x.color = h.color;
    h.color = ColorCondition.red;
    return x;
  }

  static Node rotateRight(Node h) {
    assert(Node.isRed(h.left));

    // x is not null;
    Node x = h.left!;
    h.left = x.right;
    x.left = h;
    x.color = h.color;
    h.color = ColorCondition.red;
    return x;
  }

  static void flipColor(Node h) {
    assert(!Node.isRed(h));
    assert(Node.isRed(h.left));
    assert(Node.isRed(h.right));

    h.color = ColorCondition.red;
    h.left!.color = ColorCondition.black;
    h.right!.color = ColorCondition.black;
  }
}

class RedBlackTree {
  Node? root;

  RedBlackTree();

  RedBlackTree.withRoot({required this.root}) {
    if (this.root != null) {
      this.root!.color = ColorCondition.black;
    }
  }

  Node _put(Node? h, int key, int value) {
    if (h == null) {
      return new Node(key: key, value: value);
    }

    if (key < h.key) {
      _put(h.left, key, value);
    } else if (key > h.key) {
      h.right = _put(h.right, key, value);
    } else {
      h.value = value;
    }

    if (Node.isRed(h.right) && !Node.isRed(h.left)) {
      h = Node.rotateLeft(h);
    }

    if (Node.isRed(h.left) && Node.isRed(h.left?.left)) {
      h = Node.rotateRight(h);
    }

    if (Node.isRed(h.left) && Node.isRed(h.right)) {
      Node.flipColor(h);
    }
    return h;
  }

  void put({required int key, required int value}) {
    this._put(this.root, key, value);
  }
}

int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);

    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print("Input cannot be empty.");
      continue;
    }

    int? number = int.tryParse(input);

    if (number == null) {
      print("Please enter a valid integer.");
      continue;
    }

    return number;
  }
}

void main() {
  print("Let's make read black tree!!");

  RedBlackTree? tree = RedBlackTree.withRoot(root: Node(key: 5, value: 7));
  for (int i = 0; i < 5; ++i) {
    print("${i + 1}================");
    int key = readInt("Key: ");
    int value = readInt("Value: ");

    tree.put(key: key, value: value);
  }

  print(tree);
}
