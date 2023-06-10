<script lang="ts">
  import { readContract, prepareWriteContract, writeContract } from "@wagmi/core";
  import { fooABI, fooAddress } from "../generated";
  import { foundry, baseGoerli } from "viem/chains";
  import { taiko } from "../domain/chain";
  import { ethereumClient } from "../stores";

  let inputMessage = "";
  let messageFromContract = "";

  async function readMessage() {
    // get current chain id
    const chainId = $ethereumClient.getNetwork().chain?.id ?? foundry.id;

    const data = await readContract({
      address: fooAddress[(chainId as 31337) || 84531 || 167005],
      abi: fooABI,
      functionName: "myString",
    });
    messageFromContract = data;
  }

  async function writeMessage() {
    // get current chain id
    const chainId = $ethereumClient.getNetwork().chain?.id ?? foundry.id;

    const config = await prepareWriteContract({
      address: fooAddress[(chainId as 31337) || 84531 || 167005],
      abi: fooABI,
      functionName: "setMyString",
      args: [inputMessage],
    });
    await writeContract(config.request);
    readMessage();
  }
</script>

<section>Note: Must be connected to local Foundry network (Anvil).</section>
<section>
  <input type="submit" value="Read message" on:click={readMessage} />
  <div style="text-align: center">Message from contract: {messageFromContract}</div>
</section>
<section>
  <form>
    <input type="text" placeholder="Enter some text..." bind:value={inputMessage} />
    <input type="submit" value="Write" on:click={writeMessage} />
  </form>
</section>
