        public Assembly GetAssembly(AssemblyName assemblyName) {            Assembly[] assemblies = GetAssemblies().ToArray<Assembly>();            Assembly asm = ( from a in assemblies                             where a.FullName == assemblyName.FullName                             select a ).SingleOrDefault();            return asm;        }// by index            string[] Books_String_Data = Enumerable                .Range(0, subdirs.Length)                .Where(index => IsValidBook(subdirs[index]))                .Select(index => {                    IUcBook book = new IUcBook(subdirs[index]);                    FillLoacalData(book);                    if (mode == "online") FillServerData(book, server_xml);                    return JsonConvert.SerializeObject(book);                })                .ToArray();//by item                  string[] Books_String_Data = subdirs                .Where(dir => IsValidBook(dir))                .Select(dir => {                    IUcBook book = new IUcBook(dir);                    FillLoacalData(book);                    if (mode == "online") FillServerData(book, server_xml);                    return JsonConvert.SerializeObject(book);                })                .ToArray();//switchint total_days = Type switch{    "NULL" => 0,    "DEMO" => 30,    "YEAR" => 365, //var trial_fixed_date:String = "9/30"; //school year from 1.9 to 30.6 , licence ending after next semester begins + 29days    "FULL" => -1, //ulimited    _ => 0};