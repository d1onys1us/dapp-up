<script lang="ts">
  // imports
  import { readContract, prepareWriteContract, writeContract } from "@wagmi/core";
  import { signalServiceABI, signalServiceAddress } from "../generated";
  import { ethers } from "ethers";
  import { sepolia } from "@wagmi/core/chains";
  import { taiko } from "../domain/chain";
  import { providers } from "../stores";

  // variables
  let srcChainSignal = "";
  let proof: any; // TODO
  let isSignalReceivedFlag = false;

  // functions
  async function isSignalReceived() {
    const proofBytes = ethers.utils.solidityPack(
      ["bytes[]", "bytes[]"],
      [proof.accountProof, proof.storageProof]
    );

    console.log("proof bytes:", proofBytes);

    isSignalReceivedFlag = await readContract({
      address: signalServiceAddress[taiko.id],
      abi: signalServiceABI,
      functionName: "isSignalReceived",
      args: [
        ethers.BigNumber.from(taiko.id), // TODO
        // my wallet address
        "0x418edF05d862EC3D591cB16F7E2efA88De8F2b00",
        ethers.utils.formatBytes32String(srcChainSignal) as `0x${string}`,
        proofBytes as `0x${string}`,
      ],
    });

    console.log("isSignalReceivedFlag:", isSignalReceivedFlag);
  }

  async function sendSignal() {
    const config = await prepareWriteContract({
      address: signalServiceAddress[sepolia.id],
      abi: signalServiceABI,
      functionName: "sendSignal",
      args: [ethers.utils.formatBytes32String(srcChainSignal) as `0x${string}`], // TODO
    });
    await writeContract(config);
  }

  function getKey() {
    const key = ethers.utils.keccak256(
      ethers.utils.solidityPack(
        ["address", "bytes32"],
        [
          "0x418edF05d862EC3D591cB16F7E2efA88De8F2b00",
          ethers.utils.formatBytes32String("supersecret"),
        ]
      )
    );

    return key;
  }

  async function getProof() {
    proof = await $providers[sepolia.id].send("eth_getProof", [
      signalServiceAddress[sepolia.id],
      [getKey()],
      "latest",
    ]);
    console.log("the proof: ", proof);
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
    <input type="submit" value="Get proof" on:click={getProof} />
  </form>
</section>

<section>
  <form>
    <div>Is signal received: {isSignalReceivedFlag}</div>
    <input type="submit" value="Is signal received" on:click={isSignalReceived} />
  </form>
</section>
