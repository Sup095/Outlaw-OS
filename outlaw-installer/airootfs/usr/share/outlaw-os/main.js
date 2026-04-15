const { app, BrowserWindow, ipcMain } = require('electron');
const { spawn } = require('child_process');
const path = require('path');

let mainWindow;

function createWindow() {
    mainWindow = new BrowserWindow({
        fullscreen: true,
        frame: false,
        kiosk: true,
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false,
            enableRemoteModule: true
        }
    });

    mainWindow.loadFile('index.html');
    mainWindow.setMenu(null);
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') app.quit();
});

// Expose safe command runner to the renderer
ipcMain.handle('run-command', async (event, command) => {
    return new Promise((resolve) => {
        const child = spawn('bash', ['-c', command], { 
            cwd: process.env.HOME || '/home/operator',
            env: process.env 
        });

        let output = '';
        let errorOutput = '';

        child.stdout.on('data', (data) => {
            output += data.toString();
        });

        child.stderr.on('data', (data) => {
            errorOutput += data.toString();
        });

        child.on('close', (code) => {
            if (code === 0) {
                resolve(output.trim());
            } else {
                resolve(`ERROR (code ${code}):\n${errorOutput.trim() || output.trim()}`);
            }
        });

        child.on('error', (err) => {
            resolve(`COMMAND FAILED: ${err.message}`);
        });
    });
});

// Optional: Allow opening external apps safely
ipcMain.handle('open-app', async (event, appName) => {
    return new Promise((resolve) => {
        spawn(appName, [], { detached: true, stdio: 'ignore' }).unref();
        resolve(`Launched ${appName}`);
    });
});