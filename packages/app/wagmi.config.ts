import { defineConfig } from "@wagmi/cli";
import { foundry } from "@wagmi/cli/plugins";
import * as viemChains from "viem/chains";
import { taiko } from "./src/domain/chain";
// this is an error if the contract has not been deployed yet, set specific contract address if needed
import foundryJson from "../contracts/broadcast/Deploy.s.sol/31337/run-latest.json";
import baseJson from "../contracts/broadcast/Deploy.s.sol/84531/run-latest.json";
import taikoJson from "../contracts/broadcast/Deploy.s.sol/167005/run-latest.json";
import { taikoL2ABI, signalServiceABI } from "./src/abi";
import { Abi } from "abitype";

const chains = { ...viemChains, taiko };

export default defineConfig({
  out: "src/generated.ts",
  // Uncomment if you want to add some external contracts here
  // contracts: [
  //   {
  //     name: "SignalService",
  //     abi: signalServiceABI as Abi,
  //     address: {
  //       [chains.sepolia.id]: "0x7a2088a1bFc9d81c55368AE168C2C02570cB814F",
  //       // private l1
  //       [chains.taiko.id]: "0x1000777700000000000000000000000000000007",
  //     },
  //   },
  //   {
  //     name: "TaikoL2",
  //     abi: taikoL2ABI as Abi, // only using headerSyncABI for now
  //     address: {
  //       [chains.taiko.id]: "0x1000777700000000000000000000000000000001",
  //     },
  //   },
  // ],

  // Pull ABI from Foundry deployment
  plugins: [
    foundry({
      deployments: {
        Foo: {
          [chains.foundry.id]: foundryJson.transactions[0].contractAddress as `0x${string}`,
          [chains.baseGoerli.id]: baseJson.transactions[0].contractAddress as `0x${string}`,
          [chains.taiko.id]: taikoJson.transactions[0].contractAddress as `0x${string}`,
        },
      },
      project: "../../",
    }),
  ],
});
