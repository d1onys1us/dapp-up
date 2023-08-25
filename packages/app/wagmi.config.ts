import { defineConfig } from "@wagmi/cli";
import { foundry } from "@wagmi/cli/plugins";
import fs from "fs";
// this is an error if the contract has not been deployed yet, set specific contract address if needed

function getDeployments(): { [x: string]: `0x${string}` | Record<number, `0x${string}`> | undefined } | undefined {
  console.log("Read deployments");
  const out: any = {};
  // Get list of folders in deployments
  const folders = fs.readdirSync("../contracts/broadcast/Deploy.s.sol");

  folders.forEach((chain) => {

    const json = JSON.parse(fs.readFileSync(`../contracts/broadcast/Deploy.s.sol/${chain}/run-latest.json`).toString());

    // Iterate through 'contracts' object and create a ContractConfig for each contract
    try {
      for (let transaction of json.transactions) {
        if (!out[transaction.contractName]) out[transaction.contractName] = {};
        out[transaction.contractName][chain] = transaction.contractAddress;
      };
    } catch (e) {
      console.error(e)
    }
  });
  return out;
  // loop through out and create a ContractConfig for each contract
  // let contracts: ContractConfig<number, undefined>[] = []
  // Object.keys(out).forEach((contractName) => {
  //   contracts.push({
  //     name: contractName,
  //     address: out[contractName].address,
  //     abi: out[contractName].abi,
  //   });
  // });
  // return contracts;
}


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
      deployments: getDeployments(),
      project: "../contracts",
      artifacts: './out',
    }),
  ],
});
