import { defineConfig } from "@wagmi/cli";
import { foundry } from "@wagmi/cli/plugins";
import * as viemChains from "viem/chains";
import { base, taiko } from "./src/domain/chain";
// TODO this is an error if the contract has not been deployed yet, please fix
import foundryJson from "../contracts/broadcast/Deploy.s.sol/31337/run-latest.json";
import { taikoL2ABI, signalServiceABI } from "./src/abi";
import { Abi } from "abitype";

const chains = { ...viemChains, base, taiko };

export default defineConfig({
  out: "src/generated.ts",
  contracts: [
    {
      name: "SignalService",
      abi: signalServiceABI as Abi,
      address: {
        [chains.sepolia.id]: "0x7a2088a1bFc9d81c55368AE168C2C02570cB814F",
        // private l1
        [chains.taiko.id]: "0x1000777700000000000000000000000000000007",
      },
    },
    {
      name: "TaikoL2",
      abi: taikoL2ABI as Abi, // only using headerSyncABI for now
      address: {
        [chains.taiko.id]: "0x1000777700000000000000000000000000000001",
      },
    },
  ],
  // pull ABI from foundry deployment
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
