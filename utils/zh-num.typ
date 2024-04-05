#let CHARS = "〇一二三四五六七八九"

#let digit_to_char(digit) = {
  assert(digit >= 0 and digit < 10, message: "digit must be in [0, 9]")
  return CHARS.clusters().at(digit)
}

#let num_to_str(num) = {
  assert(num >= 0, message: "num must be non-negative")
  let lowest_digit = calc.rem(num, 10)
  let rest = calc.floor(num / 10)
  if rest == 0 {
    return digit_to_char(lowest_digit)
  }
  return num_to_str(calc.floor(num / 10)) + digit_to_char(lowest_digit)
}
