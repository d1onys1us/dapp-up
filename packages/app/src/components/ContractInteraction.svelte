<script lang="ts">
  // imports
  import { readContract, prepareWriteContract, writeContract } from "@wagmi/core";
  import { onMount } from "svelte";
  import { fooABI, fooAddress } from "../generated";

  // variables
  let inputMessage = "";
  let messageFromContract = "placeholder";

  // functions
  async function readMessage() {
    const data = await readContract({
      address: fooAddress[167002],
      abi: fooABI,
      functionName: "myString",
    });
    messageFromContract = data;
  }

  async function writeMessage() {
    const config = await prepareWriteContract({
      address: fooAddress[167002],
      abi: fooABI,
      functionName: "setMyString",
      args: [inputMessage],
    });
    await writeContract(config);
    readMessage();
  }

  onMount(readMessage);
</script>

<section>
  <div style="text-align: center">Message from contract: {messageFromContract}</div>
</section>
<section>
  <form>
    <input type="text" placeholder="Enter some text..." bind:value={inputMessage} />
    <input type="submit" value="Write" on:click={writeMessage} />
  </form>
</section>
