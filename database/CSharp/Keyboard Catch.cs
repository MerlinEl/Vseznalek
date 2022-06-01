KeyPreview = true; // Enable keyboard events            KeyDown += new KeyEventHandler(OnKeyDown);            KeyUp += new KeyEventHandler(OnKeyUp);        private void OnKeyDown(object sender, KeyEventArgs e) {            e.SuppressKeyPress = true;            IsSpaceBarPressed = e.KeyCode == Keys.Space;            Console.WriteLine(Name + "> OnKeyDown > space:{0}", IsSpaceBarPressed);        }        private void OnKeyUp(object sender, KeyEventArgs e) {            e.SuppressKeyPress = true;            IsSpaceBarPressed = false;            Console.WriteLine(Name + "> OnKeyUp > space:{0}", IsSpaceBarPressed);        }constructor fn {InitializeComponent();            this.FormClosing += (s, args) => UnregisterHotKey(this.Handle, MYKEYID);} protected override void SetVisibleCore(bool value) {            if (value && !this.IsHandleCreated) {                this.CreateHandle();                RegisterHotKey(this.Handle, MYKEYID, MOD_CONTROL + MOD_SHIFT, Keys.U);                value = false;            }            base.SetVisibleCore(value);        }        protected override void WndProc(ref Message m) {            if (m.Msg == WM_HOTKEY && m.WParam.ToInt32() == MYKEYID) {                this.Visible = true;                if (this.WindowState == FormWindowState.Minimized)                    this.WindowState = FormWindowState.Normal;                SetForegroundWindow(this.Handle);            }            base.WndProc(ref m);        }        private const int MYKEYID = 0;    // In case you want to register more than one...        // P/Invoke declarations        private const int WM_HOTKEY = 0x312;        private const int MOD_ALT = 1;        private const int MOD_CONTROL = 2;        private const int MOD_SHIFT = 4;        [DllImport("user32.dll")]        private static extern int RegisterHotKey(IntPtr hWnd, int id, int modifier, Keys vk);        [DllImport("user32.dll")]        private static extern bool UnregisterHotKey(IntPtr hWnd, int id);        [DllImport("user32.dll")]        private static extern bool SetForegroundWindow(IntPtr hWnd);