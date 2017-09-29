type
  NodeKind = enum
    nkInt,
    nkFloat,
    nkString,
    nkAdd,
    nkSub,
    nkIf
  Node = ref NodeObj
  NodeObj = object
    case kind: NodeKind  # the ``kind`` field is the discriminator
    of nkInt: intVal: int
    of nkFloat: floatVal: float
    of nkString: strVal: string
    of nkAdd, nkSub:
      leftOp, rightOp: Node
    of nkIf:
      condition, thenPart, elsePart: Node

var n = Node(kind:nkFloat,floatVal:1.0)
n.strVal = ""
# the following statement raises an `FieldError` exception, because
# n.kind's value does not fit:
echo n[]