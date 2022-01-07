  DrawShadow(g, Color.Black, GetRectPath(new Rectangle(80,80, 100, 100)), 17, 5); private void DrawShadow(Graphics gra, Color clr, GraphicsPath gp, int d, int penWidth) {            Color[] colors = GetColorVector(clr, this.BackColor, d).ToArray();            for ( int i = 0; i < d; i++ ) {                gra.TranslateTransform(1f, 0.75f);                // 0.75f <== shadow vector!                using ( Pen pen = new Pen(colors[i], penWidth) )  //1.75f <== pen width (*)                    gra.DrawPath(pen, gp);            }            gra.ResetTransform();        }        private List<Color> GetColorVector(Color fc, Color bc, int depth) {            List<Color> cv = new List<Color>();            float dRed = 1f * ( bc.R - fc.R ) / depth;            float dGreen = 1f * ( bc.G - fc.G ) / depth;            float dBlue = 1f * ( bc.B - fc.B ) / depth;            for ( int d = 1; d <= depth; d++ )                cv.Add(Color.FromArgb(255, ( int )( fc.R + dRed * d ),                  ( int )( fc.G + dGreen * d ), ( int )( fc.B + dBlue * d )));            return cv;        }        private GraphicsPath GetRectPath(Rectangle R) {            byte[] fm = new byte[5];            for ( int b = 0; b < 5; b++ ) fm[b] = 1;            List<Point> points = new List<Point> {                new Point(R.Left, R.Top),                new Point(R.Right, R.Top),                new Point(R.Right, R.Bottom),                new Point(R.Left, R.Bottom),                new Point(R.Left, R.Top)            };            return new GraphicsPath(points.ToArray(), fm);        }