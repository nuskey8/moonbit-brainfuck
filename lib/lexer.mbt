///|
pub enum Token {
  IncPtr
  DecPtr
  Inc
  Dec
  PutChar
  GetChar
  LoopStart
  LoopEnd
} derive(Eq)

///|
pub impl Show for Token with output(self, logger) {
  logger.write_char(
    match self {
      GetChar => ','
      PutChar => '.'
      Inc => '+'
      Dec => '-'
      IncPtr => '>'
      DecPtr => '<'
      LoopStart => '['
      LoopEnd => ']'
    },
  )
}

///|
pub fn lex(source : String) -> Array[Token] {
  let tokens = Array::new(capacity=source.length())
  for c in source {
    let token = match c {
      '+' => Inc
      '-' => Dec
      '>' => IncPtr
      '<' => DecPtr
      '.' => PutChar
      ',' => GetChar
      '[' => LoopStart
      ']' => LoopEnd
      _ => continue
    }
    tokens.push(token)
  }
  tokens
}

///|
test "lex_test" {
  let source = "+-><.,[]"
  let expected = [
    Inc,
    Dec,
    IncPtr,
    DecPtr,
    PutChar,
    GetChar,
    LoopStart,
    LoopEnd,
  ]
  let actual = lex(source)
  inspect(actual, content=expected.to_string())
}
