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

<section>
  <button type="submit" class="btn" on:click={readMessage}>Read message</button>
  <div>Message from contract: {messageFromContract}</div>
</section>
<section>
  <form>
    <input
      type="text"
      class="input input-bordered w-full max-w-xs"
      placeholder="Enter some text..."
      bind:value={inputMessage}
    />
    <button type="submit" class="btn" on:click={writeMessage}>Write</button>
  </form>
</section>
