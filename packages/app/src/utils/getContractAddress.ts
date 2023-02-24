import latestRun from "../../../../packages/contracts/broadcast/Deploy.s.sol/31337/run-latest.json";

export function getContractAddress(contractName: string): `0x${string}` {
  return latestRun.transactions.find(
    (tx: { contractName: string }) => tx.contractName === contractName
  ).contractAddress as `0x${string}`;
}
