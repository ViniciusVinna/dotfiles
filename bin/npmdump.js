#!/usr/bin/env node

const { promisify } = require('util');
const { writeFile } = require('fs');
const { spawn } = require('child_process');

const dump = spawn('npm', ['ls', '-g', '--depth=0', '--json']);

async function getNpmPackages() {
  return new Promise((resolve, reject) => {
    let dataChunks = [];
    dump.stdout.on('data', (data) => {
      dataChunks.push(data);
    });

    dump.stderr.on('data', (data) => {
      console.error(data.toString());
      reject(new Error(data.toString()));
    });

    dump.on('close', (code) => {
      if (code === 0) {
        try {
          const packages = JSON.parse(Buffer.concat(dataChunks).toString());
          const entries = Object.entries(packages.dependencies)
            .filter(([key, value]) => key !== 'npm' && !value.resolved)
            .map(([key]) => key);

          resolve(entries.join('\n'));
        } catch (error) {
          reject(error);
        }
      } else {
        reject(new Error(`Child process exited with code ${code}`));
      }
    });
  });
}

async function main() {
  try {
    const npmPackages = await getNpmPackages();
    await promisify(writeFile)('NPMfile', npmPackages, 'utf-8');
    process.exit(0);
  } catch (error) {
    console.error(error.message);
    process.exit(1);
  }
}

main();
