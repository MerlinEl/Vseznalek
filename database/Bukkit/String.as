public void removeString(String string) {List<String> list = getConfig().getStringList("Example");list.remove(string);getConfig().set("Example", list);saveConfig();}public void addString(String string) {List<String> list = getConfig().getStringList("Example");list.add(string);getConfig().set("Example", list);saveConfig();