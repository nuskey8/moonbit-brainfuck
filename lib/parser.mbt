///|
pub enum Node {
  Loop(Array[Node])
  Command(Token)
} derive(Show, Eq)

///|
pub fn parse(tokens : ArrayView[Token]) -> Array[Node] {
  let parser = { input: tokens, pos: 0 }
  parser.parse()
}

///|
priv struct Parser {
  input : ArrayView[Token]
  mut pos : Int
}

///|
fn Parser::parse(self : Parser) -> Array[Node] {
  let nodes = Array::new()
  while self.pos < self.input.length() {
    let token = self.input[self.pos]
    let node = match token {
      LoopStart => {
        self.pos += 1
        let inner = self.parse()
        Loop(inner)
      }
      LoopEnd => break
      other => Command(other)
    }
    nodes.push(node)
    self.pos += 1
  }
  nodes
}

///|
test "parse_test" {
  let source = lex("[+-[.<>]]")
  let expected = [
    Loop([
      Command(Inc),
      Command(Dec),
      Loop([Command(PutChar), Command(DecPtr), Command(IncPtr)]),
    ]),
  ]
  let actual = parse(source)
  inspect(expected, content=actual.to_string())
}
