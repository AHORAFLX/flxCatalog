#!/usr/bin/env node

const versionArg = process.argv[2];

if (!versionArg) {
  console.error("❌ Please provide a version number (e.g. npm run publish -- 8)");
  process.exit(1);
}

const version = `${versionArg}.x`;
const { execSync } = require("child_process");

try {
  execSync(`mike deploy --update-aliases ${version} latest`, { stdio: "inherit" });
  execSync(`mike set-default ${version}`, { stdio: "inherit" });
} catch (err) {
  process.exit(1);
}
