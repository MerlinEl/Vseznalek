//Test Not worked            MouseWheel += new MouseEventHandler(CanvasZoom);        private float ZOOM_SCALE = 1.25f;   // 25% smaller or larger        private float ZOOM_TOTAL = 0.0f;    // total zoom has done        public SizeF StartScale { get; private set; }            StartScale = new SizeF(1f / ClientSize.Width, 1f / ClientSize.Height); //new SizeF(Scale.X, Scale.Y);        #region Zoom        /// <summary>        /// We use the mousewheel to zoom(in-out) the canvas        /// </summary>        private void CanvasZoom(object sender, MouseEventArgs e) {            if (e.Delta < 0) { //ZoomIn                 Scale(new SizeF(ZOOM_SCALE, ZOOM_SCALE));                ZOOM_TOTAL += ZOOM_SCALE;            } else { //ZoomOut                 Scale(new SizeF(-ZOOM_SCALE, -ZOOM_SCALE));                ZOOM_TOTAL -= ZOOM_SCALE;            }        }        public void ResetTrasform() {            Scale(new SizeF(ZOOM_TOTAL*-1, ZOOM_TOTAL*-1));            Location = StartLocation;            Refresh();        }        #endregionfloat scaleX = ((float)formNewWidth / formBaseWidth);float scaleY = ((float)formNewHeight / formBaseHeight);this.Scale(new SizeF(scaleX, scaleY));