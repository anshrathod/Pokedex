String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String capitalizeName(String s) {
  List<String> ss = s.split(" ");
  List<String> temp = [];
  for (var i = 0; i < ss.length; i++) {
    temp.add(capitalize(ss[i]));
  }
  return temp.join(" ");
}
