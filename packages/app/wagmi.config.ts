import { defineConfig } from "@wagmi/cli";
import { foundry, actions } from "@wagmi/cli/plugins";
import * as chains from "@wagmi/core/chains";

export default defineConfig({
  out: "src/generated.ts",
  plugins: [
    actions({
      readContract: true,
      prepareWriteContract: true,
      writeContract: true,
    }),
    // define contracts in your dapp here, TODO(d1onys1us): update contract 
    // address automatically on forge script deploys
    foundry({
      deployments: {
        Foo: {
          [chains.foundry.id]: "0x6e5655951159765d86f2efed540b806f1d6b9af6"
        }
      },
      project: "../../",
    }),
  ],
});
