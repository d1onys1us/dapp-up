import { defineConfig } from "@wagmi/cli";
import { foundry } from "@wagmi/cli/plugins";
import * as wagmiChains from "@wagmi/core/chains";
import { base, taiko } from "./src/domain/chain";
// TODO this is an error if the contract has not been deployed yet, please fix
import foundryJson from "../contracts/broadcast/Deploy.s.sol/31337/run-latest.json";
import { headerSyncABI, signalServiceABI } from "./src/abi";
import { Abi } from "abitype";

const chains = { ...wagmiChains, base, taiko };

export default defineConfig({
  out: "src/generated.ts",
  contracts: [
    {
      name: "SignalService",
      abi: signalServiceABI as Abi,
      address: {
        [chains.sepolia.id]: "0x11013a48Ad87a528D23CdA25D2C34D7dbDA6b46b",
        [chains.taiko.id]: "0x0000777700000000000000000000000000000007",
      },
    },
    {
      name: "TaikoL2",
      abi: headerSyncABI as Abi, // only using headerSyncABI for now
      address: {
        [chains.taiko.id]: "0x0000777700000000000000000000000000000001",
      },
    },
  ],
  plugins: [
    foundry({
      deployments: {
        Foo: {
          [chains.foundry.id]: foundryJson.transactions[0].contractAddress as `0x${string}`,
          // OR
          // [chains.foundry.id]: "0xblahblahblah"
        },
      },
      project: "../../",
    }),
  ],
});
