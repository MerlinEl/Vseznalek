public Thread StartTheThread(SomeType param1, SomeOtherType param2) {  var t = new Thread(() => RealStart(param1, param2));  t.Start();  return t;}private static void RealStart(SomeType param1, SomeOtherType param2) {  ...}-----------------------------------------public void Doit(Label lbl, string str) {		Thread newthread = new Thread(()=> {		string _txt = lbl.Text		string _str = str		myTimer.Start();	}	newthread.Start();}-----------------------------------------Thread t = new Thread (new ParameterizedThreadStart(ThreadMethod));t.Start (myParameterObject);   static void ThreadMethod(object parameter)    {        // parameter equals to "My Parameter"    }-----------------------------------------You can use lambda expressionsprivate void MyMethod(string param1,int param2){  //do stuff}Thread myNewThread = new Thread(() => MyMethod("param1",5));myNewThread.Start();-----------------------------------------Thread thread = new Thread(Work);thread.Start(Parameter);private void Work(object param){    string Parameter = (string)param;}-----------------------------------------------------OR you could even delegate using ThreadStart like so...ThreadStart ts = delegate{     bool moreWork = DoWork("param1", "param2", "param3");     if (moreWork)      {          DoMoreWork("param1", "param2");     }};new Thread(ts).Start();------------------------------------------------            private void AnimateText(mcLabel lbl) {                int cnt = 0;                string _Text = lbl.Text;                int Dot_Counter = 0;                while ( cnt < 100 ) {                    Thread.Sleep(500);                    cnt++;                    Dot_Counter = Dot_Counter < 3 ? Dot_Counter + 1 : 0; //repeat numbers in range [1 - 3]                    lbl.Text = _Text + mcString.Multiply(".", Dot_Counter);                    Console.WriteLine("Thread StartAnimateDots > " + cnt.ToString());                    lbl.Update();               -----------------------------------------------------                // start animated dots ., .., ...                lbl_title.StartAnimateDots();                // simulate progress...                Thread myNewThread = new Thread(() => {                    // simulate progress process                    float total_steps = 500;                    for ( int i = 0; i <= total_steps; i++ ) {                        double percent = 100.0 / total_steps * i;                        percent = mcMath.minMax((int)percent, 1, 100); //min-max val correction                        System.Threading.Thread.Sleep(2);                        prog_bar.Value = (int)percent;                        //prog_bar.Update();                        //Console.WriteLine("progress:" + percent.ToString());                        if ( percent == 100 ) { //when is finished                            Console.WriteLine("progress done with:" + percent.ToString());                            /*if ( NeedConfirmToClose ) {                                if ( ShowConfirmButtonOnDone ) showOkButton(true);                            } else Close();*/                        }                    }                });                myNewThread.Start();