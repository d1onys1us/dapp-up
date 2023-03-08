<script lang="ts">
  // imports
  import { readContract, prepareWriteContract, writeContract, getAccount } from "@wagmi/core";
  import { signalServiceConfig, taikoL2Config } from "../generated";
  import { ethers } from "ethers";
  import { sepolia } from "@wagmi/core/chains";
  import { taiko } from "../domain/chain";
  import { providers } from "../stores";
  import { RLP } from "ethers/lib/utils";

  // variables
  let srcChainSignal = "";
  let proof: any; // TODO
  let isSignalReceivedFlag = false;
  let signalProof: string;
  type BlockHeader = {
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
  };

  // functions
  async function isSignalReceived() {
    //const signalProof = (await getSignalProof()) as `0x${string}`;

    const signalSenderAddress = getAccount().address;

    console.log("signalSenderAddress:", signalSenderAddress);
    console.log("proof:", signalProof);

    isSignalReceivedFlag = await readContract({
      address: signalServiceConfig.address[taiko.id],
      abi: signalServiceConfig.abi,
      functionName: "isSignalReceived",
      args: [
        ethers.BigNumber.from(sepolia.id), // TODO
        signalSenderAddress as `0x${string}`,
        ethers.utils.formatBytes32String("wellokaythen") as `0x${string}`,
        signalProof as `0x${string}`,
      ],
      chainId: taiko.id,
    });

    console.log("isSignalReceivedFlag:", isSignalReceivedFlag);
  }

  async function sendSignal() {
    // TODO make sure on sepolia
    const config = await prepareWriteContract({
      address: signalServiceConfig.address[sepolia.id],
      abi: signalServiceConfig.abi,
      functionName: "sendSignal",
      args: [ethers.utils.formatBytes32String(srcChainSignal) as `0x${string}`], // TODO
      chainId: sepolia.id,
    });
    await writeContract(config);
  }

  async function getSignalProof() {
    // 1. get the latest synced header of the other chain (TODO: how long need to wait until the SignalService state is synced)
    // in other words do we really need to do this or is latest good enough?

    // get latest synced header from destination chain
    const latestSyncedHeaderHash = await readContract({
      address: taikoL2Config.address[taiko.id],
      abi: taikoL2Config.abi,
      functionName: "getLatestSyncedHeader",
      chainId: taiko.id,
    });

    console.log("latestSyncedHeaderHash:", latestSyncedHeaderHash);

    // fetch the proof for this latest synced header
    const block = await $providers[sepolia.id].send("eth_getBlockByHash", [
      latestSyncedHeaderHash,
      false,
    ]);

    console.log("the block:", block);

    const logsBloom = block.logsBloom.toString().substring(2);

    // TODO type this
    const blockHeader: BlockHeader = {
      parentHash: block.parentHash,
      ommersHash: block.sha3Uncles,
      beneficiary: block.miner,
      stateRoot: block.stateRoot,
      transactionsRoot: block.transactionsRoot,
      receiptsRoot: block.receiptsRoot,
      logsBloom: logsBloom.match(/.{1,64}/g)!.map((s: string) => "0x" + s),
      difficulty: block.difficulty,
      height: block.number,
      gasLimit: block.gasLimit,
      gasUsed: block.gasUsed,
      timestamp: block.timestamp,
      extraData: block.extraData,
      mixHash: block.mixHash,
      nonce: block.nonce,
      baseFeePerGas: block.baseFeePerGas ? parseInt(block.baseFeePerGas) : 0,
    };

    console.log("block header:", blockHeader);

    // 2. get the merkle proof for the signal at the specified synced block hash
    proof = await $providers[sepolia.id].send("eth_getProof", [
      signalServiceConfig.address[sepolia.id],
      [
        ethers.utils.keccak256(
          ethers.utils.solidityPack(
            ["address", "bytes32"],
            [
              "0x418edF05d862EC3D591cB16F7E2efA88De8F2b00",
              ethers.utils.formatBytes32String("wellokaythen"),
            ]
          )
        ),
      ],
      block.hash,
    ]);

    console.log("block.hash:", block.hash);

    // 3. encode the account proof and storage proof
    const encodedProof = ethers.utils.defaultAbiCoder.encode(
      ["bytes", "bytes"],
      [RLP.encode(proof.accountProof), RLP.encode(proof.storageProof[0].proof)]
    );

    console.log("storage proof:", proof.storageProof[0].proof);

    // 4. return the signal proof
    signalProof = ethers.utils.defaultAbiCoder.encode(
      [
        "tuple(tuple(bytes32 parentHash, bytes32 ommersHash, address beneficiary, bytes32 stateRoot, bytes32 transactionsRoot, bytes32 receiptsRoot, bytes32[8] logsBloom, uint256 difficulty, uint128 height, uint64 gasLimit, uint64 gasUsed, uint64 timestamp, bytes extraData, bytes32 mixHash, uint64 nonce, uint256 baseFeePerGas) header, bytes proof)",
      ],
      [{ header: blockHeader, proof: encodedProof }]
    );

    console.log("signal proof:", signalProof);
  }
</script>

<section>
  <form>
    <input
      type="text"
      placeholder="Enter a signal to store on this chain..."
      bind:value={srcChainSignal}
    />
    <input type="submit" value="Send signal" on:click={sendSignal} />
  </form>
</section>

<section>
  <form>
    <input type="submit" value="Get signal proof" on:click={getSignalProof} />
  </form>
</section>

<section>
  <form>
    <div>Is signal received: {isSignalReceivedFlag}</div>
    <input type="submit" value="Is signal received" on:click={isSignalReceived} />
  </form>
</section>
