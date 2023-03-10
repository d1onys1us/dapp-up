import { defineConfig } from "@wagmi/cli";
import { foundry } from "@wagmi/cli/plugins";
import * as wagmiChains from "@wagmi/core/chains";
import { base, taiko } from "./src/domain/chain";
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
        [chains.sepolia.id]: "0xe40D5bedD2f3d9F288CC12c69463bC43c77488d6",
        [chains.taiko.id]: "0x191E3D5a00d54799D7da6c04d56b19938304c312",
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
