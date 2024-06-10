class MyUploadAdapter {
    constructor(loader) {
        this.loader = loader;
        this.xhr = null;
    }

    // Starts the upload process.
    upload() {
        return this.loader.file
            .then(file => {
                return new Promise((resolve, reject) => {
                    const formData = new FormData();
                    formData.append('upload', file);

                    this._initRequest();
                    this._initListeners(resolve, reject, file);
                    this._sendRequest(formData);
                });
            });
    }

    // Aborts the upload process.
    abort() {
        // Abort the XMLHttpRequest if it is in progress.
        if (this.xhr) {
            this.xhr.abort();
        }
    }

    // Initializes the XMLHttpRequest object.
    _initRequest() {
        this.xhr = new XMLHttpRequest();
        this.xhr.open('POST', '/oasis/upload', true);
        this.xhr.responseType = 'json';
    }

    // Initializes XMLHttpRequest listeners.
    _initListeners(resolve, reject, file) {
        const xhr = this.xhr;
        const loader = this.loader;

        xhr.addEventListener('error', () => reject(`Upload failed: ${file.name}`));
        xhr.addEventListener('abort', () => reject());
        xhr.addEventListener('load', () => {
            if (!xhr.response || xhr.status !== 200) {
                return reject(`Upload failed: ${file.name}`);
            }
            
            resolve({ default: xhr.response.url });
        });
        if (xhr.upload) {
            xhr.upload.addEventListener('progress', evt => {
                if (evt.lengthComputable) {
                    loader.uploadTotal = evt.total;
                    loader.uploaded = evt.loaded;
                }
            });
        }
    }

    // Sends the upload request.
    _sendRequest(formData) {
        this.xhr.send(formData);
    }
}

function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new MyUploadAdapter(loader);
    };
}
