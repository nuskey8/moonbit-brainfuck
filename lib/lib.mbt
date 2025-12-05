pub fn run_string(source : String) -> Unit {
  let tokens = lex(source)
  let nodes = parse(tokens)
  run(nodes)
}