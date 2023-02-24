import { defineConfig } from "@wagmi/cli";
import { foundry } from "@wagmi/cli/plugins";

export default defineConfig({
  out: "src/out/generated.ts",
  plugins: [
    foundry({
      project: "../../",
    }),
  ],
});
