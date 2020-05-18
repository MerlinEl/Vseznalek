//These are the setup classes.public static class SandBox{    public static AppDomain CreateSandboxDomain(string name, string path, SecurityZone zone)    {        string fullDirectory = Path.GetFullPath(path);        string cachePath = Path.Combine(fullDirectory, "ShadowCopyCache");        string pluginPath = Path.Combine(fullDirectory, "Plugins");        if (!Directory.Exists(cachePath))            Directory.CreateDirectory(cachePath);        if (!Directory.Exists(pluginPath))            Directory.CreateDirectory(pluginPath);        AppDomainSetup setup = new AppDomainSetup        {            ApplicationBase = fullDirectory,            CachePath = cachePath,            ShadowCopyDirectories = pluginPath,            ShadowCopyFiles = "true"        };        Evidence evidence = new Evidence();        evidence.AddHostEvidence(new Zone(zone));        PermissionSet permissions = SecurityManager.GetStandardSandbox(evidence);        return AppDomain.CreateDomain(name, evidence, setup, permissions);    }}public class Runner : MarshalByRefObject{    private CompositionContainer _container;    private DirectoryCatalog _directoryCatalog;    private readonly AggregateCatalog _catalog = new AggregateCatalog();    public bool CanExport<T>()    {        T result = _container.GetExportedValueOrDefault<T>();        return result != null;    }    public void Recompose()    {        _directoryCatalog.Refresh();        _container.ComposeParts(_directoryCatalog.Parts);    }    public void RunAction(Action codeToExecute)    {        MefBase.Container = _container;        codeToExecute.Invoke();    }    public void CreateMefContainer()    {        RegistrationBuilder regBuilder = new RegistrationBuilder();        string pluginPath = AppDomain.CurrentDomain.SetupInformation.ApplicationBase;        _directoryCatalog = new DirectoryCatalog(pluginPath, regBuilder);        _catalog.Catalogs.Add(_directoryCatalog);        _container = new CompositionContainer(_catalog, true);        _container.ComposeExportedValue(_container);        Console.WriteLine("exports in AppDomain {0}", AppDomain.CurrentDomain.FriendlyName);    }}//Here is the actual code.AppDomain domain = SandBox.CreateSandboxDomain($"Sandbox Domain_{currentCount}", directoryName, SecurityZone.MyComputer);            foreach (FileInfo dll in currentDlls)            {                string path = Path.GetFullPath(Path.Combine(directoryName, dll.Name));                if (!File.Exists(path))                    File.Copy(dll.FullName, Path.Combine(directoryName, dll.Name), true);                domain.Load(typeof(Runner).Assembly.FullName);            }//You can get the domain back by doing this.Runner runner = (Runner) domain.CreateInstanceAndUnwrap(typeof(Runner).Assembly.FullName, typeof(Runner).FullName);runner.CreateMefContainer(); // or runner.Recompose();//You will need to call your code like this.runner.RunAction(() =>                {                    IRepository export = MefBase.Resolve<IRepository>();                    export?.Get("123");                    Console.WriteLine("Executing {0}", export);                });