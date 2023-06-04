<script lang="ts">
  import { readContract, prepareWriteContract, writeContract } from "@wagmi/core";
  import { fooABI, fooAddress } from "../generated";
  import { foundry } from "viem/chains";

  let inputMessage = "";
  let messageFromContract = "";

  async function readMessage() {
    const data = await readContract({
      address: fooAddress[foundry.id],
      abi: fooABI,
      functionName: "myString",
    });
    messageFromContract = data;
  }

  async function writeMessage() {
    const config = await prepareWriteContract({
      address: fooAddress[foundry.id],
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
