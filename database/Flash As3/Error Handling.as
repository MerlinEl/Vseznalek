try {		_localFile.deleteFile();	} catch (err:Error) {		iuGlobal.debug("Error:: iuLargeFileLoader > load > Unable to delete file:{0}\nError:{1}", _localFile.nativePath, err.message);	dispatchEvent(new ErrorEvent(ErrorEvent.ERROR, false, false, err.message));	return;}_largeFilesLoader.addEventListener(ErrorEvent.ERROR, _onErrorOccured, false, int.MIN_VALUE, true);	private function _onErrorOccured(e:ErrorEvent):void {				disposeFileLoader();		iuGlobal.log("iuDownLoader > Download was aborted");		System.gc();		iuGlobal.downloading = false;		iuGlobal.downloadNext();	}