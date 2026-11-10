import { chromium } from "playwright";
import { mkdir } from "node:fs/promises";
import { resolve } from "node:path";
import { pathToFileURL } from "node:url";

const root = process.cwd();
const palettes = ["Alexandria", "Babylon", "Knossos", "Petra", "Tikal", "Troy"];
const output = resolve(root, "screenshots");
await mkdir(output, { recursive: true });

const browser = await chromium.launch({ headless: true });
try {
  const page = await browser.newPage({
    viewport: { width: 1280, height: 900 },
    deviceScaleFactor: 1,
  });
  await page.goto(pathToFileURL(resolve(root, "tools/composer.html")).href);
  await page.locator("#palette-select option").first().waitFor();

  for (const name of palettes) {
    await page.locator("#palette-select").selectOption({ label: name });
    await page.locator("#term .term-body").waitFor();
    await page.screenshot({
      path: resolve(output, name.toLowerCase() + ".png"),
      fullPage: false,
    });
    console.log("Rendered " + name);
  }
} finally {
  await browser.close();
}
