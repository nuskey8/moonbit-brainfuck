///|
priv struct Interpreter {
  memory : Array[Byte]
  mut ptr : Int
}

///|
fn Interpreter::run(self : Interpreter, nodes : ArrayView[Node]) -> Unit {
  for node in nodes {
    match node {
      Loop(inner) =>
        while true {
          let c = self.memory[self.ptr]
          if c == 0 {
            break
          }
          self.run(inner)
        }
      Command(token) =>
        match token {
          Inc => self.memory[self.ptr] += 1
          Dec => self.memory[self.ptr] -= 1
          IncPtr => self.ptr += 1
          DecPtr => self.ptr -= 1
          PutChar => println(self.memory[self.ptr].to_char())
          GetChar => panic()
          _ => panic()
        }
    }
  }
}

///|
pub fn run(nodes : ArrayView[Node]) -> Unit {
  let interpreter = { memory: Array::make(2048, Byte::default()), ptr: 0 }
  interpreter.run(nodes)
}
