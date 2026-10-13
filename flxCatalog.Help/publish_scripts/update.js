const { execSync } = require("child_process");

// npm strips named flags → use positional arg
const version = process.argv[2];

if (!version) {
  console.error("❌ Missing version");
  console.error("👉 Usage: npm run docs:publish -- 8");
  process.exit(1);
}

const mikeVersion = `${version}.x`;

try {
  console.log(`🚀 mike deploy --update ${mikeVersion}`);
  execSync(`mike deploy --update ${mikeVersion}`, {
    stdio: "inherit"
  });

  console.log("✅ Deployment complete");
} catch (err) {
  console.error("💥 Error:", err.message);
  process.exitCode = 1;
}