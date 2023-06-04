<script lang="ts">
  // imports
  import { readContract, prepareWriteContract, writeContract, getAccount } from "@wagmi/core";
  import { signalServiceConfig, taikoL2Config } from "../generated";
  import { sepolia } from "viem/chains";
  import {
    encodeAbiParameters,
    encodePacked,
    keccak256,
    parseAbiParameters,
    stringToHex,
    toRlp,
  } from "viem";
  import { taiko } from "../domain/chain";
  import { providers } from "../stores";
  import type { BlockHeader } from "../domain/sepoliaBlock";

  // variables
  let signalToSend = "";
  let signalToVerify = "";
  let isSignalReceivedMessage = "false";

  // functions
  async function sendSignal() {
    const config = await prepareWriteContract({
      address: signalServiceConfig.address[sepolia.id],
      abi: signalServiceConfig.abi,
      functionName: "sendSignal",
      args: [stringToHex(signalToSend, { size: 32 })],
      chainId: sepolia.id,
    });
    await writeContract(config.request);
  }

  async function isSignalReceived() {
    isSignalReceivedMessage = "Checking...";
    const signalSenderAddress = getAccount().address;

    // 1. get the latest synced header of the other chain
    // TODO update to getCrossChainBlockHash
    const latestSyncedHeaderHash = await readContract({
      address: taikoL2Config.address[taiko.id],
      abi: taikoL2Config.abi,
      functionName: "getCrossChainBlockHash",
      chainId: taiko.id,
      args: [0],
    });

    const block = await $providers[sepolia.id].send("eth_getBlockByHash", [
      latestSyncedHeaderHash,
      false,
    ]);

    // 2. get the merkle proof for the signal at the specified synced block hash
    let proof = await $providers[sepolia.id].send("eth_getProof", [
      signalServiceConfig.address[sepolia.id],
      [
        keccak256(
          encodePacked(
            ["address", "bytes32"],
            [signalSenderAddress as `0x${string}`, stringToHex(signalToVerify, { size: 32 })]
          )
        ),
      ],
      block.hash,
    ]);

    // 3. encode the account proof and storage proof
    const encodedProof = toRlp(proof.storageProof[0].proof);

    // 4. return the signal proof
    let signalProof = encodeAbiParameters(
      parseAbiParameters(
        "tuple(tuple(bytes32, bytes32, address, bytes32, bytes32, bytes32, bytes32[8], uint256, uint128, uint64, uint64, uint64, bytes, bytes32, uint64, uint256, bytes32), bytes)"
      ),
      [{ header: blockHeader, proof: encodedProof }]
    );

    // 5. verify signal proof

    isSignalReceivedMessage = (await readContract({
      address: signalServiceConfig.address[taiko.id],
      abi: signalServiceConfig.abi,
      functionName: "isSignalReceived",
      args: [
        BigInt(sepolia.id),
        signalSenderAddress as `0x${string}`,
        stringToHex(signalToVerify, { size: 32 }),
        signalProof as `0x${string}`,
      ],
      chainId: taiko.id,
    }))
      ? "true"
      : "false";
  }
</script>

<!-- start template -->
<section>
  Steps:
  <ol>
    <li>
      <u>Connect your wallet (to Sepolia) and make sure you have some Sepolia ETH</u>&nbsp;(<a
        href="https://sepolia-faucet.pk910.de/"
        target="_blank"
        rel="noreferrer">Faucet ↗</a
      >)
    </li>
    <li>Enter a message, and click "Send signal"</li>
    <li>Wait about ~5 mins (currently configured L2 block derivation time)</li>
    <li>Enter a message, and click "Is signal received" to verify this signal on Taiko</li>
  </ol>
  <a
    href="https://taiko.xyz/docs/concepts/bridging/the-signal-service"
    target="_blank"
    rel="noreferrer">Read more about bridging at taiko.xyz ↗</a
  >
</section>

<section>
  <form>
    <div>Enter a signal to store on Sepolia:</div>
    <input type="text" placeholder="A signal..." bind:value={signalToSend} />
    <input type="submit" value="Send signal" on:click={sendSignal} />
  </form>
</section>

<section>
  <form>
    <div>Enter a signal to verify on Taiko:</div>
    <input type="text" placeholder="A signal..." bind:value={signalToVerify} />
    <input type="submit" value="Is signal received" on:click={isSignalReceived} />
  </form>
</section>

<section>
  <div>Is signal received: <strong>{isSignalReceivedMessage}</strong></div>
</section>
