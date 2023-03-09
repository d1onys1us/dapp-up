export type BlockHeader = {
  parentHash: string;
  ommersHash: string;
  beneficiary: string;
  stateRoot: string;
  transactionsRoot: string;
  receiptsRoot: string;
  logsBloom: string[];
  difficulty: number;
  height: number;
  gasLimit: number;
  gasUsed: number;
  timestamp: number;
  extraData: string;
  mixHash: string;
  nonce: number;
  baseFeePerGas: number;
  withdrawalsRoot: string;
};
