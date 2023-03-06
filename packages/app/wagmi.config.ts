import { defineConfig } from "@wagmi/cli";
// import { actions } from "@wagmi/cli/plugins";
import { foundry } from "@wagmi/cli/plugins";
import * as chains from "@wagmi/core/chains";
import foundryJson from "../contracts/broadcast/Deploy.s.sol/31337/run-latest.json";
import goerliJson from "../contracts/broadcast/Deploy.s.sol/5/run-latest.json"
import sepoliaJson from "../contracts/broadcast/Deploy.s.sol/11155111/run-latest.json"

export default defineConfig({
  out: "src/generated.ts",
  plugins: [
    // see bug: https://github.com/wagmi-dev/wagmi/issues/1945
    // actions({
    //   readContract: true,
    //   prepareWriteContract: true,
    //   writeContract: true,
    // }),
    foundry({
      deployments: {
        // TODO: this can be improved
        Foo: {
          [chains.foundry.id]: foundryJson.transactions[0].contractAddress as `0x${string}`,
          [chains.goerli.id]: goerliJson.transactions[0].contractAddress as `0x${string}`,
          [chains.sepolia.id]: sepoliaJson.transactions[0].contractAddress as `0x${string}`,
        }
      },
      project: "../../",
    }),
  ],
});
