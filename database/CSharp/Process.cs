//If you start a process, then you'll be its parent.//Maybe you could try to start your process from cmd.exe instead, so cmd.exe will be the parent.Process proc = Process.Start(new ProcessStartInfo {       Arguments = "/C explorer",        FileName = "cmd",        WindowStyle = ProcessWindowStyle.Hidden });//orSystem.Diagnostics.ProcessStartInfo psi = new System.Diagnostics.ProcessStartInfo();psi.FileName = @"cmd";psi.Arguments = "/C start notepad.exe";psi.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;System.Diagnostics.Process.Start(psi);