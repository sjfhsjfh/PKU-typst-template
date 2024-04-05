#import "./zh-num.typ": num_to_str

#let display(dt, fmt: "@Y @M@D") = {
  let year = dt.year()
  let year_str = if year != none {
    num_to_str(year) + "年"
  } else {
    ""
  }
  let month = dt.month()
  let month_str = if month != none {
    num_to_str(month) + "月"
  } else {
    ""
  }
  let day = dt.day()
  let day_str = if day != none {
    num_to_str(day) + "日"
  } else {
    ""
  }
  let hour = dt.hour()
  let hour_str = if hour != none {
    num_to_str(hour) + "时"
  } else {
    ""
  }
  let minute = dt.minute()
  let minute_str = if minute != none {
    num_to_str(minute) + "分"
  } else {
    ""
  }
  let second = dt.second()
  let second_str = if second != none {
    num_to_str(second) + "秒"
  } else {
    ""
  }
  // year_str + month_str + day_str + hour_str + minute_str + second_str
  fmt.replace("@Y", year_str).replace("@M", month_str).replace("@D", day_str).replace("@h", hour_str).replace(
    "@m",
    minute_str,
  ).replace("@s", second_str)
}

#display(datetime.today())
